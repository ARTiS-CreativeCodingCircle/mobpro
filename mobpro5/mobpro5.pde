// Sakura sakura = new Sakura(300, 300);
ArrayList<Sakura> sakura = new ArrayList<Sakura>();
int sakuraCount = 50;
Cloud cloud;

void setup() {
    size(800, 600);
    background(255);
    // strokeWeight(8);
    for(int i = 0; i < sakuraCount; i++) {
        sakura.add(new Sakura(random(0, width), random(0, height - 50)));
    }
    colorMode(HSB, 360, 100, 100);
    cloud = new Cloud(width / 8, 140, 200);
    
}

void draw() {
    // sakura.display();
    background(255);
    for(int i = 0; i < height; i++) {
        stroke(190, map(i, 0, height, 100, 0), 100);
        line(0, i, width, i);
    }
    cloud.display();

    // 桜部分
    for(int i = 0; i < sakura.size(); i++) {
        pushMatrix();
        translate(sakura.get(i).x, sakura.get(i).y);
        float ratio = PI / 6 * sin(sakura.get(i).theta);
        rotate(map(ratio, -PI/6, PI/6, -PI/3, 0));
        fill(#e6cfe3);
        stroke(#f03469);
        sakura.get(i).display();
        sakura.get(i).update();
        popMatrix();

        if(sakura.get(i).checkChill()) {
            sakura.set(i, new Sakura(random(0, width), -10));
        }
    }
}

// 画像並べ用変数
int frame = 1;
// キーボードが押された時に呼ばれる
void keyPressed() {
    if(key == 's'){
        save("frame/" + frame + ".png");
    }
}

class Sakura { // Cherry
    float x, y, r, dx;
    float theta = random(0, 1);

    Sakura(float _x, float _y) {
        this.x = _x;
        this.dx = _x;
        this.y = _y;
    }

    void update() {
        this.theta += 0.03;
        this.x = this.dx + (sin(this.theta) * 20);
        this.y += random(1, 3);
    }

    void display() {
        float newX, newY;
        beginShape();
        for(float i = PI / 15; i < PI / 3.1; i += PI / 90) {
            this.r=acos(cos(5*i))-0.5*acos(cos(15*i));
            newX = r*cos(i) * 12;
            newY = r*sin(i) * 12;
            vertex(newX, newY);
            point(newX, newY);
        }
        endShape();
    }

    boolean checkChill() {
        if(this.y > height) {
            return true;
        } else {
            return false;
        }
    }
}

class Cloud{
    float cx, cy;
    float size;
    float vertical = 30;

    Cloud(float _cx, float _cy, float _size){
        cx = _cx;
        cy = _cy;
        size = _size;
    }

    void display(){
        strokeWeight(1);
        stroke(0);
        fill(280, 0, 100);
        rect(cx - (size / 10), cy - vertical, size, vertical, 20);
        rect(cx + (size / 12), cy + vertical, size * 1.3, vertical, 20);

        noStroke();
        rect(cx + (size / 8), cy - (vertical / 2), vertical, size/3);
        stroke(0);
        line(cx + (size / 8), cy, cx + (size / 8), cy + vertical);
        line(cx + (size / 8) + vertical, cy, cx + (size / 8) + vertical, cy + vertical);
    }

    void update(float t){
        //cx += cos(t);
        cy += sin(t);
    }
}