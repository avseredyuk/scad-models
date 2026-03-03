$fn=64;

main();

module main() {
    difference() {
        import("4M2CB.stl");
        
        color("red")
            translate([1.75,27,-1.5])
                rotate([90,0,0])
                    linear_extrude(height = 22) 
                        polygon(points = [[25.5,-31], [24.5,-32], [0,-6], [1,-5]]);
    
        color("green")
            translate([-1.75,5,-1.5])
                rotate([0,0,180])
                    rotate([90,0,0])
                        linear_extrude(height = 22) 
                            polygon(points = [[25.5,-31], [24.5,-32], [0,-6], [1,-5]]);

    }

}
