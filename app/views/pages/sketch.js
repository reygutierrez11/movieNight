function setup() {
  createCanvas(100,100);
}

function draw(){
  background(200);

}

      function setup() {
        createCanvas(300,300);
      }

      let points = Array(-20, 20);
      let pointsy = Array(-20, 20);

      function draw(){
        frameRate(120);
        let num = random(points[0], points[1]);
        let numy = random(pointsy[0], pointsy[1]);

        if (mouseIsPressed){
          fill(0);
        else{
          fill(255);
        }
        rect(touchX, touchY, num, numy);
        }
      }
