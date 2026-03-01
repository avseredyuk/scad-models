$fn=64;

difference() {
    import("Tapa 2M1C.stl");
    translate([0,5,0]) {
        rotate([90, 0, 0]) {
            cylinder(h=6, d=16);    
        }
    }
}
