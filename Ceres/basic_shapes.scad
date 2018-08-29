module line(length, width, height, offsetx, offsety, offsetz, rotation, aroundx, aroundy, aroundz, lround, rround){
    rotate(rotation, [aroundx, aroundy, aroundz]){
        // #1: draw middle part of the line and subtract potential rounding area from the begginging and end of it
        translate([offsetx+width/2, offsety, offsetz-0.01]){
            cube([length-width/2, width, height+0.02]);
        }

        // #2: if rounding on each edge is required, place a rounding cylinder
        // #3: if not, fill that space with cube that was cut out of the line in #1
        if (lround){
            translate([offsetx+width/2, offsety+width/2, offsetz-0.01]){
                cylinder(h=height, r=width/2);
            }  
        }
        else{
            translate([offsetx, offsety, offsetz-0.01]){
                cube([width/2, width, height+0.02]);
            }
        }
        if (rround){
            translate([offsetx+length, offsety+width/2, offsetz-0.01]){
                cylinder(h=height, r=width/2);
            }
        }
        else{
            translate([offsetx+length, offsety, offsetz-0.01]){
                cube([width/2, width, height+0.02]);
            }
        }
    }
}

module circle(radius, line_width, height){
    difference(){
        cylinder(h=height, r=radius);
        translate([0,0,-0.01]){
            cylinder(h=height+0.02, r=radius-line_width);
        }
    }
 }

module half_circle(radius, line_width, height, offsetx, offsety, offsetz){
    intersection(){
        translate([offsetx*radius,offsety*radius,offsetz*radius]){
            cube([radius,radius*2,height]);
        }
        circle(radius=radius, line_width=line_width, height=height);
    }    
}