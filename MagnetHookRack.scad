// Global constants
$fn=32;
D = 0.125;
D2 = D * 2;
D4 = D * 4;

// Input Parameters
magW = 15;
magH = 5;
wallW = 3;
tubeR = 4;

// Selected module call
//hook(tubeR);
//upperConnector(magW, magH, wallW, tubeR);
lowerConnector(magW, magH, wallW, tubeR);

module lowerConnector(magnetWidth, magnetHeight, magnetWall, tubeRadius) {
    difference() {
        tubeShellW = 3;
        tubeHoleL = 10;
        magThinWallH = 1;
        threadHoleR = 1;
        hullShapeHeight = 1;
        magWithDoubleWall = magnetWidth + magnetWall * 2;
        tubeWithShell = tubeRadius + tubeShellW;
        
        hull() {
            // box for magnet
            cube([magWithDoubleWall, magWithDoubleWall, magnetHeight + magnetWall + magThinWallH]);
            
            // cyllinder box for tube #1
            translate([magWithDoubleWall, (magWithDoubleWall)/2, tubeWithShell])
                rotate([0, 90, 0])  {
                    cylinder(r=tubeWithShell, h=tubeHoleL);
                };
            // bottom shape for hull #1
            translate([magWithDoubleWall, 0, 0])
                cube([tubeHoleL, magWithDoubleWall, hullShapeHeight]);
                
            // cyllinder box for tube #2
            translate([(magWithDoubleWall)/2, magWithDoubleWall + tubeHoleL, tubeWithShell])
                rotate([90, 0, 0])  {
                    cylinder(r=tubeWithShell, h=tubeHoleL);
                };
            // bottom shape for hull #2
            translate([0, magWithDoubleWall, 0])
                cube([magWithDoubleWall, tubeHoleL, hullShapeHeight]);
        };
        
        // magnet hole
        translate([magnetWall, 0, magThinWallH])
            cube([magnetWidth + D4, magnetWidth + D4, magnetHeight + D4]);
        
        // tube hole #1
        translate([magWithDoubleWall, (magWithDoubleWall)/2, tubeWithShell])
            rotate([0, 90, 0])  {
                cylinder(r=tubeRadius + D, h=tubeHoleL);
            };
        // thread hole #1
        translate([magnetWall+magnetWidth/2, (magWithDoubleWall)/2, tubeWithShell])
            rotate([0, 90, 0])  {
                cylinder(r=threadHoleR, h=magWithDoubleWall + tubeHoleL - magnetWall - magnetWidth/2);
            };
            
        // tube hole #2
        translate([(magWithDoubleWall)/2, magWithDoubleWall, tubeWithShell])
            rotate([-90, 0, 0])  {
                cylinder(r=tubeRadius + D, h=tubeHoleL);
            };
        // thread hole #2
        translate([magWithDoubleWall/2, magnetWall + magnetWidth/2, tubeWithShell])
            rotate([-90, 0, 0])  {
                cylinder(r=threadHoleR, h=magWithDoubleWall + tubeHoleL - magnetWall - magnetWidth/2);
            };
    }
}

module upperConnector(magnetWidth, magnetHeight, magnetWall, tubeRadius) {
    tubeShellW = 3;
    tubeHoleL = 10;
    magThinWallH = 1;
    threadHoleR = 1;
    magWithDoubleWall = magnetWidth + magnetWall * 2;
    tubeWithShell = tubeRadius + tubeShellW;
    
    difference() {
        hull() {
            // box for magnet
            cube([magWithDoubleWall, magWithDoubleWall, magnetHeight + magnetWall + magThinWallH]);
            
            hull() {
                // cyllinder box for tube #1
                translate([magWithDoubleWall + tubeWithShell, tubeWithShell + (magWithDoubleWall-tubeWithShell)/2, 0 -  
                    tubeHoleL - tubeWithShell])
                    cylinder(r=tubeWithShell, h=tubeHoleL);
                    
                // cyllinder box for tube #2
                translate([magWithDoubleWall + tubeWithShell, tubeWithShell - magnetWall, 0 - tubeRadius])
                    rotate([90, 0, 0])  {
                        cylinder(r=tubeWithShell, h=tubeHoleL);
                    }
            }
        }
        // need to cut corner after hull
        translate([0, - 20, - tubeHoleL - tubeWithShell]) 
            cube([magWithDoubleWall, 20*3, tubeHoleL + tubeWithShell]);
        // magnet hole
        translate([0, magnetWall, magThinWallH])
            cube([magnetWidth + D4, magnetWidth + D4, magnetHeight + D4]);
        // tube hole #1
        translate([magWithDoubleWall + tubeWithShell, tubeWithShell + (magWithDoubleWall-tubeWithShell)/2, 0 -  
                    tubeHoleL - tubeWithShell])
            cylinder(r=tubeRadius + D, h=tubeHoleL);
        // thread hole #1
        translate([magWithDoubleWall + tubeWithShell, tubeWithShell + (magWithDoubleWall-tubeWithShell)/2, 0 -  
                    tubeHoleL - tubeWithShell])
            cylinder(r=threadHoleR, h=tubeHoleL + tubeRadius);
        
        // tube hole #2
        translate([magWithDoubleWall + tubeWithShell, tubeWithShell - magnetWall, - tubeRadius])
            rotate([90, 0, 0])  {
                cylinder(r=tubeRadius + D, h=tubeHoleL);
            }
        // thread hole #2
        translate([magWithDoubleWall + tubeWithShell, tubeWithShell + tubeRadius + magnetWall, - tubeRadius])
            rotate([90, 0, 0])  {
                cylinder(r=threadHoleR + D, h=tubeHoleL + tubeRadius);
            }
    }
}

module hook(tubeRadius) {
    legL = 35;
    hookW = 5;
    hookTubeOuterR = 11;
    hookTubeInnerR = 8;
    tubeWall = 1.25;
    tubeOuterR = tubeRadius + D2 + tubeWall;
    
    // tube circle
    difference() {
        cylinder(r=tubeOuterR, h=hookW);
        cylinder(r=tubeRadius + D2, h=hookW);
    }
    // leg 
    linear_extrude(hookW) {
        polygon(points=[
            [0, tubeRadius + D2], 
            [0, tubeOuterR], 
            [legL, - tubeOuterR + hookTubeOuterR], 
            [legL, - tubeOuterR + hookTubeInnerR]]);
    }
    // hook
    translate([legL, - tubeOuterR, 0]) 
        difference() {
            cylinder(r=hookTubeOuterR, h=hookW);
            cylinder(r=hookTubeInnerR, h=hookW);
            translate([- hookTubeOuterR*2, -hookTubeOuterR, 0]) 
                cube([hookTubeOuterR*2, hookTubeOuterR*2, hookTubeOuterR*2]);
        }
}


