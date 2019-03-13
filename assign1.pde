PImage bgImg;
PImage groundhogImg;
PImage lifeImg;
PImage robotImg;
PImage soilImg;
PImage soldierImg;

int soldierX,soldierY;
int robotX,robotY;
//laser
int speedX;
int lineX;//lineX=robotrX+25
int lineDistanceX;

void setup() {
	size(640, 480, P2D);
  bgImg=loadImage("img/bg.jpg");
  groundhogImg=loadImage("img/groundhog.png");
  lifeImg=loadImage("img/life.png");
	soilImg=loadImage("img/soil.png");
  robotImg=loadImage("img/robot.png");
  soldierImg=loadImage("img/soldier.png");
  
  //soldier
  soldierX=220;
  soldierY=400;
  soldierY=floor(random(4)+2);
  soldierY=soldierY*80;
  //robot
  robotX=160;
  robotY=160;
  robotX=floor(random(160,560));
  robotY=floor(random(4)+2);
  robotY=robotY*80;
  //laser
  
  lineX=robotX+25;
  
}

void draw() {
  soldierX+=3;
  soldierX%=640;
  
  
  
  image(bgImg,0,0);
  image(lifeImg,10,10);
  image(lifeImg,80,10);
  image(lifeImg,150,10);
  image(soilImg,0,160);
  image(robotImg,robotX,robotY);
  image(soldierImg,soldierX,soldierY);
  
  //gress
  fill(124,204,25);
  noStroke();
  rect(0,145,640,15);
  
  //groundhogImg
  image(groundhogImg,320,80);
  
  
  //sun
  fill(253,184,19);
  stroke(255,255,0);
  strokeWeight(5);
  ellipse(590,50,120,120);
  
  //laser
  stroke(255,0,0);
  strokeWeight(10);
  
  lineDistanceX=speedX%160;
  line(lineX-lineDistanceX,robotY+37,lineX-lineDistanceX-40,robotY+37);
  speedX+=2;
}
