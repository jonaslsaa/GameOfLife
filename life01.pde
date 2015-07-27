int winX = 800;
int winY = 600;
int FPS = 60;

boolean draw = false;
int[][] fall = new int[winX][winY];
int[] stack = new int[winY];
boolean falls = true;
int c;

void setup(){
  background(0,0,0);
  size(winX, winY);
  noStroke();
  frameRate(FPS);
  noSmooth();
  
} // End Setup


void draw(){
  background(0);
  fill(255);
  for(int i = 1; i < fall.length; i++){
    for(int j = 1; j < fall[i].length; j++){
      if(draw == true){
        fall[mouseX][mouseY] = 1;
        
      } if(fall[i][j] == 1){
        rect(i,j,1,1);
        c = (int)random(1,8+1+9);
        if(c == 1){
          fall[i-1][j-1] = 1;
        } else if(c == 2){
          fall[i+1][j+1] = 1;
        } else if(c == 3){
          fall[i+1][j+0] = 1;
        } else if(c == 4){
          fall[i+0][j+1] = 1;
        } else if(c == 5){
          fall[i-1][j-0] = 1;
        } else if(c == 6){
          fall[i-0][j-1] = 1;
        } else if(c == 7){
          fall[i-1][j+1] = 1;
        } else if(c == 8){
          fall[i+1][j-1] = 1;
        } else if(c > 8){fall[i][j] = 0; }
        
        if((int)random(0,2) == 1){
          fall[i][j] = 1;
        }
      }
    }
    
  }
} // End Draw

void mousePressed() { draw = true; } void mouseReleased() { draw = false; }
void keyPressed() {}
