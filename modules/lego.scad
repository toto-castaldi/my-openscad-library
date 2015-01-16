use <../general.scad>;

$fn=50;

legoHeight = 9.6;
legoWidth = 8;

function xLegoStep(step) = step * legoWidth; 
function yLegoStep(step) = step * legoWidth; 
function zLegoStep(step) = step * legoHeight; 
function zLegoHole() = 5.8; 

module _legoBrick(hole = false, knob = true) {
	difference() {
		union() {
			translate([ - legoWidth / 2, - legoWidth / 2, - legoHeight / 2]) {
				cube ([ legoWidth, legoWidth, legoHeight]);
			}
			if (knob) {
				translate([ 0, 0 ,  legoHeight / 2]) {
					cylinder(h = 1.7, r = 5/2);
				}
			}
		}
		if (hole) {
			translate([0, 0, (zLegoHole() - (legoHeight / 2)) / 2]) {
				rotate([90, 0, 0]) {
					translate([ 0, 0, - (legoWidth - 0.9 * 2) / 2 ]) {
						cylinder(h = enlargeFrontBack(legoWidth - 0.9 * 2), r= 4.9 / 2 );
					}
					
					translate([ 0, 0, (legoWidth - 0.9 * 2) / 2]) {
						cylinder(h = enlargeFrontBack(0.9), r= 6.2 / 2 );
					}
					translate([ 0, 0, - (legoWidth - 0.9 * 2) / 2 - enlarge(0.9)]) {
						cylinder(h = enlargeFrontBack(0.9), r= 6.2 / 2 );
					}
				}
			}
		}
	}
}

module legoBrick(hole = false, knob = true) {
		difference() {
			union() {
				cube ([ legoWidth, legoWidth, legoHeight], center = true);
				if (knob) {
					translate([ 0, 0 ,  legoHeight / 2]) {
						cylinder(h = 1.7, r = 5/2, center = true);
					}
				}
			}
			if (hole) {
				translate([0, 0, zLegoHole() - legoHeight / 2]) {
					rotate([90, 0, 0]) {
						translate([ 0, 0, - (legoWidth - 0.9 * 2) / 2 ]) {
							cylinder(h = enlargeFrontBack(legoWidth - 0.9 * 2), r= 4.9 / 2 );
						}
						
						translate([ 0, 0, (legoWidth - 0.9 * 2) / 2]) {
							cylinder(h = enlargeFrontBack(0.9), r= 6.2 / 2 );
						}
						translate([ 0, 0, - (legoWidth - 0.9 * 2) / 2 - enlarge(0.9)]) {
							cylinder(h = enlargeFrontBack(0.9), r= 6.2 / 2 );
						}
					}
				}
			}
		}
	
}

module legoSupport(hole = true, knob = true) {
	translate([0, 0, 2.5 / 2]) {
		assign (legoHeight = legoHeight - 2.5) {
			difference() {
				union() {
					translate([ - legoWidth / 2, - legoWidth / 2, - legoHeight / 2]) {
						cube ([ legoWidth, legoWidth, legoHeight]);
					}
					if (knob) {
						translate([ 0, 0 ,  legoHeight / 2]) {
							cylinder(h = 1.7, r = 5/2);
						}
					}
				}
				if (hole) {
					translate([0, 0, 0]) {
						rotate([90, 0, 0]) {
							translate([ 0, 0, - (legoWidth - 0.9 * 2) / 2 ]) {
								cylinder(h = enlargeFrontBack(legoWidth - 0.9 * 2), r= 4.9 / 2 );
							}
							
							translate([ 0, 0, (legoWidth - 0.9 * 2) / 2]) {
								cylinder(h = enlargeFrontBack(0.9), r= 6.2 / 2 );
							}
							translate([ 0, 0, - (legoWidth - 0.9 * 2) / 2 - enlarge(0.9)]) {
								cylinder(h = enlargeFrontBack(0.9), r= 6.2 / 2 );
							}
						}
					}
				}
			}
		}
	}
}

module legoAxle(length = 1) {
		intersection() {
			cylinder(h = length * legoHeight, r = 4.8 / 2, center=true);
			union() {
				cube([5 , 2, length * legoHeight],center=true);
				cube([2, 5 ,	length * legoHeight],center=true);
			}
		}
}

translate([xLegoStep(2.5), yLegoStep(0), zLegoStep(0)]) {
	legoBrick(hole = true, knob = false);
}
translate([xLegoStep(1), yLegoStep(0), zLegoStep(0)]) {
	legoBrick(hole = true);
}

translate([xLegoStep(-1), yLegoStep(0), zLegoStep(0)]) {
	legoSupport();
}

translate([xLegoStep(-2.5), yLegoStep(0), zLegoStep(0)]) {
	legoSupport(knob = false);
}

legoAxle(3);

!union() {
		translate([0, 0, zLegoStep(0.5)]) legoBrick(hole = true, knob = true);

	 translate([0, 50, zLegoHole()]) rotate([90, 0, 0]) cylinder(h = 100, r = 0.1);
}