$fn=64;

main();

module main() {
    difference() {
        import("4M1D.stl");
   
        color("red") 
            translate([-47,2.75,33.75])
                cube([50,7.5,22.5]);
    }

}
