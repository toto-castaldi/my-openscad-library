include <../../modules/skadis.scad>;


difference() {
    translate([-50/2,-10,3]) cube([50,10,27]);
    translate([-18/2,-5 - 2.5,-1]) cube([18,5,35]);
}

translate([0,0,25]) skadis_triple_horiz_hooks();
