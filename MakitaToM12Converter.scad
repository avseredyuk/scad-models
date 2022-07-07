// Global constants
$fn=64;

detail();

module detail() {
    linear_extrude(height = 14, center = true) {
        square(size=12, center = true);        
    }
    translate([0, 0, 14])
        linear_extrude(height = 20, center = true) {
            circle(r=3, $fn=6);
        }
    
}

