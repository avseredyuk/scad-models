// Global Constants
D = 0.125;
D2 = D * 2;
// Input Parameters
materialWidth = 9;
modelLength = 145;
wallThickness = 1;
wingSize = 12;
// Fence
fenceOn = true;
fenceHeight = 15;
fenceThickness = 2;
// Corner cuts
cornerCount = 1;
// Middle cut in the fence
middleCutOn = false;
middleCutWidth = 15;

// Selected module call
edge(materialWidth, modelLength, wallThickness, wingSize, fenceOn, fenceHeight, 
    fenceThickness, cornerCount, middleCutOn, middleCutWidth);

module edge(width, length, wall, wing, is_fence, f_height, f_thickness, corners,
    is_middle_cut, middle_cut_width) {
    if (corners == 0) {
        mainEdge(width, length, wall, wing, is_fence, f_height, f_thickness,
            is_middle_cut, middle_cut_width);
    } else if (corners == 1) {
        difference() {
            mainEdge(width, length, wall, wing, is_fence, f_height, f_thickness,
                is_middle_cut, middle_cut_width);
            rotate([-45, 0, 0]) 
                edgeCornerCube(width, wall, f_height, wing);
        }
    } else {
        difference() {
            mainEdge(width, length, wall, wing, is_fence, f_height, f_thickness,
                is_middle_cut, middle_cut_width);
            rotate([-45, 0, 0]) 
                edgeCornerCube(width, wall, f_height, wing);
            translate([0, 0, length]) 
                rotate([-45, 0, 0])
                    edgeCornerCube(width, wall, f_height, wing);
        }
    }
}

module edgeCornerCube(eWidth, eWall, eFHeight, eWing) {
    cube([eWidth + eWall + eFHeight + D, (eWing + eWall) * 2, (eWing + eWall) * 2]);
}
    
module mainEdge(width, length, wall, wing, is_fence, f_height, f_thickness,
                is_middle_cut, middle_cut_width) {
    difference() {
        linear_extrude(length) {
            polygon(points=[
                [0, 0], 
                [width + wall * 2 + D, 0], 
                [width + wall * 2 + D, wing + wall],
                [width + wall + D, wing + wall],
                [width + wall + D, wall],
                [wall, wall],
                [wall, wing + wall],
                [0, wing + wall]]);
            if (is_fence) {
                polygon(points=[
                    [width + wall + D, 0], 
                    [width + wall + D, f_thickness],
                    [width + wall + f_height + D, f_thickness],
                    [width + wall + f_height + D, 0],
                    ]);
            }
        }
        if (is_middle_cut) {
            translate([width + wall * 2 + D, 0, length/2 - middle_cut_width/2]) 
                cube([f_height, wall + f_height, middle_cut_width]);
        }
    }
    
}

