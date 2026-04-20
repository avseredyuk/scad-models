$fn=64;

main();

module main() {
/*
    translate([-1,-5,-18.8])
        rotate([0,0,-45])
        scale([1.2,1.2,1.2])
            color("red")
                import("GripperHexBase_fixed.stl");
*/
    union() {
        translate([0,-4,-60])
            rotate([0,0,-45])
                legs();
        
        translate([-36,-6,0])
            arm_base();
    }

}

module arm_base() {
    linear_extrude(height = 5) {
        union() {
            main_half();
            
            mirror([0,1,0])
                main_half();
        }
    }
}

module main_half() {
    scale([1.2,1.2,1.2])
        projection(cut = false) 
            difference() {
                translate([0,0,45])    
                    import("Top Plate C.stl");
                translate([-20,-40,0])
                    cube([80,80,80]);        
            }
}

module legs() {
    leg_odd();
    
    translate([1,-2,0])
        leg_norm();
    
    rotate([0,0,120])
        leg_norm();
}

module leg_odd() {
    translate([5,-27,0])
        rotate([0,0,180])
            leg_base();
}

module leg_norm() {
    translate([13.1,14.7,0])
        rotate([0,0,-60])
            leg_base();
}

module leg_base() {
    difference() {
        translate([10,0,0])
            rotate([0,-90,0])
                linear_extrude(height = 10)
                    leg_projection();
        translate([5,0,5])
            rotate([90,0,0])
                translate([0,0,-10])
                    cylinder(h = 20, r = 1.95);
    }
}

module leg_projection() {
    square(size = [31, 5]);
    difference() {
        translate([45,3,0])
            difference() {
                circle(d=30);
                translate([-15,-23,0])
                    square(size = [39, 20]);
            }
        translate([45,3,0])
            circle(d=20);
    }
    translate([59,0,0])
        square(size = [6, 5]);
}