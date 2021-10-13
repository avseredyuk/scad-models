wall = 3;
diam = 25;
height = 25;

difference() {
    cylinder(h = height, d = diam + wall * 2, $fn = 64);
    cylinder(h = height, d = diam, $fn = 64);
}