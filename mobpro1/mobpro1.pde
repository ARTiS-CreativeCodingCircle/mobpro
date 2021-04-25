// 7色にひかる四角

void setup() {
    size(640, 360); // 640*360の大きさ
    colorMode(HSB, 360, 100, 100, 100);
    background(0); // 背景に色を塗りました
    rectMode(CENTER);
    noFill();
}

boolean frag = true;
float next = 10;

void draw() {
    if(frameCount % next == 0) {
        frag = !frag;
        next = floor(random(40, 120));
    }
    if (frag) {
        stroke(frameCount%360, 0, 100, 30);
    } else {
        stroke(frameCount%360, 100, 100, 30);
    }
    // 四角を回したい
    push();
    translate(width/2, height/2);
    rotate(frameCount/360.0*TWO_PI);
    rect(0, 0, 300-frameCount, 300-frameCount, random(100));
    pop();

    if(300-frameCount < -680){noLoop();}
}

void keyPressed() {
    if(key == 'p'){
        save("frame/sinzou.png");
    }
}