$fn=64;

main();

module main() {

    griper_start();
    
    translate([3, 0, 12])
        rotate([0, 180, 0])
            griper_end();

}

module main_part() {
    translate([-22.8,100,0])
        scale([1.2,1.2,1.2])
            import("GripperFinger.stl");
}

module griper_end() {
    intersection() {
        main_part();
        cutting_cube();
    }
}

module griper_start() {
    difference() {
        main_part();
        cutting_cube();
    }
}

module cutting_cube() {
    color("red")
        cube([20,20,20]);
}