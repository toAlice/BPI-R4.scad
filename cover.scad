include <var.scad>

module cover()
{
    module wall(x, y, z, t) {
        linear_extrude(z)
        {
            difference() 
            {
                square(size = [x, y]);

                offset(-t)
                square(size = [x, y]);
            }
        }
    }
    module fancor()
    {
        module single()
        {
            difference() 
            {
                translate([-thickness + 0.01, -thickness + 0.01])
                intersection() 
                {
                    minkowski() 
                    {
                        square(size = [6 + thickness, 6 + thickness]);
                        circle(r = 2);
                    }
                    square([19, 19]);
                }

                translate(v = [4.5, 4.5]) 
                circle(r = 1.5);
            }
        }

        linear_extrude(thickness - 0.01)
        {
            translate(v = [0, 0]) 
            translate(v = [0, 0]) 
            rotate([0, 0, 0])
            single();

            translate(v = [41 - 8, 0]) 
            translate(v = [8, 0]) 
            rotate([0, 0, 90])
            single();

            translate(v = [41 - 8, 41 - 8]) 
            translate(v = [8, 8]) 
            rotate([0, 0, 180])
            single();

            translate(v = [0, 41 - 8]) 
            translate(v = [0, 8]) 
            rotate([0, 0, 270])
            single();
        }
    }
    module coverrib()
    {
        module coverxrib()
        {
            module single()
            {
                translate(v = [0.2, -thickness / 2, 0.01])
                cube([ix - 0.4, thickness, rib]);
            }

            translate(v = [0, iy / 7, 0]) 
            single();

            translate(v = [0, iy / 2, 0]) 
            single();

            translate(v = [0, iy / 7 * 6, 0]) 
            single();
        }

        module coverrrib()
        {
            module single()
            {
                translate(v = [-thickness / 2, 0.2, 0.01]) 
                cube([thickness, iy - 0.4, rib]);
            }

            translate(v = [ix / 8, 0, 0]) 
            single();

            translate(v = [ix / 3, 0, 0]) 
            single();

            translate(v = [ix / 3 * 2, 0, 0]) 
            single();

            translate(v = [ix / 8 * 7, 0, 0]) 
            single();
        }

        module joint()
        {
            module single()
            {
                translate(v = [0, 0, 0.01]) 
                rotate([0, 0, 45])
                linear_extrude(rib - 0.02)
                square(5.5, center = true);
            }

            translate(v = [ix / 8 * 7, iy / 7 * 6, 0]) 
            single();
            translate(v = [ix / 8 * 7, iy / 2 * 1, 0]) 
            single();
            translate(v = [ix / 8 * 7, iy / 7 * 1, 0]) 
            single();

            translate(v = [ix / 3 * 2, iy / 7 * 6, 0]) 
            single();
            translate(v = [ix / 3 * 2, iy / 2 * 1, 0]) 
            single();
            translate(v = [ix / 3 * 2, iy / 7 * 1, 0]) 
            single();

            // translate(v = [ix / 3 * 1, iy / 7 * 6, 0]) 
            // single();
            // translate(v = [ix / 3 * 1, iy / 2 * 1, 0]) 
            // single();
            translate(v = [ix / 3 * 1, iy / 7 * 1, 0]) 
            single();
            
            // translate(v = [ix / 8 * 1, iy / 7 * 6, 0]) 
            // single();
            // translate(v = [ix / 8 * 1, iy / 2 * 1, 0]) 
            // single();
            translate(v = [ix / 8 * 1, iy / 7 * 1, 0]) 
            single();
        }
    
        difference() 
        {
            union() 
            {
                coverxrib();
                coverrrib();
                joint();
            }

            translate(v = [fpspace + 14 - thickness + 1, 54 - thickness + 1, -1]) 
            cube([41 + thickness * 2 - 2, 41 + thickness * 2 - 2, rib + 2]);
        }
    }

    union() 
    {
        difference() 
        {
            linear_extrude(thickness)
            {
                translate(v = [r, r]) 
                offset(-0.2)
                minkowski() 
                {
                    square([ix - r * 2, iy - r * 2]);
                    circle(r = r);
                }
            }

            translate(v = [fpspace + 3.5, 23.5, 0])
            {
                translate(v = [0, 0, -thickness - 1]) 
                cylinder(h=10, r = 1.5);
            }

            translate(v = [fpspace + 144.5, 23.5, 0])
            {
                translate(v = [0, 0, -thickness - 1]) 
                cylinder(h=10, r = 1.5);
            }

            translate(v = [fpspace + 3.5, 97, 0])
            {
                translate(v = [0, 0, -thickness - 1]) 
                cylinder(h=10, r = 1.5);
            }

            translate(v = [fpspace + 144.5, 97, 0])
            {
                translate(v = [0, 0, -thickness - 1]) 
                cylinder(h=10, r = 1.5);
            }

            translate(v = [fpspace + 14, 54, 0]) 
            {
                translate(v = [0, 0, -thickness - 1]) 
                cube([41, 41, 10]);
            }
        }

        translate(v = [fpspace + 14 - thickness - 0.01, 54 - thickness - 0.01, 0.01]) 
        {
            wall(41 + thickness * 2 + 0.02, 41 + thickness * 2 + 0.02, rib, thickness - 0.01);

            translate([thickness, thickness, rib - thickness]) 
            fancor();
        }
        coverrib();
    }
}
