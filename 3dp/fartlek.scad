$fn=200;
height = 130;

module roundedRect(size, radius, center) {
    minkowski() {
        cube(size, center);
        cylinder(r = radius, h = 1, center);
    }
}

module buzzer() {
    cube([16, 15, 25], center = true);
}

module cableChannel() {
    cube([8, 5, 110], center = true);
}

module trinket() {
    cube([16, 5, 28], center = true);
}

module nineV() {
    cube(size = [17.5, 29.5, 56], radius = 2, center = true);
}


module switch() {
    cube([7, 4, 3], center = true);
    translate([2.5, 0, 1]) cube([2, 4, 10], center = true);
    translate([-2.5, 0, 1]) cube([2, 4, 10], center = true);
}

module innerHandle() {
     roundedRect(size = [18, 28, height], radius = 2, center = true);
}

module outerHandle() {
    scale([1.02,1.02,1.02]) union() {
        difference(){
            cylinder(d=40, h=height);
            cylinder(d=18, h=height);
            translate([0, 0, height/2 + 2]) innerHandle();
            translate([0, 20, 110]) rotate([90, 0, 180]) cylinder(h=4, r1=4, r2=16, center=true);
            translate([20.3, 5, 5]) rotate([0, -90, 180]) linear_extrude(height = 1) {
                text("Fartlek", font = "Liberation Sans:style=Bold Italic");
            }
            
        }
    }
}

module innerHandleComplete() {
    union() {
    difference() {
       translate([0, 0, 60]) innerHandle();
            translate([0, 9, 105])  buzzer();
            translate([0, 14, 60]) cableChannel();
            translate([0, 14, 70]) trinket();
            translate([0, 2, 27])  nineV();
            translate([0, 12, -3.5]) switch();
        }   
    }
}



//innerHandleComplete();
outerHandle();

