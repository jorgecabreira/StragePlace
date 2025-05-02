import oscP5.*;
import netP5.*;

OscP5 oscP5;
float amplitude = 0;

void setup() {
  size(400, 400);
  oscP5 = new OscP5(this, 12000); // Listen on port 12000
}

void draw() {
  background(0);
  fill(255);
  ellipse(width/2, height/2, amplitude * 400, amplitude * 400);
}

void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/rms")) {
    amplitude = msg.get(0).floatValue();
  }
}
