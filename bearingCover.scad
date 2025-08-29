// Global constants
$fn=64;
$cuttingCubeSize = 1000;
$cuttingCylinderSize = 50;

$bearingD = 22;
$bearingH = 7;
$wallRollingSurface = 3;
$wallSide = 2;
$wallSleeve = 5;

$formWall = 2;

detail();

module detail() {
    
    $formHeight = $bearingH + $wallSide * 2;
    
    intersection() {
        difference() {
            color([1,1,0]) translate ([0,0,-$wallSide-$formWall])
                cylinder(r = ($bearingD / 2) + $wallRollingSurface + $formWall * 2, 
                    h = $bearingH + $wallSide * 2 + $formWall * 2);
            difference() {
                union() {
                    color([0,1,0]) cylinder(r = ($bearingD / 2) + $wallRollingSurface, h = $bearingH); // rolling surface
                    color([0,0,1]) translate ([0,0,-$wallSide])
                        cylinder(r = ($bearingD / 2) + $wallRollingSurface, h = $bearingH + $wallSide * 2); // sleeves sides
                }
                color([0,1,1]) translate ([0,0,-$cuttingCylinderSize/2])
                    cylinder(r = ($bearingD - $wallSleeve) / 2, h = $cuttingCylinderSize); // sleeves sides cutout
                color([1,0,0]) cylinder(r = $bearingD / 2, h = $bearingH); // bearing
            }
        }
        translate([-$cuttingCubeSize/2, -$cuttingCubeSize/2, $formHeight / 2])
            cube ([$cuttingCubeSize, $cuttingCubeSize, $cuttingCubeSize]);
    }
    /*
    
        difference() {
            cylinder(r = ($bearingD / 2) + $wallRollingSurface, h = $formHeight);
            translate([0, 0, $wallSide])
                cylinder(r = $bearingD / 2, h = $bearingH);
        }
        translate([-$cuttingCubeSize/2, -$cuttingCubeSize/2, $formHeight / 2])
            cube ([$cuttingCubeSize, $cuttingCubeSize, $cuttingCubeSize]);
    }
    */
    
    
    
    
    
}

