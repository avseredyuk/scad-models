$fn=64;

difference() {
    import("Tapa 3M1C.stl");
    translate([0,4,0]) {
        rotate([90, 0, 0]) {
            color("red") 
                cylinder(h=6, d=16);    
        }
    }
}
