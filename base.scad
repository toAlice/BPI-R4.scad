include <var.scad>

module base()
{
    module inter(h = iz)
    {
        union()
        {
            translate([r, r, r]) 
            minkowski() 
            {
                cube([ix - r * 2, iy - r * 2, h - r * 2]);
                sphere(r = r);
            }
            translate([fpspace, -10, under + pcbt])
            {
                translate([7.46 + r - gap, 0, -gap])
                cube([13.88 - 7.46 - r * 2 + gap * 2, 20, usby + gap * 2]);

                translate([16.14 + r - gap, 0, -gap])
                cube([50.91 - 16.14 - r * 2 + gap * 2, 20, sfpy + gap * 2]);

                translate([63.12 + r - gap, 0, -gap]) 
                cube([122.81 - 63.12 - r * 2 + gap * 2, 20, rj45y + gap * 2]);

                translate([124.67 + r - gap, 0, -gap])
                cube([134.67 - 124.67 - r * 2 + gap * 2, 20, powy + gap * 2]);

                translate([137.23 + r - gap, 0, -gap]) 
                cube([146.23 - 137.23 - r * 2 + gap * 2, 20, typecy + gap * 2]);
            }
        }
    }

    module outer(h = oz)
    {
        translate([-thickness + rout, -thickness + rout, -thickness]) 
        linear_extrude(h)
        minkowski() 
        {
            square([ox- rout * 2, oy - rout * 2]);
            circle(r = rout);
        }
    }

    module stand()
    {
        translate([0, 0, -1])
        cylinder(h = under - 1, r = 3.5);
    }

    module shroud() {
        difference() 
        {
            union()
            {
                difference() 
                {
                    intersection() 
                    {
                        outer(oz + 20);
                        translate(v = [-10, -10, -10 - thickness])
                        {
                            cube(size = [ox + 20, oy + 20, oz + 10]);
                        }
                    }
                    inter(iz + 10);
                }
                
                translate(v = [fpspace + 3.5, 23.5, 0])
                {
                    stand();
                }

                translate(v = [fpspace + 144.5, 23.5, 0])
                {
                    stand();
                }

                translate(v = [fpspace + 3.5, 97, 0])
                {
                    stand();
                }

                translate(v = [fpspace + 144.5, 97, 0])
                {
                    stand();
                }
            }

            translate(v = [fpspace + 3.5, 23.5, 0])
            {
                translate(v = [0, 0, -thickness - 1]) 
                cylinder(h=10, r = 2.2);
            }

            translate(v = [fpspace + 144.5, 23.5, 0])
            {
                translate(v = [0, 0, -thickness - 1]) 
                cylinder(h=10, r = 2.2);
            }

            translate(v = [fpspace + 3.5, 97, 0])
            {
                translate(v = [0, 0, -thickness - 1]) 
                cylinder(h=10, r = 2.2);
            }

            translate(v = [fpspace + 144.5, 97, 0])
            {
                translate(v = [0, 0, -thickness - 1]) 
                cylinder(h=10, r = 2.2);
            }

            translate([ix - 1, iy / 8 + thickness, iz / 5]) 
            {
                translate(v = [0, thickness * 1, 0]) 
                cube([thickness + 2, thickness, iz / 5 * 3]);
                translate(v = [0, thickness * 3, 0]) 
                cube([thickness + 2, thickness, iz / 5 * 3]);
                translate(v = [0, thickness * 5, 0]) 
                cube([thickness + 2, thickness, iz / 5 * 3]);
                translate(v = [0, thickness * 7, 0]) 
                cube([thickness + 2, thickness, iz / 5 * 3]);
                translate(v = [0, thickness * 9, 0]) 
                cube([thickness + 2, thickness, iz / 5 * 3]);
                translate(v = [0, thickness * 11, 0]) 
                cube([thickness + 2, thickness, iz / 5 * 3]);
                translate(v = [0, thickness * 13, 0]) 
                cube([thickness + 2, thickness, iz / 5 * 3]);
                translate(v = [0, thickness * 15, 0]) 
                cube([thickness + 2, thickness, iz / 5 * 3]);
                translate(v = [0, thickness * 17, 0]) 
                cube([thickness + 2, thickness, iz / 5 * 3]);
            }
        }
    }

