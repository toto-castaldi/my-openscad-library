use <../../modules/motors/micro-motors-l149.scad>;
use <../../external/lego_compatibility.scad>;

$fn=40;

module motorMicroMotorsL149LegoAdapter() {
	height = 25;
	thickness = 4;

	difference() {
		translate([0, 0, -height / 2 ]) cylinder(h= height, r = 4);
		translate([0, 0, -52.5 - thickness]) motorMicroMotorsL149_4_6_12__10();
		translate([0, 0, thickness]) axle(3);
	}
}


motorMicroMotorsL149LegoAdapter();


