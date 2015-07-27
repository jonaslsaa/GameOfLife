int winX = 1366;
int winY = 768;
int FPS = 60000;

boolean draw = false;
int[][] fall = new int[winX][winY];
int[][] used = new int[winX][winY];
boolean falls = true;
float c;
int cc = 0;

void setup(){
  background(0,0,0);
  size(winX, winY);
  noStroke();
  frameRate(FPS);
  noSmooth();
  c = random(1,100+1);
  cc = (int)random(1,6);
} // End Setup


void draw(){
  background(0);
  fill(55,250,0);
  for(int i = 1; i < fall.length; i++){
    for(int j = 1; j < fall[i].length; j++){
      
      if(draw == true && mouseY > 0 && mouseY < winY && mouseX > 0 && mouseX < winX){
        fall[mouseX][mouseY] = 1;
        
      } if(fall[i][j] == 1){
        rect(i,j,1,1);
        if(cc != 0){
          cc -= 1;
        } else{c = random(1,100+1); cc = (int)random(1,6); }
        if(used[i][j] != 1 && i+1 < winX && i-1 > 0 && j < winY && j > 0){
            if(c <= 40){
              fall[i-1][j-1] = 1;
            } else if(c <= 80 && c > 40){
              fall[i+1][j-1] = 1;
            } else if(c <= 90 && c > 80){
              fall[i+1][j+0] = 1;
            } else if(c <= 100 && c > 90){
              fall[i-1][j+0] = 1;
            }
            used[i][j] = 1;
          }
        }
      }
    }
  fill(255);
  text("'Vine' Life, Experiment 003",0,12);
  text("Click anywhere to spark life into existence.",0,28);
  text("FPS: "+(int)frameRate+" Screen Size: "+winX+"x"+winY,0,44);
  text("Made by: VOX, 2015",winX-120,12);
} // End Draw

void mousePressed() { draw = true; } void mouseReleased() { draw = false; }
void keyPressed() {}
