include <../../modules/skadis.scad>;


w_min = 12.8;
w_max = 15.2;
h = 24.5;
d = 63;
delta = 0.01;
thick = 5;

difference() {
    translate([-(w_max + thick)/2,-d - thick / 2,delta+0.2]) cube([w_max + thick,d + thick, h-delta*2-0.2]);

    rotate([90,0,0]) linear_extrude(height = d) {
        polygon(points = [[-w_min/2, 0], [-w_max/2, h], [w_max/2, h], [w_min/2, 0]]);
    }
}

translate([-(w_max + thick) / 2,-d/2,h-delta-ikea_skadis_hole_w]) rotate([0,0,90]) skadis_triple_horiz_hooks();

