Image backImage=new Image();
Image net=new Image();
Image ball=new Image();
Image heart1=new Image();
Image heart2=new Image();
Image heart3=new Image();
Image frame=new Image();
Music backMusic=new Music();
Music success=new Music();
Music failed=new Music();
Text p=new Text();
Text win=new Text();
Text lose=new Text();
SplashScreen scr=new SplashScreen();
int newx,newy;
int life=3;
int points=0;
void setup() {
  size(1024, 512);
  backImage.setImage("basketfield.jpg");
  net.setImage("net.png");
  ball.setImage("ball.png");
  heart1.setImage("heart.png");
  heart2.setImage("heart.png");
  heart3.setImage("heart.png");
  frame.setImage("frame.png");
  backMusic.load("backgroundmusic.mp3");
  backMusic.play();
  success.load("success.mp3");
  failed.load("failed.mp3");
  scr.gameName="RockNRole";
  scr.backgroundColor=(#FF8D00);
  scr.gameAuthor1="Bhaa Swied";
  scr.gameAuthor2="";
  scr.image="entero.png";
  p.x=950;
  p.y=45;
  p.brush=color(0);
  p.alpha=255;
  p.text="0";
  p.textSize=25;
  p.font="Arial";
  lose.x=200;
  lose.y=295;
  lose.brush=color(#FF0000);
  lose.text="YOU LOSE:(";
  lose.textSize=100;
  lose.font="Arial";
  win.x=250;
  win.y=295;
  win.brush=color(#00FF01);
  win.alpha=255;
  win.text="YOU WIN!";
  win.textSize=100;
  win.font="Arial";
  backImage.width=1024;
  backImage.height=512;
  net.width=100;
  net.height=100;
  heart1.width=30;
  heart1.height=30;
  heart2.width=30;
  heart2.height=30;
  heart3.width=30;
  heart3.height=30;
  frame.width=1400;
  frame.height=916;
  frame.x=-200;
  frame.y=-200;
  ball.width=50;
  ball.height=50;
  ball.x=100;
  ball.y=0;
  ball.direction= Direction.DOWN;
  ball.speed=10;
  net.x=464;
  net.y=412;
  heart1.x=40;
  heart1.y=22;
  heart2.x=80;
  heart2.y=22;
  heart3.x=120;
  heart3.y=22;
}

void draw() {
  backImage.draw();
  if(scr.show()==false){
  p.draw();
  
  if(points<10 && life>0){
    if(points>7){frame.draw();p.text=""+points;} 
  net.draw();
  ball.draw();
  p.text=""+points;
  if(life>0)
  heart1.draw();
  if(life>1)
  heart2.draw();
  if(life>2)
  heart3.draw();
  if(ball.y>height-20){
    if(net.pointInShape(ball.x,ball.y)){success.play();
        points++;
        if(points%2==0){
         ball.speed+=5; 
        }
    }
    else{ 
      failed.play();
      life--;  
    }
    ball.x=(int)random(50,975);
    ball.y=0;
  }
  }else{
   if(points==10) {win.draw();p.text=""+points;}
   else if(life==0)lose.draw();
    
    
  }
  }
}

void mousePressed(){
  newx=mouseX;
}


void keyPressed(){
  
  if(keyCode==RIGHT){
    if(!(net.x>945))
    net.x=net.x+20;
  } 
  if(keyCode==LEFT){
    if(!(net.x<-30))
    net.x=net.x-20;
  }
}
