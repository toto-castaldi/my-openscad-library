w = 5;
d = 70;
h = 20;
delta = 1;

module u(u_w, u_d, u_h, u_delta) {
    cut = 0.5;
    difference() {
        cube([u_w,u_d,u_h]);
        translate([u_delta,-cut,u_delta]) cube([u_w - u_delta * 2,u_d + cut * 2,u_h - u_delta + cut]);
    }
}

difference() {
    union() {
        u(w,d,h, delta);
        translate([d/2 + w/2,d/2 - w/2,0]) rotate([0,0,90]) u(w,d,h, delta);
    }
    translate([-delta , d/2 - delta*1.5, delta ]) color("red") cube([w + delta * 2,w - delta *2 ,h + 1]);
    translate([delta, d/2 - delta * 4, delta]) color("blue") cube([w - delta * 2,w + delta *2 ,h + 1]);
}


