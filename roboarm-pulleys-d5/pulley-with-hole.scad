$fn=64;

difference() {
    import("Pulley_T-MXL-XL-HTD-GT2_N-tooth-3.stl");
    translate([0,0,10]) {
        rotate([90, 0, 0]) {
            cylinder(h=30, d=3);    
        }
    }
    translate([0,-3.3,15]) {
        cube([5.5,3.2,17],true);
    }
}
