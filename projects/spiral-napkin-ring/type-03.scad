difference(){
    linear_extrude(33, twist = 130, slices = 100) circle(d = 38, $fn=7);
    
    translate([0, 0, -10]) cylinder(h = 50, d = 28, $fn=100);
    
    translate([10,-9.5,7]) rotate([90,0,90]) linear_extrude(20) text("F", size= 20);
};