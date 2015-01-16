use <../../modules/motors/micro-motors-l149.scad>;
use <../../modules/lego.scad>;

$fn=30;

x = 9;
y = 5;
z = 3;

difference() {
	union() {
		translate([ - xLegoStep(x) / 2 + xLegoStep(0.5), - yLegoStep(y) / 2 + yLegoStep(0.5), - zLegoStep(z) / 2 + zLegoStep(0.5)]) {
			for (ix = [0:x-1]) {
				for (iy = [0:y-1]) {
					translate([xLegoStep(ix), yLegoStep(iy), 0]) {
						if (
								(ix == 0 && iy == 0) ||
								(ix == x-1 && iy == 0) ||
								(ix == 0 && iy == y-1) ||
								(ix == x-1 && iy == y-1)
							)
						{
							legoSupport(hole = true, knob = false);
						} else {
							legoSupport(hole = false, knob = false);
						}
					}
				}
			}
			for (ix = [0:x-1]) {
				for (iy = [0:y-1]) {
					translate([xLegoStep(ix), yLegoStep(iy), zLegoStep(1)]) {
							legoBrick(hole = false, knob = false);
					}
				}
			}

			translate([xLegoStep(x - 1), yLegoStep(y/2 - 0.5), zLegoStep(1)]) {
				legoBrick(knob = false);
			}
			translate([xLegoStep(x - 1), yLegoStep(y/2 - 0.5), zLegoStep(2)]) {
				rotate([0, 0, 90]) {
					legoBrick(knob = false, hole = true);
				}
			}

		}

		translate([xLegoStep(x /2 - .5), 0, zLegoStep(0.5) + zLegoHole()  ]) { 
			rotate([0, 90, 0]) {
				legoAxle(3);
			}
		}

		translate([2.25 + 0.1, 0, zLegoStep(1)  ]) { 
			cube([2, yLegoStep(y), 20], center = true);
		}
	}
	translate([ - 9.5, 0, zLegoStep(0.5) + zLegoHole()  ]) { 
			rotate([0, 90, 0]) {
				motorMicroMotorsL149_4_6_12__10();
			}
		}
}
