use <../../modules/motors/micro-motors-l149.scad>;
use <../../modules/lego.scad>;

$fn=30;

x = 9;
y = 5;
z = 3;

difference() {
	union() {
		translate([ - xLegoStep(x) / 2 + xLegoStep(0.5), - yLegoStep(y) / 2 + yLegoStep(0.5), - zLegoStep(z) / 2 + zLegoStep(0.5)]) {

			for (iy = [0:1]) {
				translate([xLegoStep(1), yLegoStep(iy * (y - 1)), 0 ]) legoSupport(); 
				translate([xLegoStep(2.5), yLegoStep(iy * (y - 1)), 0]) legoSupport(hole = true, step = 2); 
				translate([xLegoStep(4), yLegoStep(iy * (y - 1)), 0]) legoSupport(); 
				translate([xLegoStep(5), yLegoStep(iy * (y - 1)), 0]) legoSupport(); 
				translate([xLegoStep(6.5), yLegoStep(iy * (y - 1)), 0]) legoSupport(hole = true, step = 2); 
			}

			
			for (iy = [0:y-1]) {
				translate([xLegoStep(1), yLegoStep(iy), zLegoStep(1)]) {
					legoBrick();
				}
				translate([xLegoStep(1), yLegoStep(iy), 0]) {
					legoSupport();
				}
				translate([xLegoStep(x-1), yLegoStep(iy), 0]) {
					legoSupport();
				}
			}

			translate([xLegoStep(x - 1), yLegoStep(y/2 - 0.5), zLegoStep(1)]) {
				legoBrick(knob = false);
			}
			translate([xLegoStep(x - 1), yLegoStep(y/2 - 0.5), zLegoStep(2)]) {
				rotate([0, 0, 90]) {
					legoBrick(knob = true, hole = true);
				}
			}

		}

		translate([2.25 + 0.1, 0, 5  ]) { 
			cube([2, yLegoStep(y), 25], center = true);
		}
	}
	translate([ - 9.5, 0, zLegoStep(0.5) + zLegoHole()  ]) { 
			rotate([0, 90, 0]) {
				motorMicroMotorsL149_4_6_12__10(20, 0.5);
			}
	}
}
