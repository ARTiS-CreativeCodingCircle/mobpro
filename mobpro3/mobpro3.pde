PGraphics pg;
int[] sizeX;

void setup() {
    size(1280, 720);
    background(255);
    pg = createGraphics(width, width);
    imageMode(CENTER);

    sizeX = new int[3];
    for (int i = 0; i < 3; i++) {
        sizeX[i] = int(random(width/4, width));
    }
}

float eSize = 1;
float pos = 0;

void draw() {
    pg.beginDraw();
    pg.translate(pg.width / 2, pg.height / 2);
    pg.rotate(radians(frameCount));
    //pg.fill(random(0, 255), random(0, 255), random(0, 255), 20);
    //pg.fill(0);
    //pg.noStroke();
    pg.ellipse(pos, pos, eSize, eSize);
    pg.endDraw();

    background(255, 70);

    for (int i = -1; i <= 1; i++) {
        push();
        translate(width / 2 + i*300, height / 2);
        rotate(radians(-frameCount));
        image(pg, 0, 0, sizeX[i+1], sizeX[i+1]);
        pop();
    }

    eSize += 0.1;
    pos += 0.1 + frameCount/10000.0;
}

void keyPressed() {
    if(key == 's') save("frame/baseSpiral.png");
}