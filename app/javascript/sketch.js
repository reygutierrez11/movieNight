function setup() {
  let canvasDiv = document.getElementById('sketch-holder');
  let width = canvasDiv.offsetWidth;
  console.log(width);
  let canvas = createCanvas(width,25);
  canvas.parent("sketch-holder");
  background(220);
}

function draw(){
  frameRate(40);
  let num = Math.floor(Math.random() * 40 -20  ); 
  let numy = Math.floor(Math.random() * 40 -20  );
 
  //rect(mouseX, mouseY, num, numy);
  //rect(30, 30, 40, 40);
  if (mouseIsPressed === true){
    fill(0);
  }
  else{
    fill(255);
  }
  rect(mouseX, mouseY, num, numy);
}
