module motorMicroMotorsL149(length, supportLength, tollerance) {
	inter = 1;	
	
	translate([0, 0, - (1 + length + 4.5 + 11) / 2]) {
		difference() {
			union() {
				color("grey") cylinder(h = 1 + inter, r =  8.5 / 2);
				color("grey") translate(v = [0, 0, 1]) cylinder(h = 21 + inter, r = tollerance +  27 / 2);
				color("black") translate(v = [0, 0, 21 + 1]) cylinder(h = length - 21, r = tollerance +  27 / 2);
				color("black") translate(v = [0, 0, length + 1 - inter]) cylinder(h = 4.5 + inter, r = tollerance + 9 / 2);
				color("silver") translate(v = [0, 0, length + 5.5]) cylinder(h = 11, r = tollerance + 4 / 2);
			}
			color("silver")
			translate(v = [- 5 / 2, 1.5, length + 8 - 0.1]) cube([5, 5, 8.5 + 0.2]);
			if (supportLength <= 0) {
				color("silver")
				translate(v = [0, 10, length + 1 - 4])  cylinder(h = 4.1, r = 3/2 );
				color("silver")
				translate(v = [0, - 10, length + 1 - 4])  cylinder(h = 4.1, r = 3/2);
			}
		}
		if (supportLength > 0) {
				color("silver")
				translate(v = [0, 10, length + 1 - 4])  cylinder(h = 4.1 + supportLength, r = tollerance + 3/2);
				color("silver")
				translate(v = [0, - 10, length + 1 - 4])  cylinder(h = 4.1 + supportLength, r = tollerance +  3/2);
		}
	}
}

module motorMicroMotorsL149_4_6_12__10(supportLength=0, tollerance=0) {
	motorMicroMotorsL149(36,supportLength,tollerance);
}

module motorMicroMotorsL149_4_6_12__21(supportLength=0, tollerance=0) {
	motorMicroMotorsL149(36,supportLength,tollerance);
}

module motorMicroMotorsL149_4_6_12__43(supportLength=0, tollerance=0) {
	motorMicroMotorsL149(41,supportLength,tollerance);
}

module motorMicroMotorsL149_4_6_12__90(supportLength=0, tollerance=0) {
	motorMicroMotorsL149(41,supportLength,tollerance);
}

module motorMicroMotorsL149_4_6_12__188(supportLength=0, tollerance=0) {
	motorMicroMotorsL149(46,supportLength,tollerance);
}

module motorMicroMotorsL149_4_6_12__392(supportLength=0, tollerance=0) {
	motorMicroMotorsL149(46,supportLength,tollerance);
}

//examples

!translate(v = [40 * 00, 0, 0]) motorMicroMotorsL149_4_6_12__10(20, 0);
translate(v = [40 * 01, 0, 0]) motorMicroMotorsL149_4_6_12__21();
translate(v = [40 * 02, 0, 0]) motorMicroMotorsL149_4_6_12__43();
translate(v = [40 * 03, 0, 0]) motorMicroMotorsL149_4_6_12__90();	
translate(v = [40 * 04, 0, 0]) motorMicroMotorsL149_4_6_12__188();
translate(v = [40 * 05, 0, 0]) motorMicroMotorsL149_4_6_12__392();		


union () {
	motorMicroMotorsL149_4_6_12__10();
	rotate([0, 180, 0]) motorMicroMotorsL149_4_6_12__10();
}




