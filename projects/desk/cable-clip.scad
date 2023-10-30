$fn = 30;

cable = 8;
thickness = 3;
cut = 3;
screw = 4.5;

center = (cable + thickness * 2) / 2;
screw_hole = screw + thickness * 2;

translate([-screw_hole / 2, 0, 0])
union() {
    difference() {
        cube([screw_hole,cable + thickness * 2,center]);
        
        translate([- cut / 2, center, center]) rotate([0, 90, 0]) cylinder(screw_hole + cut, cable / 2, cable / 2);
    }

    cube([screw_hole, thickness, cable + thickness]);
    translate([0,cable + thickness,0]) cube([screw_hole, thickness, cable + thickness]);
}


translate([0,0,cable ])
difference() {
    translate([-screw_hole/2, -screw_hole, 0]) cube([screw + thickness * 2, screw + thickness * 2, thickness]);

    translate([0,-screw_hole/2, -cut / 2]) cylinder(thickness + cut, screw / 2, screw / 2);
}

    
