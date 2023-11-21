include <../../modules/skadis.scad>;

skadis_double_hooks();

h = 90;
w = 4.3;
d = 6;

grip = 3;

base_grip = 11;

support_d = 60;

finger_d = 10;

cut = 3;

sx_dx = 0; //0 DX, 1 SX

skadis_double_hooks();


color("blue")
translate([0,-support_d,0]) cube([w, support_d, w]);

if (sx_dx == 0) {
    color("red")
    translate([-finger_d,-support_d,0]) cube([finger_d,base_grip,w]);
        
    color("black")
    translate([-finger_d,-support_d,w]) cube([d,base_grip,d * 2]);
}

if (sx_dx == 1) {
    color("red")
    translate([w,-support_d,0]) cube([finger_d,base_grip,w]);
        
    color("black")
    translate([w + finger_d - d,-support_d,w]) cube([d,base_grip,d * 2]);
}

color("orange")
difference() {
    translate([0,-support_d ,0]) rotate([-38,0,0]) cube([w,d,120]);
    translate([-cut,ikea_skadis_hook_depth,0]) cube([w + cut * 2,d*3,120]);
    translate([-cut,-support_d,-w]) cube([w + cut * 2, support_d, w]);
}






