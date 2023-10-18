size = 38;

difference(){
    linear_extrude(33, twist = 50, slices = 100) circle(d = size, $fn=7);
    
    translate([0, 0, -10]) cylinder(h = 50, d = size - 10, $fn=100);
    
    translate([10,-9.5,7]) rotate([90,0,90]) linear_extrude(20) text("A", size= 20);

    translate([40, -0.2, 18]) scale([1,0.85,1.25]) rotate([0,-90,0]) cylinder(r=6,h=40, $fn=3);
};