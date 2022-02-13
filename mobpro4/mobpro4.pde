float x = 0, y = 0, length = 200;
void setup() {
    fullScreen();
    // size(600, 600);
    colorMode(HSB, 360, 100, 100, 100);
    x = width;
    y = height;
    background(0);
    blendMode(LIGHTEST);
}

float rad = 0, xoff = 0, yoff = 0;
int scale = 15;

boolean isLine = true;

// 保存する画像の名前に使うやつです
int take = 9;
void draw() {
    if(isLine) stroke(random(0,360), random(50,80), random(50, 80),5);
    else stroke(random(0,360), random(50,80), random(50, 80),1);
    translate(x / 2, y/ 2);
    rotate(rad);
    line(0, 0, length, length);
    fill(map(length,100,250,0,360), random(50, 80), random(50, 80), 1);
    ellipse(0,0,length,length);
    rad += 0.05;
    xoff += 0.05;
    yoff += 0.03;
    length = 100 + 150 * sin(rad);
    scale = 15 + int(10 * sin(rad));
    x += (noise(xoff) - 0.475) * scale;
    y += (noise(yoff) - 0.475) * scale;
    if(x > width * 2) {
        x = 1;
    } else if(x < 0) {
        x = width * 2 - 1;
    }
    if(y > height * 2) {
        y = 1;
    } else if(y < 0) {
        y = height * 2 - 1;
    }
}

int frame = 0;
void keyPressed() {
    if(key == 's') {
        save("frame/take" + take + "/" + frame + ".png");
        frame++;
    }
}

