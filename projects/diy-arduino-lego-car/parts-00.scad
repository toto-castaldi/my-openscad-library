use <../../modules/motors/micro-motors-l149.scad>;
use <../../modules/lego.scad>;

$fn=30;

x = 9;
y = 5;
z = 3;

rotate([0, - 90, 0]) {
	difference() {
		translate([9, 0, zLegoStep(0.5) + zLegoHole()  ]) { 
			rotate([0, 90, 0]) {
				cylinder(h = 15, r = 4);
			}
		}

		translate([xLegoStep(x /2 - .5) - 3.3, 0, zLegoStep(0.5) + zLegoHole()  ]) { 
			rotate([0, 90, 0]) {
				legoAxle(3, 0.2);
			}
		}
		translate([ - 9.5, 0, zLegoStep(0.5) + zLegoHole()  ]) { 
			rotate([0, 90, 0]) {
				motorMicroMotorsL149_4_6_12__10(0, 0.3);
			}
		}
	}
}