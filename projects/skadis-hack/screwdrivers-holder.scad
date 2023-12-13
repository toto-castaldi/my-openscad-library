include <../../modules/skadis.scad>;

w = 18 * 3;

translate([-w/2,-3,5]) cube([w,3,24.3]);

translate([0,0,25]) skadis_triple_horiz_hooks();

difference() {
    translate([-w/2,-35,17.3]) cube([w, 32, 12]);
    for (y = [0:1:1]) {
        for (x = [0:1:2]) {  
            translate([x * 18 - w/2 + 18 / 2, y * 18 - 28, 0]) 
            cylinder(50,r1 = 2.2, r2 = 2.2, $fn = 50);
        }
    }
}

