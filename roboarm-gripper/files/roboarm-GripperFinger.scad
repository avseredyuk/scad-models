$fn=64;

main();

module main() {

    difference() {
    
        union() {
            griper_start();
        
            translate([19, -15, 12])
                rotate([0, 180, 0])
                    griper_end();
        
            translate([0, 57, 0])
                cube([19, 4, 12]);
                
            translate([16, 42, 0])
                cube([3, 15, 12]);  
            
            translate([10, -12, 0])
                cube([3, 15, 12]);  
                
            translate([10, -1, 0])
                cube([9, 4, 12]);
                
            translate([12, 0, 4.5])
                cube([5, 60, 3]);
        }
    
        translate([5, -4.5, 6])
            rotate([0, 90, 0])
                cylinder(h = 20, r = 1.95);
                
        translate([13, -4.5, 6])
            rotate([0, 90, 0])
                cylinder(h = 20, r = 3);
    }
    
    
}

module main_part() {
    translate([-22.8,100,0])
        scale([1.2,1.2,1.2])
            import("GripperFinger.stl");
}

module griper_end() {
    difference() {
        intersection() {
            main_part();
            cutting_cube();
        }
        translate([9,0,0])
            cube([20,20,20]);
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
        translate([-5,0,0])
            cube([40,60,20]);
}