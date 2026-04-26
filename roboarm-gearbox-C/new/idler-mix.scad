$fn=64;

idler();

main_part();

module main_part() {
    intersection() {
        translate([42.5,87,-10.5])
            import("main-idler.stl");
        translate([0,0,-50])
            cube([100,100,100], center=true);
    }
}


module idler() {
    difference() {
        scale([0.95,0.95])
            import("idler.stl");
        cylinder(h=100, d=5);
    }
}
