// Global constants
$fn=64;

// Parameters
INNER_HOLE_DELTA = 0.2 * 2;

detail();

module detail() {
    difference() {
        union() {  
            cylinder(r=19.3 / 2, h=2.9);    
            translate([0, 0, 2.9])
                cylinder(r=11.5 / 2, h=5.8);
        }
        cylinder(r=(5.5 + INNER_HOLE_DELTA) / 2, h=8.7);    
    }
    
}

