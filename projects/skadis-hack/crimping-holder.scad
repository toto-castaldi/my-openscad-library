include <../../modules/skadis.scad>;

translate([-25,-3,0]) cube([50,3,30]);
translate([0,0,25]) skadis_triple_horiz_hooks();
translate([-14.5,-36,20]) cube([29, 33, 6]);