echo ("general.scad");

tolleranceForUnionDifference = 0.1;

function enlarge(height = 0) = height + tolleranceForUnionDifference ;

function enlargeFrontBack(height = 0) = height + tolleranceForUnionDifference * 2 ;