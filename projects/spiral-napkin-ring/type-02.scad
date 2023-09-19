difference(){
    linear_extrude(33, twist = 130, slices = 5) circle(d = 50, $fn=7);
    
    translate([0, 0, -10]) cylinder(h = 50, d = 40, $fn=100);
    
    translate([10,-9.5,7]) rotate([90,0,90]) linear_extrude(20) text("V", size= 20);
};