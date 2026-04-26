$fn=64;

sun_to_planet_rad_len = 11.875;

cover_h = 2 + 3 + 2;
top_w = 41;
top_cut1_d = 33+0.5;
top_cut2_d = top_cut1_d - 2;
top_cut3_d = 24 + 0.5;

//main_bottom();
//main_top();
main_top_cover();

module main_top_cover() {
    difference() {
        translate([0,0,cover_h/2])
            cube([top_w,top_w,cover_h], center=true);
            
        translate([top_w/2+1,top_w/2+1,cover_h/2])
            rotate([0,0,45])
                cube([10,10,10], center=true);
        translate([top_w/2+1,-top_w/2-1,cover_h/2])
            rotate([0,0,45])
                cube([10,10,10], center=true);
        translate([-top_w/2-1,top_w/2+1,cover_h/2])
            rotate([0,0,45])
                cube([10,10,10], center=true);
        translate([-top_w/2-1,-top_w/2-1,cover_h/2])
            rotate([0,0,45])
                cube([10,10,10], center=true);
        top_cover_holes();
        
        cylinder(d=top_cut1_d, h=2);
        
        translate([0,0,2])
            cylinder(d=top_cut2_d, h=3);
            
        translate([0,0,5])
            cylinder(d=top_cut3_d, h=3);
        
    }
}

module main_bottom() {
    difference() {
        cylinder(d=33, h=2);
        
        cylinder(d=16, h=2);
        
        hole();
        rotate([0,0,90])
            hole();
        rotate([0,0,180])
            hole();
        rotate([0,0,270])
            hole();
    }
}

module main_top() {
    difference() {
        union() {
            cylinder(d=33, h=6);
            translate([0,0,2])
                color("blue") cylinder(d=24, h=6);
            translate([0,0,8])
                color("red") cylinder(d=24, h=3);
            translate([0,0,11])
                color("purple") cylinder(d=24, h=4);
            translate([0,0,15])
                color("blue") cylinder(d=24, h=5);
        }
        
        cylinder(d=16, h=2);
        
        hole();
        rotate([0,0,90])
            hole();
        rotate([0,0,180])
            hole();
        rotate([0,0,270])
            hole();
        
        big_hole();
        rotate([0,0,90])
            big_hole();
        rotate([0,0,180])
            big_hole();
        rotate([0,0,270])
            big_hole();
            
        translate([0,0,2]) 
            color("red") cylinder(h=6.5, d=15, $fn = 6);  
            
        translate([0,0,11])
                color("purple") cylinder(d=20, h=100);
            
        cylinder(d=8, h=100);
    }
}


module hole() {
    translate([sun_to_planet_rad_len, 0, 0])
            cylinder(d=3, h=10);
}

module big_hole() {
    translate([sun_to_planet_rad_len, 0, 2])
            cylinder(d=6, h=8);
}

module top_cover_holes() {
    rotate([0,0,45])
        translate([0,-21.75,0])
            color("blue") cylinder(h=100, d=3.5);
    rotate([0,0,-45])
        translate([0,-21.75,0])
            color("blue") cylinder(h=100, d=3.5);
    rotate([0,0,135])
        translate([0,-21.75,0])
            color("blue") cylinder(h=100, d=3.5);
    rotate([0,0,-135])
        translate([0,-21.75,0])
            color("blue") cylinder(h=100, d=3.5);
}