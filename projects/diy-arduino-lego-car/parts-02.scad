use <../../modules/motors/micro-motors-l149.scad>;
use <../../modules/lego.scad>;
use <../../external/Arduino_base/arduino.scad>;


$fn=30;

x = 8;
y = 5;
z = 2;
difference() {
	union() {
		translate([ - xLegoStep(x) / 2 + xLegoStep(0.5), - yLegoStep(y) / 2 + yLegoStep(0.5), - zLegoStep(z) / 2 + zLegoStep(0.5)]) {

			for (iy = [0:1]) {
				translate([xLegoStep(1.5), yLegoStep(iy * (y - 1)), 0]) legoSupport(hole = true, step = 2); 
				translate([xLegoStep(3), yLegoStep(iy * (y - 1)), 0]) legoSupport(); 
				translate([xLegoStep(4), yLegoStep(iy * (y - 1)), 0]) legoSupport(); 
				translate([xLegoStep(5.5), yLegoStep(iy * (y - 1)), 0]) legoSupport(hole = true, step = 2); 
			}
			for (iy = [0:1]) {
				translate([xLegoStep(x / 2 -0.5), yLegoStep(iy * (y - 1)), zLegoStep(1)]) legoBrick( step = x - 2, knob = false); 
			}

		}
		translate([0, 0, 3 / 2 + zLegoStep(z) / 2]) cube([70,(y + 3) * yLegoStep(1),3], center = true);
	}			
	translate([-24, 24, 13])Arduino(1, 1, 0);
}