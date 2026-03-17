$fn=64;

main();

module main() {
    difference() {
        scale([1.2,1.2,1.2])
            import("GripperServoDisk.stl");
        
        color("red")
            translate([-16,-2.5,-5.5])
                cube([32, 5, 3]);
    }

}
