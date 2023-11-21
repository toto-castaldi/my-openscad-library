include <../../modules/skadis.scad>;

mini_claw_d = 13;
mini_claw_h = 26;
mini_claw_w_1 = 58;
mini_claw_w_2 = 40;

maxi_claw_d = 13;
maxi_claw_h = 25;
maxi_claw_w_1 = 48;
maxi_claw_w_2 = 37;


delta = 3;
cut = 0.1;

translate([0,-delta ,0])
difference() {
    translate([-(maxi_claw_w_1 + delta * 2)/2, - maxi_claw_d - delta , cut]) cube([maxi_claw_w_1 + delta * 2, maxi_claw_d + delta * 2, maxi_claw_h - cut * 2]);

    translate([0,-maxi_claw_d,maxi_claw_h]) rotate([-90, 0,0])
linear_extrude(height = maxi_claw_d) {
    polygon(points = [[-maxi_claw_w_1/2, 0], [-maxi_claw_w_2/2, maxi_claw_h], [maxi_claw_w_2/2, maxi_claw_h],  [maxi_claw_w_1/2, 0]]);
    }
}

translate([0,-delta - mini_claw_d - delta * 2 - maxi_claw_d - delta * 2 ,0])
difference() {
    translate([-(mini_claw_w_1 + delta * 2)/2, - mini_claw_d - delta , cut]) cube([mini_claw_w_1 + delta * 2, mini_claw_d + delta * 2, mini_claw_h - cut * 2]);

    translate([0,-mini_claw_d,mini_claw_h]) rotate([-90, 0,0])
linear_extrude(height = mini_claw_d) {
    polygon(points = [[-mini_claw_w_1/2, 0], [-mini_claw_w_2/2, mini_claw_h], [mini_claw_w_2/2, mini_claw_h],  [mini_claw_w_1/2, 0]]);
    }
}

translate([0,-delta - maxi_claw_d - delta * 2,0])
difference() {
    translate([-(mini_claw_w_1 + delta * 2)/2, - mini_claw_d - delta , cut]) cube([mini_claw_w_1 + delta * 2, mini_claw_d + delta * 2, mini_claw_h - cut * 2]);

    translate([0,-mini_claw_d,mini_claw_h]) rotate([-90, 0,0])
linear_extrude(height = mini_claw_d) {
    polygon(points = [[-mini_claw_w_1/2, 0], [-mini_claw_w_2/2, mini_claw_h], [mini_claw_w_2/2, mini_claw_h],  [mini_claw_w_1/2, 0]]);
    }
}

translate([0,0,mini_claw_h - 5]) skadis_triple_horiz_hooks();