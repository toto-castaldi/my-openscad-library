//use <../../modules/motors/micro-motors-l149.scad>;
//use <../../external/Openscad_Lego-Like_brick/block-remix.scad>;

//$fn=30;

lego = 1.6;

lego_brick_length = 5 * lego;

module legoSupport() {
	union() {
		difference() {
			union() {
				translate([0,0,7.9])
				cylinder (h = 8.5, r = 2.25, $fs = 1);
				translate([0,0,16.225]) 
				cylinder (h = .375, r = 2.5, $fs = 1);
			}
			translate([0,0,-.05])
			cylinder (h = 16.7, r = 1.875, $fs = 1);
			cube([10,1,9], center = true);
			translate([0,0,16.6])
			cube([10,1,9], center = true);
		}
		translate([0,0,7.9])
		cylinder(h = .9, r = 3.00, $fs = 1);
	}
}


cube([6 * lego_brick_length, 4 * lego_brick_length, 10]); 
rotate([90,0,0]) legoSupport();



