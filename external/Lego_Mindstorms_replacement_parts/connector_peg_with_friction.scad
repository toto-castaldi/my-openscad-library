difference() {
union() {
cylinder (h = 0.375, r = 2.5, $fs = 1);
cylinder (h = 16.6, r = 2.25, $fs = 1);
translate([0,0,16.225]) 
cylinder (h = .375, r = 2.5, $fs = 1);
translate([0,0,7.55])
cylinder(h = 1.6, r = 3.00, $fs = 1);
}
translate([0,0,-.05])
cylinder (h = 16.7, r = 1.875, $fs = 1);
cube([10,1,9], center = true);
translate([0,0,16.6])
cube([10,1,9], center = true);
translate([0,0,8.3]) 
cube([1,10,7], center = true);
}