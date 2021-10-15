int blocks=280;
float velocity = 0.01;
float size = 30;
boolean showText = false;
boolean showFPS = false;

void setup()
{
  size(1400, 800, P3D);
}

void draw()
{
  background(0);
  textAlign(LEFT);
  textSize(30);
  text("3D Cube Simulator", 30, 30);
  text("Press ' h ' for help or to reset colours", 30, 70);

  if (showText)
  {
    fill(255);
    textAlign(LEFT);
    textSize(20);
    text("Press ' r '  -  RED", 30, 150);
    text("Press ' g '  -  GREEN", 30, 180);
    text("Press ' b '  -  BLUE", 30, 210);
    text("Press ' y '  -  YELLOW", 30, 240);
    text("Press ' p '  -  PINK", 30, 270);
    text("Press ' ? '  -  RANDOM COLOUR", 30, 300);
    text("Press ' 1 '  -  increase velocity", 30, 360);
    text("Press ' 2 '  -  decrease velocity", 30, 390);
    text("Press ' 3 '  -  increase blocks size", 30, 450);
    text("Press ' 4 '  -  decrease blocks size", 30, 480);
    text("Press ' 5 '  -  increase cube size", 30, 540);
    text("Press ' 6 '  -  decrease cube size", 30, 570);
    text("Press ' f '  -  display FPS counter", 30, 630);
  }

  if (showFPS)
  {
    textSize(30);
    text(frameRate, 1300, 30);
  }

  translate(width/2, height/2, -blocks); // the cube is located at the middle of the screen
  rotateY(frameCount*velocity); // allows the cube to rotate in 3 different dimensions (x,y,z)
  rotateX(frameCount*velocity);
  rotateZ(frameCount*velocity);

  for (int row=-blocks; row<=blocks; row+=50) // used loops to create blocks and rotate them in 3 different dimensions
  {
    for (int col=-blocks; col<=blocks; col+=50)
    {
      for (int dep=-blocks; dep<=blocks; dep+=50)
      {
        pushMatrix();
        translate(row, col, dep);
        rotateX(frameCount*(velocity*2));
        rotateY(frameCount*(velocity*2));
        rotateZ(frameCount*(velocity*2));
        box(size);
        popMatrix();
      }
    }
  }
}

void keyPressed()
{
  if ((key == 'r' || key == 'R')) // red
  {
    fill(255, 0, 0);
  } else if ((key == 'g' || key == 'G')) // green
  {
    fill(0, 255, 0);
  } else if ((key == 'b' || key == 'B')) // blue
  {
    fill(0, 0, 255);
  } else if ((key == 'y' || key == 'Y')) // yellow
  {
    fill(#FFF300);
  } else if ((key == 'p' || key == 'P')) // pink
  {
    fill(#FF00EF);
  } else if ((key == '?')) // random colour generator
  {
    fill(random(0, 255), random(0, 255), random(0, 255));
  } else if ((key == '1')) // velocity increase
  {
    velocity = velocity+0.002;
  } else if ((key == '2')) // velocity decrease
  {
    velocity = velocity-0.002;
  } else if ((key == '3')) // block size increase
  {
    size = size+2;
  } else if ((key == '4')) // block size decrease
  {
    size = size-2;
  } else if ((key == '5')) // increase cube size
  {
    blocks = blocks+20;
  } else if ((key == '6')) // decrease cube size
  {
    blocks = blocks-20;
  } else if ((key == 'h' || key == 'H')) // display help message
  {
    showText = !showText;
  } else if ((key == 'f' || key == 'F')) // display fps counter
  {
    showFPS = !showFPS;
  }
}
