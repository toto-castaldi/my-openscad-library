use <../../external/OpenScad_library__Threads_for_screws_and_nuts_V1_3131126/files/threads-library-by-cuiso-v1.scad>

$fn = 70;

hole = 39.5;
tongue = 6;
tongue_height = 1;
height = 50;
cylinder_thickness = 4;
extra_height = 15;
nut_h = 20;

cut = 3;

difference() {
    union() {
        thread_for_screw(diameter=hole * 2, length=height);
        translate([0,0,height]) cylinder(extra_height ,hole,hole);
    }
    translate ([0,0,-cut])
    cylinder(height + extra_height  + cut*2,hole - cylinder_thickness ,hole - cylinder_thickness);
}

translate ([0,0,height + extra_height ]) cylinder(tongue_height,hole + tongue,hole + tongue);

translate([80,80,0])
union(){
    difference(){
        union() {
            cylinder(d=hole * 2 + tongue * 3, h=20, $fn = 6); 
            translate ([0,0,nut_h]) cylinder(tongue_height,hole + tongue * 3,hole + tongue * 3);
        }
        thread_for_nut(diameter=hole * 2, length=nut_h + cut * 2, usrclearance=0.2); 
    }
    for (i = [1: 6]){
        translate([sin(360*i/6)*(hole * 1.1), cos(360*i/6)*(hole * 1.1), 0 ])
        cylinder(nut_h, 3,3);
    }
}



