$fn=64;

main();

module main() {
    difference() {
        union() {
            scale([1.2,1.2,1.2])
                import("GripperHexBase_fixed.stl");
        
            color("red")
                translate([-7.5,-24.5,-32.5])
                    cube([15, 37, 19.4]);
        }
    
        color("green")
            translate([-7.5,-18,-32.5])
                cube([15, 24, 21.4]);
                
        color("purple")
            translate([-3,0,-32.5])
                cube([6, 20, 15]);
    }
    


}
