use <../../external/OpenScad_library__Threads_for_screws_and_nuts_V1_3131126/files/threads-library-by-cuiso-v1.scad>

$fn = 70;

hole_diameter = 27.5;
thread_heigth = 20;
plain_heigth = 20;
tongue_heigth = 1;
tongue = 3;
thick = 7;

cut = 3;
show = 0; //0 SX, 1 DX, 2 NUT
 
module full() {
    difference() {
        union() {
            thread_for_screw(diameter=hole_diameter, length=thread_heigth);
            translate([0,0,thread_heigth]) cylinder(d = hole_diameter, h=plain_heigth);
            translate([0,0,thread_heigth+plain_heigth]) cylinder(d = hole_diameter + tongue * 2, h=tongue_heigth);
        }
        translate([0,0,-cut]) cylinder(h=thread_heigth+plain_heigth + cut,d=hole_diameter - thick);
    }
}

/*SX*/
if (show == 0) {
    difference() {
        full();
        translate([-hole_diameter,-hole_diameter/2 - tongue - cut/2,-cut]) cube([hole_diameter,hole_diameter + tongue * 2 + cut,thread_heigth+plain_heigth+tongue_heigth + cut*2 ]);
    }
    translate([-thick/2,hole_diameter/2-thick/2, thread_heigth + thick])
    cube([thick /2,thick/2,thick]);
    translate([-thick/2,-hole_diameter/2, thread_heigth + thick])
    cube([thick /2,thick/2,thick]);
}

/*DX*/
if (show == 1) {
    difference() {
        full();
        translate([0,-hole_diameter/2 - tongue - cut/2,-cut]) cube([hole_diameter,hole_diameter + tongue * 2 + cut,thread_heigth+plain_heigth+tongue_heigth + cut*2 ]);
        translate([0,0,-cut]) cylinder(h=thread_heigth+plain_heigth + cut*2,d=hole_diameter - thick);
        translate([-thick/2,hole_diameter/2-thick/2-cut/2, thread_heigth + thick])
        cube([thick /2 + cut,thick/2 + cut,thick]);
        translate([-thick/2,-hole_diameter/2-cut/2, thread_heigth + thick])
        cube([thick /2+cut,thick/2 + cut,thick]);
    }
    
}

/*NUT*/
if (show == 2) {
    difference(){
        cylinder(d=hole_diameter + tongue * 3, h=thread_heigth, $fn = 6); 
        thread_for_nut(diameter=hole_diameter, length=thread_heigth, usrclearance=0.2); 
    }
}