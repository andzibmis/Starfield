Particle [] num1;
void setup() {
	size (400, 400);
	num1 = new Particle [2000];
	for (int x = 0; x < num1.length; x ++) {
		num1 [x] = new Particle ();
	} 
	num1 [0] = new OddballParticle ();
	num1 [1] = new ShipParticle ();
}
void draw() {
	background (0);
    for (int x = 0; x < num1.length; x ++) {
    	num1 [x].show ();
    	num1 [x].move ();
    }
}
class Particle {
	double myX, myY, mySpeed, myAngle;
	int mySize, myColor;
	Particle () {
		myX = myY = 200;
		mySize = 5;
		mySpeed = Math.random () * 10;
		myAngle = Math.random () * 2 * Math.PI;
		myColor = (int)(Math.random () * 100);
	}
	void show () {
		stroke ((int)(Math.random () * 155));
		fill (myColor);
		ellipse ((float)myX, (float)myY, mySize, mySize);
	}
	void move () {
		myX = myX + (Math.cos (myAngle) * mySpeed);
		myY = myY + (Math.sin (myAngle) * mySpeed);
	}
} 
class OddballParticle extends Particle {
	OddballParticle () {
		myX = myY = 200;
		mySize = 10;
	}
	void show () {
		stroke ((int)(Math.random () * 155 + 100));
		fill (255, 0, 0);
		rect ((float)myX, (float)myY, mySize, mySize);
	}
	void move () {
		if (mouseX > myX) {
			myX = myX + (int) (Math.random () * 5) - 3;
		}
		else {
			myX = myX + (int) (Math.random () * 5) - 1;
		}
		if (mouseY > myY) {
			myY = myY + (int) (Math.random () * 5) - 3;
		}
		else {
			myY = myY + (int) (Math.random () * 5) - 1;
		}
		if (myX > 375) {
			myX = 375;
		}
		if (myX < 15) {
			myX = 15;
		}
		if (myY > 375) {
			myY = 375;
		}
		if (myY < 15) {
			myY = 15;
		}
	}
}
class ShipParticle extends Particle {
	ShipParticle () {
		myX = myY = 200;
		mySize = 10;
	}
	void show () {
		stroke (255);
		fill (100);
		rect ((float)myX, (float)myY, mySize , mySize);
	}
	void move () {
		myX = mouseX;
		myY = mouseY;
	}
}

