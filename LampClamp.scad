// Global Constants
D = 0.125;
D4 = D * 4;
// Input Parameters
lampWidth1 = 62;
lampWidth2 = 59;
clampWidth = 13;

// Selected module call
clamp(lampWidth1, lampWidth2, clampWidth, false);

module clamp(lampW1, lampW2, clampW, cableHoleNeeded) {
    c_thick = 3;
    LAMP_LEN = 100;
    L_W = lampW1 + D4;
    L_H = 9 + D4;
    L2_W = lampW2 + D4;
    L2_H = 16 + D4;
    cableHeight = 3;
    cableWidth = 6;
    
    difference() {
        // clamp
        translate([0 - c_thick, 0, - c_thick]) 
            cube([L_W + c_thick * 2, clampW, L_H + c_thick * 2 + cableHeight]);
        // lamp
        translate([0, 0, cableHeight]) 
            union() {
                cube([L_W, LAMP_LEN, L_H]);
                translate([(L_W-L2_W)/2, 0, L_H]) 
                    cube([L2_W, LAMP_LEN, L2_H]);
            }
        // thin bolt hole   
        translate([L_W / 2, clampW / 2, - 10]) 
            cylinder(h = 30, r = 2, $fn = 16);
        // thick bolt hole
        translate([L_W / 2, clampW / 2, - 2]) 
            cylinder(h = 30, r = 4.5, $fn = 16);
        // hole for cable
        if (cableHoleNeeded) {
            translate([(L_W + c_thick * 2)/3 - cableWidth, 0, - c_thick]) 
                cube([cableWidth, clampWidth, cableHeight]);
        }
        

    }
}
