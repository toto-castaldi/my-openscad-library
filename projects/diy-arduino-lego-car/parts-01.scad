use <../../modules/motors/micro-motors-l149.scad>;
use <../../modules/lego.scad>;

$fn=30;

x = 6;
y = 5;
z = 3;

translate([ - xLegoStep(x) / 2 + xLegoStep(0.5), - yLegoStep(y) / 2 + yLegoStep(0.5), - zLegoStep(z) / 2 + zLegoStep(0.5)]) {
	for (ix = [0:x-1]) {
		for (iy = [0:y-1]) {
			for (iz = [0:z-1]) {
				translate([xLegoStep(ix), yLegoStep(iy), zLegoStep(iz)]) {
					if (iz == 0 || ix == x -1 ) {
						if (
								(ix == 0 && iy == 0 && iz == 0) ||
								(ix == x -1 && iy == 0 && iz == 0) ||
								(ix == 0 && iy == y - 1 && iz == 0) ||
								(ix == x -1 && iy == y - 1 && iz == 0)
								) {
							legoSupport(knob = false);
						} else {
							if (ix == x - 1 && iy == 2 && iz == z -1 ) {
								rotate([0, 0, 90]) legoBrick(hole = true, knob = false);
							} else {
								if (iz == 0) {
									legoSupport(hole = false, knob = false);
								} else {
									legoBrick(knob = false);
								}
							}
						}
					}
				}
			}
		}
	}
}

translate([0, 0, zLegoStep(0.5) + zLegoHole()  ]) { 
	rotate([0, 90, 0]) {
		motorMicroMotorsL149_4_6_12__10();
	}
}




