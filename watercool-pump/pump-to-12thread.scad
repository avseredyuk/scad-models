union() {
    translate([-1855.3,1241.3,-25])
        import("agua.stl");
    difference() {
        import("12thread.stl");
        translate([0,0,12])
            cylinder(h=20, d=30);    
    }    
}
