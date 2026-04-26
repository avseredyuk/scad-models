$fn=64;

planet();

module planet() {
    difference() {
        scale([0.95,0.95])
            import("planet.stl");
        cylinder(h=100, d=7);
    }
}
