$fn=64;

$mode = 2; //1 - main model, 2 - cutout holder

if($mode == 1) {
    main();
    //cutout();
} else {
    cutout();
}

module main() {
    difference() {
        translate([0,-39,35])
            import("3M2CC.stl");
    
        cutout_base();
    
        color("green") 
            translate([-15,-12,0])
                rotate([0,90,0])
                    cylinder(h=130, d=4); 
        
        color("blue") 
            translate([-35,-12,0])
                rotate([0,90,0])
                    cylinder(h=130, d=7); 
    
        color("red") 
            translate([114,-70,-4.5])
                cube([4,100,9]);
    
        color("blue") 
            translate([41,-66,-23])
                cube([37,50,46]);     
    }
     
}

module cutout_base() {
    color("red")
        translate([55,1,-16])
            rotate([90,0,0])
                linear_extrude(height = 22) 
                    polygon(points = [[52,10], [23,3], [23,29], [52,21]]);
}

module cutout() {
    difference() {
        cutout_base();
    
        color("green") 
            translate([-15,-12,0])
                rotate([0,90,0])
                    cylinder(h=130, d=4); 
        
        color("blue") 
            translate([-35,-12,0])
                rotate([0,90,0])
                    cylinder(h=130, d=7); 
        
        color("yellow")
            translate([55,1,-16])
                rotate([90,0,0])
                    linear_extrude(height = 3) 
                        polygon(points = [[52,10], [23,3], [23,29], [52,21]]);
    
        translate([70,-25,-15])
            cube([10,40,40]);
            
        translate([105,-25,-15])
            cube([10,40,40]);

    }
    
}

