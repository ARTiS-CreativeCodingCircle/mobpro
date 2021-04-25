void setup() {
    size(640, 360); // ウィンドウの大きさを決める
    background(0); // 背景の色を決める
    blendMode(LIGHTEST);
   // colorMode(HSB);
}

float r;//円の大きさ
float no;//一次元ノイズ用
float ra1,ra2;
float no_store;
void draw() {
   /* r=270*sin(frameCount*0.01);
    noStroke();
    push();
    translate(width/2.0,height/2.0);
    beginShape();
    for(float i=0;i<=TAU;i+=PI/180.0){
        ra1=random(0.4,0.9);
        ra2=random(0.4,0.9);
        no=noise(frameCount*0.01,i);
        if(i==0){
            no_store=no;
        }
        //fill(255*sin(frameCount*0.5),10,100,1);
        noFill();
        stroke(255*sin(frameCount*0.03),255,map(i,0,TAU,255,200),20);
        vertex(1.1*r*cos(i)*no,r*sin(i)*no);
    }
    vertex(1.1*r*cos(TAU+PI/180.0)*no_store,r*sin(TAU+PI/180.0)*no_store);
    endShape();
    pop();*/
   // println(frameCount);
     for(float y=100;y<=360;y+=100){
     for(float x=100;x<=540;x+=100){
   silk(x+25,y-10);
     }
   }
    if(frameCount >= 360) {
        save("frame/jellyfishDance.png");
        noLoop();
    }
}

void silk(float x,float y){
    r=50*sin(frameCount*0.01);
    noStroke();
    push();
    translate(x,y);
   // rotate(frameCount*0.01);
    beginShape();
    for(float i=0;i<=TAU;i+=PI/1800.0){
        ra1=random(0.4,0.9);
        ra2=random(0.4,0.9);
        no=noise(frameCount*0.01,i+x%y);
        if(i==0){
            no_store=no;
        }
        //fill(255*sin(frameCount*0.5),10,100,1);
        noFill();
        strokeWeight(0.5);
       stroke(255*sin(frameCount*0.03),255,map(i,0,TAU,255,240),5);
      // stroke((x+y)/2.0,5);
        vertex(1.1*r*cos(i)*no,r*sin(i)*no);
    }
    vertex(1.1*r*cos(TAU+PI/180.0)*no_store,r*sin(TAU+PI/180.0)*no_store);
    endShape();
    pop();
}

/*void keyPressed() {
    if(key == 'p') noLoop();
}*/