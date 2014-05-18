module motorMicroMotorsL149(length) {	
	difference() {
		union() {
			color("grey") cylinder(h = 1, r = 8.5 / 2);
			color("grey") translate(v = [0, 0, 1]) cylinder(h = 21, r = 27 / 2);
			color("black")
			intersection() {
				translate(v = [0, 0, 21 + 1]) cylinder(h = length - 21, r = 27 / 2);
				translate(v = [0, 0, length - 14]) sphere(19.5);
			}
			color("black")
			translate(v = [0, 0, length + 1]) cylinder(h = 4.5, r = 9 / 2);
			intersection() {
				color("silver")
				translate(v = [0, 0, length + 5.5]) cylinder(h = 11, r = 4 / 2);
				color("silver")
				union() {
					translate(v = [0, 0, length + 11.7]) sphere(5);
					translate(v = [- 10 / 2, - 10 / 2, length + 4 ]) cube([10, 10, 6]);
				}
			}				
		}
		color("silver")
		translate(v = [- 5 / 2, 1.5, length + 8 - 0.1]) cube([5, 5, 8.5 + 0.2]);
		color("silver")
		translate(v = [0, 10, length + 1 - 4])  cylinder(h = 4.1, r = 3/2);
		color("silver")
		translate(v = [0, - 10, length + 1 - 4])  cylinder(h = 4.1, r = 3/2);
	}
}

module motorMicroMotorsL149_4_6_12__10() {
	motorMicroMotorsL149(36);
}

module motorMicroMotorsL149_4_6_12__21() {
	motorMicroMotorsL149(36);
}

module motorMicroMotorsL149_4_6_12__43() {
	motorMicroMotorsL149(41);
}

module motorMicroMotorsL149_4_6_12__90() {
	motorMicroMotorsL149(41);
}

module motorMicroMotorsL149_4_6_12__188() {
	motorMicroMotorsL149(46);
}

module motorMicroMotorsL149_4_6_12__392() {
	motorMicroMotorsL149(46);
}

//test
//
//translate(v = [40 * 00, 0, 0]) motorMicroMotorsL149_4_6_12__10();
//translate(v = [40 * 01, 0, 0]) motorMicroMotorsL149_4_6_12__21();
//translate(v = [40 * 02, 0, 0]) motorMicroMotorsL149_4_6_12__43();
//translate(v = [40 * 03, 0, 0]) motorMicroMotorsL149_4_6_12__90();	
//translate(v = [40 * 04, 0, 0]) motorMicroMotorsL149_4_6_12__188();
//translate(v = [40 * 05, 0, 0]) motorMicroMotorsL149_4_6_12__392();		

