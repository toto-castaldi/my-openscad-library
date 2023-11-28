include <../../modules/skadis.scad>;

w = 42;

translate([-w/2 - 14,-3,3]) cube([w + 28,3,27]);

//color("red") translate([-w/2,-10,20]) cube([w, 10, 10]);

translate([0,0,25]) skadis_triple_horiz_hooks();
translate([w/2,-32,25]) cube([10, 29, 4]);
translate([-w/2-10,-32,25]) cube([10, 29, 4]);