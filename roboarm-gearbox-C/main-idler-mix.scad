$fn=64;
cut_l = 2.5;

intersection() {
    main_part();
    cutter();
}

translate([0,0,-cut_l])
    difference() {
        main_part();
            cutter2();
    }

    
module main_part() {
    translate([42.5,87,0])
        import("main-idler.stl");
}

module cutter() {
    cube([100, 100, 13], center = true);
}
module cutter2() {
    cube([100, 100, 13+2*cut_l], center = true);
}