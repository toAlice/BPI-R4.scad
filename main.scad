$fn = 18;

include <var.scad>

use <cover.scad>
use <base.scad>


base();

translate([0, 0, iz])
cover();
