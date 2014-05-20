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
translate([0,0,3.95])
cube([4.5,1.7,7.9], center = true);
translate([0,0,3.95])
cube([1.7,4.5,7.9], center = true);
}