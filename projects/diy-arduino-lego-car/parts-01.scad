use <../../modules/motors/micro-motors-l149.scad>;

$fn=30;

lego = 1.6;

lego_brick_length = 5 * lego;

lego_brick_width = 6 * lego;

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

shift = 2;

difference() {
	union() {
		cube([6 * lego_brick_length, 4 * lego_brick_length, lego_brick_width * 3]); 

		translate([lego_brick_length,8.3,3.5 * lego]) rotate([90,0,0]) legoSupport();

		translate([lego_brick_length * 5 ,8.3,3.5*lego]) rotate([90,0,0]) legoSupport();

		translate([lego_brick_length,4 * lego_brick_length - 8.3 ,3.5*lego]) rotate([-90,0,0]) legoSupport();

		translate([lego_brick_length * 5,4 * lego_brick_length - 8.3 ,3.5*lego]) rotate([-90,0,0]) legoSupport();
	}
	
	translate([- shift/2,-shift / 2, 20]) cube([6 * lego_brick_length + shift, shift + 4 * lego_brick_length, lego_brick_width * 3]); 

	translate([- shift/2 -lego_brick_length * 2,-shift / 2, 10]) cube([6 * lego_brick_length + shift, shift + 4 * lego_brick_length, lego_brick_width * 3]); 
	
	translate([8,2 * lego_brick_length,lego_brick_width * 1.5]) rotate([0,90,0]) motorMicroMotorsL149_4_6_12__10(20);

	translate([- shift/2,- shift/2, -3])  cube([6 * lego_brick_length + shift * 2, 4 * lego_brick_length + shift * 2, 5]); 
}





