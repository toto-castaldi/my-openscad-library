include <../../modules/skadis.scad>;

w = 42;

translate([-w/2,-3,3]) cube([w,3,27]);
translate([0,0,25]) skadis_triple_horiz_hooks();
translate([34,-32,25]) cube([10, 29, 4]);
translate([-34-10,-32,25]) cube([10, 29, 4]);