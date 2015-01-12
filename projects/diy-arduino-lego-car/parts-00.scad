use <../../modules/motors/micro-motors-l149.scad>;
use <../../external/Openscad_Lego-Like_brick/block-remix.scad>;

$fn=30;

module motorMicroMotorsL149LegoAdapter() {
	
	thickness = 2;
	height = 8.5 * 2 + thickness;

//	difference() {
		translate([0, 0, -height / 2 ]) cylinder(h= height, r = 4.5);
		translate([0, 0, -52.5 - thickness / 2]) motorMicroMotorsL149_4_6_12__10(0,0.1);
		translate([0, 0, thickness]) axle(3);
	//}
}


motorMicroMotorsL149LegoAdapter();

