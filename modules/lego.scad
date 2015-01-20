$fn=50;

legoHeight = 9.6;
legoWidth = 8;

tolleranceForUnionDifference = 0.1;

function enlarge(height = 0) = height + tolleranceForUnionDifference ;

function enlargeFrontBack(height = 0) = height + tolleranceForUnionDifference * 2 ;

function xLegoStep(step) = step * legoWidth; 
function yLegoStep(step) = step * legoWidth; 
function zLegoStep(step) = step * legoHeight; 
function zLegoHole() = 5.8; 

module hole(istep = 0, step = 1) {
	translate([(istep + 0.5 )* legoWidth - legoWidth / 2 * (step - 1 ), 0, zLegoHole() - legoHeight / 2]) {
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

module legoBrick(hole = false, knob = true, step = 1, height = legoHeight) {
		difference() {
			union() {
				if (height < legoHeight) {
					translate([- legoWidth * step / 2, - legoWidth / 2, legoHeight - height - legoHeight / 2 ]) {
						cube([legoWidth * step, legoWidth, height]);
					}
				} else {
					cube([legoWidth * step, legoWidth, height], center = true);
				}
				if (knob) {
					for (istep = [0:step -1]) {
						translate([ (istep + 0.5 )* legoWidth - legoWidth / 2 * step, 0 ,  legoHeight / 2]) {
							cylinder(h = 1.7, r = 5/2);
						}
					}
				}
			}
			if (hole) {
				if (step > 1) {
					for (istep = [0: step - 2 ]) {
						hole(istep, step);
					}
				} else {
					hole (0, 2);
				}
			}
		}
	
}

module legoSupport(hole = false, knob = true, step = 1) {
	legoBrick(hole = hole, knob = knob, step = step, height = legoHeight - 2.3 );
}

module legoAxle(length = 1, tollerance = 0) {
		intersection() {
			cylinder(h = length * legoWidth, r = tollerance + 4.8 / 2, center=true);
			union() {
				cube([5 , 2 + tollerance, length * legoWidth],center=true);
				cube([2 + tollerance , 5 ,	length * legoWidth],center=true);
			}
		}
}



// examples
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

union() {
		translate([0, 0, zLegoStep(0.5)]) legoBrick(hole = true, knob = true);

	 translate([0, 50, zLegoHole()]) rotate([90, 0, 0]) cylinder(h = 100, r = 0.1);
}

union() {
	translate([0, 0, 0]) legoBrick();
	translate([xLegoStep(1), 0, 0]) legoBrick();
	translate([xLegoStep(2), 0, 0]) legoBrick();

	translate([xLegoStep(1), 0, zLegoStep(1.5)]) rotate([0, 90, 0]) legoAxle(3);
}

!union() {
		for (i = [0:5]) {
			translate([0, 0, zLegoStep(i * 1.5)]) legoBrick(step = i + 1, hole = true);
		}
		for (i = [0:5]) {
			translate([xLegoStep(5 + 2), 0, zLegoStep(i * 1.5)]) legoSupport(step = i + 1, hole = true);
		}
}