    module xrib()
    {
        module single()
        {
            translate([thickness, 0, 0])
            rotate([0, 270, 0]) 
            linear_extrude(height = thickness) 
            difference() 
            {
                translate([-rib + rrib, -rib + rrib])
                {
                    minkowski() 
                    {
                        square([iz + rib * 2 - rrib * 2, iy + rib * 2 - rrib * 2]);
                        circle(r = rrib);
                    }
                }
                translate([-0.01, -0.01])
                square([iz + 0.02 + 10, iy + 0.02]);
                translate([under + pcbt - 0.01, -8]) 
                square([15, 10]);
            }
        }

        translate([- thickness / 2, 0, 0])
        {
            translate([ix / 8 * 1, 0 ,0]) 
            single();

            translate([ix / 3 * 1, 0 ,0]) 
            single();

            translate([ix / 3 * 2, 0 ,0]) 
            single();

            translate([ix / 8 * 7, 0 ,0]) 
            single();
        }
    }

    module yrib()
    {
        module single()
        {
            translate([0, thickness, 0])
            rotate([90, 0, 0])
            linear_extrude(height = thickness)
            difference() 
            {
                translate([-rib + rrib, -rib + rrib])
                {
                    minkowski() 
                    {
                        square([ix + rib * 2 - rrib * 2, iz + rib * 2 - rrib * 2]);
                        circle(r = rrib);
                    }
                }
                translate([-0.01, -0.01])
                square([ix + 0.02, iz + 0.02 + 20]);
            }
        }

        translate([0, -thickness / 2, 0]) 
        {
            translate([0, iy / 7 * 1, 0]) 
            single();

            translate([0, iy / 2 * 1, 0]) 
            single();

            translate([0, iy / 7 * 6, 0]) 
            single();
        }
    }

    module rib()
    {
        xrib();
        yrib();

        translate([0, 0, -rib + 0.01])
        {
            translate(v = [ix / 8 * 1, iy / 7 * 1, 0]) 
            rotate([0, 0, 45])
            linear_extrude(rib - 0.02)
            square(5.5, center = true);

            translate(v = [ix / 8 * 1, iy / 2 * 1, 0]) 
            rotate([0, 0, 45])
            linear_extrude(rib - 0.02)
            square(5.5, center = true);

            translate(v = [ix / 8 * 1, iy / 7 * 6, 0]) 
            rotate([0, 0, 45])
            linear_extrude(rib - 0.02)
            square(5.5, center = true);

            translate(v = [ix / 3 * 1, iy / 7 * 1, 0]) 
            rotate([0, 0, 45])
            linear_extrude(rib - 0.02)
            square(5.5, center = true);

            translate(v = [ix / 3 * 1, iy / 2 * 1, 0]) 
            rotate([0, 0, 45])
            linear_extrude(rib - 0.02)
            square(5.5, center = true);

            translate(v = [ix / 3 * 1, iy / 7 * 6, 0]) 
            rotate([0, 0, 45])
            linear_extrude(rib - 0.02)
            square(5.5, center = true);

            translate(v = [ix / 3 * 2, iy / 7 * 1, 0]) 
            rotate([0, 0, 45])
            linear_extrude(rib - 0.02)
            square(5.5, center = true);

            translate(v = [ix / 3 * 2, iy / 2 * 1, 0]) 
            rotate([0, 0, 45])
            linear_extrude(rib - 0.02)
            square(5.5, center = true);

            translate(v = [ix / 3 * 2, iy / 7 * 6, 0]) 
            rotate([0, 0, 45])
            linear_extrude(rib - 0.02)
            square(5.5, center = true);

            translate(v = [ix / 8 * 7, iy / 7 * 1, 0]) 
            rotate([0, 0, 45])
            linear_extrude(rib - 0.02)
            square(5.5, center = true);

            translate(v = [ix / 8 * 7, iy / 2 * 1, 0]) 
            rotate([0, 0, 45])
            linear_extrude(rib - 0.02)
            square(5.5, center = true);

            translate(v = [ix / 8 * 7, iy / 7 * 6, 0]) 
            rotate([0, 0, 45])
            linear_extrude(rib - 0.02)
            square(5.5, center = true);
        }
    }
    rib();
    shroud();
}