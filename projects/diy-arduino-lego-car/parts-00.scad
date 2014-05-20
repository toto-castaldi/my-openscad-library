use <../../modules/motors/micro-motors-l149.scad>;
use <../../external/Openscad_Lego-Like_brick/block-remix.scad>;

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


//motorMicroMotorsL149LegoAdapter();

block(2,1,1/3,axle_hole=false,circular_hole=true,reinforcement=true,hollow_knob=true,flat_top=true);

translate([50,-10,0])
	block(1,2,1/3,axle_hole=false,circular_hole=true,reinforcement=false,hollow_knob=true,flat_top=true);

translate([10,0,0])
	block(2,2,1/3,axle_hole=false,circular_hole=true,reinforcement=true,hollow_knob=true,flat_top=true);
translate([30,0,0])
	block(2,2,1/3,axle_hole=false,circular_hole=true,reinforcement=true,hollow_knob=false,flat_top=false);
translate([50,0,0])
	block(2,2,1/3,axle_hole=false,circular_hole=true,reinforcement=true,hollow_knob=true,flat_top=false);
translate([0,20,0])
	block(3,2,2/3,axle_hole=false,circular_hole=true,reinforcement=true,hollow_knob=true,flat_top=false);
translate([20,20,0])
	block(3,2,1,axle_hole=true,circular_hole=false,reinforcement=true,hollow_knob=false,flat_top=false);
translate([40,20,0])
	block(3,2,1/3,axle_hole=false,circular_hole=false,reinforcement=false,hollow_knob=false,flat_top=false);
translate([0,-10,0])
	block(1,5,1/3,axle_hole=true,circular_hole=false,reinforcement=true,hollow_knob=false,flat_top=false);
translate([0,-20,0])
	block(1,5,1/3,axle_hole=true,circular_hole=false,reinforcement=true,hollow_knob=true,flat_top=false);
translate([0,-30,0])
	block(1,5,1/3,axle_hole=true,circular_hole=false,reinforcement=true,hollow_knob=true,flat_top=true);


