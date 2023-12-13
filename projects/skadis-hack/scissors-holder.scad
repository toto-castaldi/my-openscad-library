include <../../modules/skadis.scad>;

inter_axis_w = 34;
w = 4.5;
h = 3;
d = 35;

delta = 10;
computed_w = inter_axis_w + w + delta;
computed_h = ikea_skadis_hook_dist + ikea_skadis_hole_w;

translate([-computed_w /2 ,0,0]) cube([computed_w ,3,computed_h]);


translate([0,3,20])skadis_triple_horiz_hooks();

translate([inter_axis_w / 2,-d,computed_h-h])cube([w, d, h]);
translate([-w - inter_axis_w / 2 ,-d,computed_h-h])cube([w, d, h]);

