$fn=64;

main();

module main() {
    //difference() {
    union() {
        scale([1.2,1.2,1.2])
            import("GripperHexBase_fixed.stl");
    
        color("red")
            translate([-7.5,-24.5,-32.5])
                cube([15, 37, 19.4]);
    }
       /* color("red")
            translate([-16,-2.5,-5.5])
                cube([32, 5, 3]);
    */
    //}

}
