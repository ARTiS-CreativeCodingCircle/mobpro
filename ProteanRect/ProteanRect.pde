// 七色に光り輝く「ゲーミング角丸四角」をつくります！！
void setup() {
    size(500,500);
    colorMode(HSB, 360, 100, 100, 100);
    background(360);
    rectMode(CENTER);
    noiseSeed(5);
    rectX = 0;
    rectY = 0;
}

float col = 0; // 色相を決める変数
float rectX = 0; // 角丸四角の中心x座標
float rectY = 0; // 角丸四角の中心y座標
float angle = 0; // 角丸四角を回転する角度
float edge = 10;
boolean move = false;
float noise = 0;

// 1秒間に60回実行される
void draw() {
    translate(width/2, height/2);// 原点を画面の中心に移動 
    background(0); // 背景を白くする
    rotate(angle); // 画面を回転させる
    if(move)angle+=0.05; // 角度をずらす
    noStroke(); // 枠線を消す
    
    fill(col % 360, 100, 70, 100); // 角丸四角の色を決める
    col += 0.5; // 少しずつ色を変えていく
    rect(rectX, rectY, width/3, height/3, edge); // 角丸四角を描く
    noise = noise(col / 10);
    edge = 800 * (noise - 0.5); // 角の丸を変えていく

    // 角丸の値がどう変化しているかを出してみる
    if(frameCount % 10 == 0){
        //println("edge: " + edge);
        //println("noise: " + (noise - 0.5));
    }

    if(frameCount % 180 == 0){
        move = !move;
    }
}
// キーボードが押された時の動き
void keyPressed() {
    if(key == 'p'){
        move = !move;
    }
}