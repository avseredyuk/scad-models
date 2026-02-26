$fn=64;

$mode = 1; //1 - main model, 2 - cutout holder

if($mode == 1) {
    main();
    //cutout();
} else {
    cutout();
}

module main() {
    difference() {
        import("2M2MA.stl");
    
        cutout_base(); //[-35,-31], [2,28], [28,28], [64,-31]
    
        color("green") 
            translate([0,37,-55])
                cylinder(h=40, d=4);  
    }
}

module cutout_base() {
    difference() {
        color("red")
            translate([-15,48,-53])
                rotate([90,0,0])
                    linear_extrude(height = 19) 
                        polygon(points = [[-21,-8], [2,28], [28,28], [51,-8]]);
    }
}

module cutout() {
    difference() {
        cutout_base();
    
        color("green") 
            translate([0,37,-62])
                cylinder(h=120, d=4);
        
        translate([-55,25,-66])
            cube([100,25,10]);
        
        translate([-55,25,-27])
            cube([100,25,10]);
        
        color("green") 
            translate([0,37,-56])
                cylinder(h=15, d=8);
        
        color("green") 
            translate([-15,48,-53])
                rotate([90,0,0])
                    linear_extrude(height = 3) 
                        polygon(points = [[-21,-8], [2,28], [28,28], [51,-8]]);
    }
    
    

}

