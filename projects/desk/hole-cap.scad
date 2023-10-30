use <../../external/threads-library-by-cuiso-v1.scad>

$fn = 70;

hole = 41;
tongue = 6;
tongue_height = 1;
height = 50;
cylinder_thickness = 4;
extra_height = 15;

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

