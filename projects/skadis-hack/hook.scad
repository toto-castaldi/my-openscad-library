h = 90;
w = 4.3;
d = 6;

ikea_d = 5;
ikea_hole_h = 7.5;

grip = 3;

base_grip = 11;

support_d = 60;

finger_d = 10;

cut = 3;

sx_dx = 0; //0 DX, 1 SX


color("yellow")
cube([w,d,h]);

color("green")
translate([0,d*2,h - ikea_hole_h]) cube([w,ikea_d,ikea_hole_h ]);

color("violet")
translate([0,0,h]) cube([w,d*2+ikea_d,w ]);

color("green")
translate([0,d*2,h - ikea_hole_h -80]) cube([w,ikea_d,ikea_hole_h ]);

color("violet")
translate([0,0,h -80 ]) cube([w,d*2+ikea_d,w ]);


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
    translate([0,-support_d + d * 3,0]) rotate([-30,0,0]) cube([w,d,h]);
    translate([-cut,d,0]) cube([w + cut * 2,d,h]);
    translate([-cut,-support_d,-w]) cube([w + cut * 2, support_d, w]);
}





