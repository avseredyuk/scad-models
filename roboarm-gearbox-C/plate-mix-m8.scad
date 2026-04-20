$fn=64;

difference() {
    color("green") cylinder(h=10, d=33);

    color("red") cylinder(h=6.5, d=15, $fn = 6);  
   
    cylinder(h=20, d=8);
    
    rotate([0,0,0])
        translate([0,-12,0])
            cylinder(h=20, d=6.4);
    rotate([0,0,120])
        translate([0,-12,0])
            cylinder(h=20, d=6.4);
    rotate([0,0,240])
        translate([0,-12,0])
            cylinder(h=20, d=6.4);
            
    rotate([0,0,60])
        translate([0,-12,0])
            cylinder(h=20, d=3.4);
    rotate([0,0,180])
        translate([0,-12,0])
            cylinder(h=20, d=3.4);
    rotate([0,0,300])
        translate([0,-12,0])
            cylinder(h=20, d=3.4);

}
/*
translate([-24.8,18.26,0])
        import("plate.stl");
*/
