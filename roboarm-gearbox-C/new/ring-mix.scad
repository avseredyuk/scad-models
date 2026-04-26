$fn=64;

btm_h = 6;
bottow_m = 41;
ring_h=6;
total_h = btm_h+ring_h;


difference() {
    union() {
        ring();
        difference() {
            bottom();
            color("red") cylinder(h=btm_h, d=34);
        }
    }
    holes();
}

module bottom() {
    difference() {
        translate([0,0,btm_h/2])
            cube([bottow_m,bottow_m,btm_h], center=true);
            
        translate([bottow_m/2+1,bottow_m/2+1,btm_h/2])
            rotate([0,0,45])
                cube([10,10,10], center=true);
        translate([bottow_m/2+1,-bottow_m/2-1,btm_h/2])
            rotate([0,0,45])
                cube([10,10,10], center=true);
        translate([-bottow_m/2-1,bottow_m/2+1,btm_h/2])
            rotate([0,0,45])
                cube([10,10,10], center=true);
        translate([-bottow_m/2-1,-bottow_m/2-1,btm_h/2])
            rotate([0,0,45])
                cube([10,10,10], center=true);
    }
}

module ring() {
    intersection() {
        translate([0,0,btm_h])
            scale([0.95,0.95])
                import("ring.stl");
        cube([bottow_m,bottow_m,100],center=true);
    }
}

module holes() {
    rotate([0,0,45])
        translate([0,-21.75,0])
            color("blue") cylinder(h=total_h, d=3.5);
    rotate([0,0,-45])
        translate([0,-21.75,0])
            color("blue") cylinder(h=total_h, d=3.5);
    rotate([0,0,135])
        translate([0,-21.75,0])
            color("blue") cylinder(h=total_h, d=3.5);
    rotate([0,0,-135])
        translate([0,-21.75,0])
            color("blue") cylinder(h=total_h, d=3.5);
}