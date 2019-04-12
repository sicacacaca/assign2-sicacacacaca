
PImage bg,soilImg,lifeImg,hogImg,soldierImg,cabbageImg;
PImage title,start1,start2,restart1,restart2,gameover;
int soldierX,soldierY,soldierSpeed;
int cabbageX,cabbageY;
int hogX,hogY;
int lifeX1,lifeX2,lifeX3;

final int GAME_START=1;
final int GAME_PLAY=2;
final int GAME_OVER=3;

int gameState;

void setup() {
	size(640, 480, P2D);

// load images
	bg=loadImage("img/bg.jpg");
  hogImg=loadImage("img/groundhogIdle.png");
  soilImg=loadImage("img/soil.png");
  soldierImg=loadImage("img/soldier.png");
  lifeImg=loadImage("img/life.png");
  cabbageImg=loadImage("img/cabbage.png");
  title=loadImage("img/title.jpg");
  start1=loadImage("img/startNormal.png");
  start2=loadImage("img/startHovered.png");
  restart1=loadImage("img/restartNormal.png");
  restart2=loadImage("img/restartHovered.png");
  gameover=loadImage("img/gameover.jpg");
  
  gameState = GAME_START;
 
//soilderMoving
  soldierY=floor((random(4))+2)*80;
  soldierX=-80;
  soldierSpeed=2;
  
//cabbagePosition
  cabbageX=floor(random(8))*80;
  cabbageY=floor((random(4))+2)*80;
  
//hogMoving
  hogX=width/2;
  hogY=80;
  
//lifeposition
  lifeX1=10;
  lifeX2=80;
  lifeX3=-300;

}

void draw() {
  
  background(title);
  
// Switch Game State
  switch (gameState){  

    // Game Start
    case GAME_START:
     hogX=width/2;//fix
     hogY=80;
     
// mouse action
     if (mouseX>248  && mouseX<248+144 && mouseY>360 && mouseY< 360+60){
      if (mousePressed){
        gameState = GAME_PLAY;
      }else{image(start2,248,360);
       }
    }else{image(start1,248,360);
      }
      break;




    
// Game Run

  case GAME_PLAY:
  
  background(bg);
  image(soilImg,0,160);
  
//fix


//grass
  colorMode(RGB);
  fill(124,204,25);
  noStroke();
  rectMode(CORNERS);
  rect(0,145,640,160);
  
//sun
  fill(254,184,19);
  strokeWeight(5);
  stroke(255,255,0);
  ellipse(590,50,120,120);
  
//life
  image(lifeImg,lifeX1,10);
  image(lifeImg,lifeX2,10);
  image(lifeImg,lifeX3,10);

//soilder
  soldierX=soldierX+soldierSpeed;
  if(soldierX>=640){
    soldierX=-80;}
  image(soldierImg,soldierX,soldierY);
  
//cabbage
  image(cabbageImg,cabbageX,cabbageY);
          
        
//edge
  if(hogX<=0){
  hogX=0;}
  
  if(hogX>=width-80){
  hogX=width-80;}
  
  if(hogY>=height){
  hogY=height-80;}
  
//eat cabbage
  if(hogX==cabbageX && hogY==cabbageY){
    if(lifeX2==80){lifeX3=150;}//2 to 3
    if(lifeX2==-200 && lifeX1 ==10){lifeX2=80;}//1 to 2
    cabbageX=-100;}
  
//meet sooldier
  if(hogX < soldierX+80 && hogX+80 > soldierX && hogY < soldierY+80 && hogY+80 > soldierY ){
    hogX=width/2;
    hogY=80;
  if(lifeX1==10 && lifeX2==80 && lifeX3==150){ lifeX3=-300;//3 to 2
    hogX=width/2;
    hogY=80;}
  else if(lifeX1==10 && lifeX2==80 && lifeX3 == -300){ lifeX2=-200;//2 to 1
     hogX=width/2;
     hogY=80;}
  else if(lifeX1==10 && lifeX2==-200 && lifeX3 ==-300){ //1 to 0 
     gameState=GAME_OVER;}}

     //groundhog
  image(hogImg,hogX,hogY);
     break;
 
    
case GAME_OVER:   
  background(gameover);     
  if (mouseX>248  && mouseX<248+144 && mouseY>360 && mouseY< 360+60){
  if (mousePressed){
  
    hogX=width/2;//fix
     hogY=80;
     
  gameState = GAME_PLAY;
  
  lifeX1=10;
  lifeX2=80;
  lifeX3=-300;
  
  soldierX=-80;
  soldierY=floor((random(4))+2)*80;
  
  cabbageX=floor(random(8))*80;
  cabbageY=floor((random(4))+2)*80;
      }else{image(restart2,248,360);
       }
    }else{image(restart1,248,360);
      }
      break;
 }
 }
  
  void keyPressed(){
  
  if(key==CODED){
    switch (keyCode){
      case DOWN:
        hogY+=80;
        break;
      case LEFT:
        hogX-=80;
        break;
      case RIGHT:
        hogX+=80;
        break;
        }}}
