$fn=64;

main();

module main() {

    difference() {
        intersection() {
            rotate([90,0,180])
                difference() {
                    import("4M1D.stl");
                    color("red") 
                        translate([-54,2.75,33.75])
                            cube([50,7.5,22.5]); 
                    color("magenta") 
                        translate([-54, 2.75+7.5, 33.75 + 4.5])
                            cube([50, 7.5 + 5, 13.5]); 
                }
                  
                translate([-10,-10,-10])
                    cube([100,100,29]);
                    
          
        }
        //translate([35,45,0])
        //    color("green") cylinder(h=50,d=8);
        //translate([35,45,4])
        //    color("blue") cylinder(h=16,d=22.35);
        translate([35,45,0])
            color("blue") cylinder(h=0.5,d=20.25);
            
        small_holes();
    }
    
    /*
    difference() {
        translate([0,0,5]) {
            intersection() {
                rotate([90,0,180])
                    import("4M1D.stl");
                translate([-10,-10,19])
                        cube([100,100,300]);
            }
        }
        
        small_holes();
    }
    */
    
}

module small_holes() {
    translate([7,24,-10])
        color("blue") cylinder(h=80,d=3.2);
    translate([7,24,42])
        color("blue") cylinder(h=80,d=6.2);
    translate([7,24,-0.05])
        color("red") cylinder(h=7,d=4);
        
    translate([7,66,-10])
        color("blue") cylinder(h=80,d=3.2);
    translate([7,66,42])
        color("blue") cylinder(h=80,d=6.2);
    translate([7,66,-0.05])
        color("red") cylinder(h=7,d=4);
        
    translate([63,24,-10])
        color("blue") cylinder(h=80,d=3.2);
    translate([63,24,42])
        color("blue") cylinder(h=80,d=6.2);
    translate([63,24,-0.05])
        color("red") cylinder(h=7,d=4);
        
    translate([63,66,-10])
        color("blue") cylinder(h=80,d=3.2);
    translate([63,66,42])
        color("blue") cylinder(h=80,d=6.2);
    translate([63,66,-0.05])
        color("red") cylinder(h=7,d=4);
}
