use <../../external/OpenScad_library__Threads_for_screws_and_nuts_V1_3131126/files/threads-library-by-cuiso-v1.scad>

$fn = 70;

hole_d = 27.5;
thread_h = 20;
plain_h = 15;
tongue_h = 1;
tongue = 3;
thick = 7;

cut = 3;
show_delta = 5;
show = -1; //-1 ALL, 0 BOLT SX, 1 BOLT DX, 2 NUT SX, 3 NUT DX
 
module full_bolt() {
    difference() {
        union() {
            thread_for_screw(diameter=hole_d, length=thread_h);
            translate([0,0,thread_h]) cylinder(d = hole_d, h=plain_h);
            translate([0,0,thread_h+plain_h]) cylinder(d = hole_d + tongue * 2, h=tongue_h);
        }
        translate([0,0,-cut]) cylinder(h=thread_h+plain_h + cut,d=hole_d - thick);
    }
}

module full_nut() {
    difference(){
        union() {
            cylinder(d=hole_d + tongue * 3, h=thread_h, $fn = 6); 
            translate([0,0,thread_h - tongue_h]) cylinder(d=hole_d + tongue * 5, h=tongue_h); 
        }
        thread_for_nut(diameter=hole_d, length=thread_h, usrclearance=0.2); 
    }
    difference() {
        translate([-thick/2,hole_d/2 + 0.9, 2])
        cube([thick /2 + cut,thick/2 + cut,thick]);
        translate([-thick/2 - 1,hole_d/2 + 1 + thick / 2 , 5.5]) rotate([0,90,0]) cylinder(thick * 2,2,2);
    }
    difference() {
        translate([-thick/2,-hole_d/2 - 0.6 - thick, thread_h  / 2])
        cube([thick /2+cut,thick/2 + cut,thick]);
        translate([-thick/2 - 1,-hole_d/2 - 1.3 - thick / 2 , 13.5]) rotate([0,90,0]) cylinder(thick * 2,2,2);
    }
    
}

/*SX*/
if (show == 0 || show == -1) {
    translate([show == -1 ? -hole_d /2 - show_delta : 0, 0, 0])
    difference() {
        full_bolt();
        translate([0,-hole_d/2 - tongue - cut/2,-cut]) cube([hole_d,hole_d + tongue * 2 + cut,thread_h+plain_h+tongue_h + cut*2 ]);
        translate([0,0,-cut]) cylinder(h=thread_h+plain_h + cut*2,d=hole_d - thick);
        translate([-thick/2,hole_d/2-thick/2-cut/2, thread_h + (plain_h) / 2 - thick / 2])
        cube([thick /2 + cut,thick/2 + cut,thick]);
        translate([-thick/2,-hole_d/2-cut/2, , thread_h + (plain_h) / 2 - thick / 2])
        cube([thick /2+cut,thick/2 + cut,thick]);
    }
}

/*DX*/
if (show == 1 || show == -1) {
    translate([show == -1 ? hole_d /2 + show_delta : 0, 0, 0])
    union() {
        difference() {
            full_bolt();
            translate([-hole_d,-hole_d/2 - tongue - cut/2,-cut]) cube([hole_d,hole_d + tongue * 2 + cut,thread_h+plain_h+tongue_h + cut*2 ]);
        }
        translate([+ 0.25 -thick/2 ,hole_d/2-thick/2 + 0.25, thread_h + (plain_h) / 2 - thick / 2 + 0.25])
        cube([thick /2,thick/2 -0.5,thick - 0.5]);
        translate([+ 0.25 -thick/2,-hole_d/2 + 0.25, thread_h + (plain_h) / 2 - thick / 2 + 0.25])
        cube([thick /2,thick/2 -0.5,thick - 0.5]);
    }
}



/*SX NUT*/
if (show == 2 || show == -1) {
    translate([show == -1 ? -hole_d /2 - show_delta : 0, 0, show == -1 ? -thread_h - show_delta : 0])
    difference() {
        full_nut();
        translate([0, - hole_d / 2 - tongue * 3, - cut]) cube([hole_d + tongue * 3, hole_d + tongue * 6, thread_h + cut * 2]);
        translate([-thick/2,hole_d/2 + 0.9, thread_h  / 2])
        cube([thick /2 + cut,thick/2 + cut,thick]);
        translate([-thick/2,-hole_d/2 - 0.6 - thick, 2])
        cube([thick /2+cut,thick/2 + cut,thick]);
    }
}

/*DX NUT*/
if (show == 3 || show == -1) {
    translate([show == -1 ? +hole_d /2 + show_delta : 0, 0, show == -1 ? -thread_h - show_delta : 0])
    union() {
        difference() {
            full_nut();
            translate([- hole_d - tongue * 3, - hole_d / 2 - tongue * 3, - cut]) cube([hole_d + tongue * 3, hole_d + tongue * 6, thread_h + cut * 2]);
            
        }
        translate([-thick/2,hole_d/2 + 0.9, thread_h  / 2 + 0.125])
        cube([thick /2 + cut,1.15,thick - 0.25]);
        translate([-thick/2,-hole_d/2 -2, 2 + 0.125])
        cube([thick /2+cut,1,thick - 0.25]);
    }
    
}