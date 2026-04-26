$fn=64;

fan_hole_w = 31;
fan_between_holes_half = 24/2;

main();

module main() {

    difference() {
        translate([0,-39,35])
            import("3M2C.stl");
        
        color("blue") 
            translate([43,-17,-16])
                cube([fan_hole_w,11,fan_hole_w]);   
                
        translate([6,0,27])
            rotate([90,0,0])
                cylinder(h=50, d=3.2); 
        translate([6,0,27])
            rotate([90,0,0])
                cylinder(h=25, d=6.5); 
        translate([6,0,-27])
            rotate([90,0,0])
                cylinder(h=50, d=3.2); 
        translate([6,0,-27])
            rotate([90,0,0])
                cylinder(h=25, d=6.5); 
                
        translate([-1,-39,0])
            rotate([0,90,0])
                color("red") cylinder(h=10, d=25); 
                
        color("green") 
            translate([41-38,-66,-22])
                cube([37+38+-0.5,50,44]);    
    }
}
