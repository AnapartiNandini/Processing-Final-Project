PFont font1; // variable for the font 
PImage penguin; //variable for penguin image
PImage igloo; //variable for igloo image
int xLocation1 = 0; // first variable for x-axis in order to code the movement of the penguin image horizontally across the window
int xLocation2 = 0; // second variable for x-axis in order to code the movement of the penguin image horizontally across the window
int opacity = 0; // variable to set the opacity
int xPosition = 0; // variable set for x-axis in order to code the shooting star
int yPosition = 0; // variable set for y-axis in order to code the shooting star
float time = 0; // vVariable set for the time of the waves in the lights

void setup()
{
  size(800, 800, P3D); // sets the frame of the window to 800 pixles by 800 pixles
  smooth(); // sets the shapes to have smother edges
  font1 = createFont("Times New Roman", 100); // sets font to times new roman and size 30
  penguin = loadImage("Penguin Photo.jpg"); // loads the penguin image into sketch folder thus, allowing me to use the image
  igloo = loadImage("Igloo Photo.jpg"); // loads the igloo image
}

void draw()
{
  background(0); // Sets the background of the window to black

  // The Stars - the following actions will design the appearence of the stars

  fill(255); // sets the color of the stars to white
  noStroke(); // there will be no outline to the stars
  ellipse(random(width), random(600), 5, 5); // the stars will be dispersided all over the frame as the width and height are set to random placements and the size of the stars will be 5 pixles

  // Shooting Star - The following actions will design the appearence of the Shooting Star

  fill(random(256), random(256), random(256)); // color of the star is set to be white
  ellipse(xPosition, yPosition, 10, 10); // the coordinates of the sooting star( 0 pixles on the x-axis {horizontally}, 0 pixles on the y-axis {Vertically}, 10 pixles in width and 10 pixles in height)
  xPosition++; // every time the draw funtion is run the xPosition value (0 pixles) increase by 1 pixle
  yPosition++; // every time the draw funtion is run the yPosition value (0 pixles) increase by 1 pixle

  // Snow - The following actions will design the appearence of the Snow

  fill(255); // sets the color of the snow to white
  noStroke(); // sets the snow to have no outline
  rectMode(CORNERS); // the rectangle will be dran from the corners
  rect(0, 800, 800, 600); // the coordinates of the snow (0 pixles on the x-axis {horizontally}, 800 pixles on the y-axis {vertically}, 800 pixles in width and 600 pixles in height)

  // Igloo Image

  image(igloo, 570, 390, 250, 250);

  // Penguin Image

  image(penguin, xLocation1, 600, 100, 100); // coordinates and size for the first penguin image
  image(penguin, xLocation2, 700, 100, 100); // cordinates and size for the second penguin image 

  if ( xLocation1 >= 790) // the following actions will happen if the turtle image passes 398 pixels on the y axis
  {
    fill(255); // the color of the text is black
    textSize(25); //the the text size will be 100
    textAlign(CENTER); // the text will be in the center
    textFont(font1); // the text font will be what the variable is stated in void setup section 
    text("Shelby, You Won!", 400, 300); //text that will be printed when the turtle image crosses 398 pixles
  }

  if ( xLocation2 >= 790) // the following actions will happen if the rabbit image passes 398 pixels on the y axis
  {
    fill(255); // the color of the text is black
    textSize(25); //the the text size will be 100
    textAlign(CENTER); // the text will be in the center
    textFont(font1); // the text font will be what the variable is stated in "void setup" section 
    text("Chester, You Won!", 400, 300); //text that will be printed when the rabbit image crosses 398 pixles
  }
  stroke(0); // the outline of the text is set to the color black
  strokeWeight(2); // the thickness of the outline
  textSize(100); // the size of the message is 100 pixles
  fill(mouseX, mouseY, mouseY, opacity);  //Set the color for the "RACE DAY!!!" message to be transparent until the opacity variable increases with mouse clicks. Also if you hover ofer diferent areas of the text then, it changes color.
  text("RACE DAY!!!", 110, 350 ); // The "RACE DAY!!!" message will be displayed at the center of hte window

  //Northern Lights - The following actions will design the appearence of the Nothern Lights
  
  float xAxis = 0; //Variable set for x-axis. It is placed in the 'draw' section because it requires to be re-run every time the funtion is drawn

  while (xAxis < width) // while the value for xAxis(0 pixles) is less tahn the width.. 
  {
    stroke(mouseY, mouseX, mouseY); //the color of the lights will change as the cursor moves over different areas of the screen
    line(xAxis, 100 + 200 * noise(xAxis / 100, time), xAxis, 0); // the line will be designed in a wave form
    xAxis = xAxis + 1; // everytime the draw funtion is run the value for the xAxis(0 pixles) wil increase be 1 pixle
  }
  
  time = time + 0.02; // the value for time will increase by 0.02 pixles every time the draw function is run
}

void keyPressed() {

  if (key == 'a' || key == 'A') // the first Pengiun(Shelby) image will move 10 pixles horizontally everytime the "a" key is pressed
  {
    xLocation1 = xLocation1 + 10;
  }

  if (key == 'l' || key == 'L') // the second Penguin(Chester) image will move 10 pixles horizontally everytime the "l" key is preesed
  {
    xLocation2 = xLocation2 + 10;
  }
}
void mouseClicked()
{
  opacity += 250; //Increase the opacity of the "RACE DAY!!" message text every time the mouse gets clicked
}

/**
 1)  My four (or more) text, images, and/or shapes are:
       - "RACE DAY!!!" (Text)
       - "Chester, You Won!" (Text)
       - "Shelby, You Won!" (Text)
       - Penguin Photo (Used Twice)
       - Igloo Photo (Used Once)
       - Ellipse Shape ( Used 2 times: For Stars and For Shooting Star)
       - Rectangle Shape (Used Once: For Snow on the Ground)
       - Line (Used Once in the Northern Lights)
 
 2)  My one (or more) self-taught animation is/are (PLEASE INCLUDE LINKS):
       - Stars Blinking In The Night 
           Link: http://funprogramming.org/22-Stars-blinking-at-night-fade-out-effect.html
       - Northern Lights
           Link: http://funprogramming.org/38-Animate-the-ocean-surface-using-noise.html
 
 
 3)  My four (or more) animations that were not learned from online tutorials are:
       - "RACE DAY!!!" message Fades In
       - "RACE DAY!!!" message changes color depending on where the mouse hovers over the text
       - "Chester,You Won" and "Shelby, You Won" are mesagges which apper once the pengiun associated to each respective message crosses the 'finish' line
       - The Shooting Star which moves across the window from coordinates 0,0 pixles to 800,800 pixles in a diagonal manner
       - The penguin Images move horizonatally across the window
       - Northern Lights change color depending on where the cursor hovers over the sceen
 
 4)  When you press the 'a' or 'A' key, this happens:
       - The first Penguin Image who is called Shelby, moves horizontally across the window
 
 5)  When you press the 'l' or 'L' key, this happens:
       - The second Penguin Image who is called Chester, moves horizontally across the window
 
 6)  When you click the mouse, this happens:
       - The value for 'opacity' increases by ten pixles as a result making the "RACE DAY!!!" message become visible
 
 */
