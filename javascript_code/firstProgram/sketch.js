/*
This is a floating ball program that creates floating balls on mouse click
*/

let balls = [];

function setup() {
	createCanvas(windowWidth, windowHeight);
}

function draw() {
	background(0);

	for (let b of balls)
	{
		b.move();
		b.display();
	}
}

function mousePressed()
{
	var newBall = new floatingBall(mouseX, mouseY);
	balls.push(newBall);
}

class floatingBall
{
	constructor(varX, varY, radius = 15, speed = 5)
	{
		this.x = varX;
		this.y = varY;
		this.r = radius;
		this.speed = speed;
	}

	move()
	{
		this.x = this.x + random(-this.speed, this.speed);
		this.y = this.y + random(-this.speed, this.speed);
	}

	display()
	{
		fill(255);
		ellipse(this.x, this.y, this.r);
	}
}