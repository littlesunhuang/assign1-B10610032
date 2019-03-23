PImage bgImg;
PImage groundhogImg;
PImage lifeImg;
PImage robotImg;
PImage soilImg;
PImage soldierImg;

int soldierX,soldierY;
int robotX,robotY;
//laser
int laserPosition;
int laserSpeed=2;
int laserRange=160;
int robotHandoffsetX=25;
int robotHandoffsetY=37;
int laserLineWeight=10;
float laserMaxLength=30;

void setup() {
	size(640, 480, P2D);
  bgImg=loadImage("img/bg.jpg");
  groundhogImg=loadImage("img/groundhog.png");
  lifeImg=loadImage("img/life.png");
	soilImg=loadImage("img/soil.png");
  robotImg=loadImage("img/robot.png");
  soldierImg=loadImage("img/soldier.png");
  
  //soldier
  //soldierX=720;
  soldierY=400;
  soldierY=floor(random(4)+2);
  soldierY=soldierY*80;
  //robot
  robotX=160;
  robotY=160;
  robotX=floor(random(160,560));
  robotY=floor(random(4)+2);
  robotY=robotY*80;
}

void draw() {
  soldierX+=3;
  soldierX%=720;
  
  
  image(bgImg,0,0);
  image(lifeImg,10,10);
  image(lifeImg,80,10);
  image(lifeImg,150,10);
  image(soilImg,0,160);
  image(soldierImg,soldierX-80,soldierY);
  image(robotImg,robotX,robotY);
  
  
  //gress
  fill(124,204,25);
  noStroke();
  rect(0,145,640,15);
  
  //groundhogImg
  image(groundhogImg,280,80);
  
  
  //sun
  noStroke();
  fill(255,255,0);
  ellipse(590,50,130,130);//outside
  fill(253,184,19);
  ellipse(590,50,120,120);//inside
  
  //laser
  
  laserPosition=(laserPosition+laserSpeed)%(laserRange+robotHandoffsetX);
  
  strokeWeight(laserLineWeight);
  stroke(255,0,0);
  float robotHandX=robotX+robotHandoffsetX;
  float robotHandY=robotY+robotHandoffsetY;
  float laserHeadX=min(robotHandX,robotHandX-laserPosition);
  float laserTailX=min(robotHandX,laserHeadX+laserMaxLength);
  line(laserHeadX,robotHandY,laserTailX,robotHandY);
}
