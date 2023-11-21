ikea_skadis_hole_w = 4.3;
ikea_skadis_hook_depth = 5;
ikea_skadis_hole_h = 7.5;
ikea_skadis_holes_dist = 80;
ikea_skadis_holes_horiz_dist = 40;

module skadis_hook() {
    color("green")
    translate([0,ikea_skadis_hook_depth,-ikea_skadis_hole_h]) cube([ikea_skadis_hole_w,ikea_skadis_hook_depth,ikea_skadis_hole_h ]);

    color("violet")
    translate([0,0,0]) cube([ikea_skadis_hole_w,ikea_skadis_hook_depth*2,ikea_skadis_hole_w ]);
}

module skadis_double_hooks() {
    skadis_hook();
    
    translate([0,0,ikea_skadis_holes_dist]) skadis_hook();
    
    color("yellow")
    translate([0,-ikea_skadis_hook_depth,0])
    cube([ikea_skadis_hole_w,ikea_skadis_hook_depth,ikea_skadis_holes_dist + ikea_skadis_hole_w]);
}

module skadis_triple_horiz_hooks() {
    translate([-20 - ikea_skadis_hole_w / 2,0,0]) union() {
        skadis_hook();
        translate([20,0,-20]) skadis_hook();
        translate([40,0,0]) skadis_hook();
    }
}

//skadis_double_hooks();
//skadis_triple_horiz_hooks();