int winX = 1366;
int winY = 768;
int FPS = 60000;

boolean draw = false;
int[][] fall = new int[winX][winY];
int[] stack = new int[winY];
boolean falls = true;
int neighbors = 0;
int c;
int n = 0;

void setup(){
  background(0,0,0);
  size(winX, winY);
  noStroke();
  frameRate(FPS);
  noSmooth();
  
} // End Setup


void draw(){
  background(0);
  fill(55,250,0);
  for(int i = 1; i < fall.length; i++){
    neighbors = 0;
    for(int j = 1; j < fall[i].length; j++){
      if(draw == true && mouseY > 0 && mouseY < winY && mouseX > 0 && mouseX < winX){
        fall[mouseX][mouseY] = 1;
        
      } if(fall[i][j] == 1){
        rect(i,j,1,1);
        c = (int)random(1,8+1+5);
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

       while(n < 8){
         n++;
          if(n == 1){
          if(fall[i-1][j-1] == 1){neighbors++;}
        } else if(n == 2){
          if(fall[i+1][j+1] == 1){neighbors++;}
        } else if(n == 3){
          if(fall[i+1][j+0] == 1){neighbors++;}
        } else if(n == 4){
          if(fall[i+0][j+1] == 1){neighbors++;}
        } else if(n == 5){
          if(fall[i-1][j-0] == 1){neighbors++;}
        } else if(n == 6){
          if(fall[i-0][j-1] == 1){neighbors++;}
        } else if(n == 7){
          if(fall[i-1][j+1] == 1){neighbors++;}
        } else if(n == 8){
          if(fall[i+1][j-1] == 1){neighbors++;}
        }
       }
        if((int)random(0,2) == 1 && neighbors > 4 && neighbors < 1){
          fall[i][j] = 1;
        }
        n = 0;
      }
    }
    
  }
  fill(255);
  text("'Green' Life, Experiment 002",0,12);
  text("Click anywhere to spark life into existence.",0,28);
  text("FPS: "+(int)frameRate+" Screen Size: "+winX+"x"+winY,0,44);
  text("Made by: VOX, 2015",winX-120,12);
} // End Draw

void mousePressed() { draw = true; } void mouseReleased() { draw = false; }
void keyPressed() {}
