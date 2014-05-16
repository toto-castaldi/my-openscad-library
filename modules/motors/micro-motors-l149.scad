module motorMicroMotorsL149(length) {
	color("grey") cylinder(h = 1, r = 8.5 / 2);
	color("grey") translate(v = [0, 0, 1]) cylinder(h = 21, r = 27 / 2);
	color("black")
	intersection() {
		translate(v = [0, 0, 21 + 1]) cylinder(h = length - 21, r = 27 / 2);
		translate(v = [0, 0, 21 + 1]) sphere(19);
	}
	color("black")
	translate(v = [0, 0, length + 1]) cylinder(h = 4.5, r = 9 / 2);
	color("silver")
	translate(v = [0, 0, length + 5.5]) cylinder(h = 2.5, r = 4 / 2);
	color("silver")	
	difference() {
		translate(v = [0, 0, length + 8]) cylinder(h = 8.5, r = 4 / 2);
		translate(v = [- 5 / 2, 1.5, length + 8 - 0.1]) cube([5, 5, 8.5 + 0.2]);
	}
}

module motorMicroMotorsL149_4_6_12__10() {
	motorMicroMotorsL149(36);
}


motorMicroMotorsL149_4_6_12__10();

