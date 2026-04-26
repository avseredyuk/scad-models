$fn=64;

difference() {
    intersection () {
        main();
        cube([41,41,100], center=true);
    }

    rotate([0,0,45])
        translate([0,-21.75,0])
            color("blue") cylinder(h=5, d=6);
    rotate([0,0,-45])
        translate([0,-21.75,0])
            color("blue") cylinder(h=5, d=6);
    rotate([0,0,135])
        translate([0,-21.75,0])
            color("blue") cylinder(h=5, d=6);
    rotate([0,0,-135])
        translate([0,-21.75,0])
            color("blue") cylinder(h=5, d=6);
}

module main() {
        translate([19.2,8,0])
            import("frame.stl");
        difference() {
            legs();
            legs_holes();
            
        }
}

module legs() {
    rotate([0,0,45])
        translate([0,-22,15])
            color("red") cylinder(h=10, d=10);
    rotate([0,0,-45])
        translate([0,-22,15])
            color("red") cylinder(h=10, d=10);
    rotate([0,0,135])
        translate([0,-22,15])
            color("red") cylinder(h=10, d=10);
    rotate([0,0,-135])
        translate([0,-22,15])
            color("red") cylinder(h=10, d=10);
}
module legs_holes() {
    rotate([0,0,45])
        translate([0,-21.75,15])
            color("green") cylinder(h=10, d=3.5);
    rotate([0,0,-45])
        translate([0,-21.75,15])
            color("green") cylinder(h=10, d=3.5);
    rotate([0,0,135])
        translate([0,-21.75,15])
            color("green") cylinder(h=10, d=3.5);
    rotate([0,0,-135])
        translate([0,-21.75,15])
            color("green") cylinder(h=10, d=3.5);
}
