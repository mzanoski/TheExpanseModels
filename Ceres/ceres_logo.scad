line_thickness=2;
radius_cd=5;
height_cd=2;

$fn = 50;

module circle(radius, line_width, height){
    difference(){
        cylinder(h=height, r=radius);
        translate([0,0,-0.01]){
            cylinder(h=height+0.02, r=radius-line_width);
        }
    }
 }
 
 module right_half_c(radius, distance, height, c_dot_radius){
    intersection(){
        translate([0,-radius,0]){
            cube([radius,radius*2,height]);
        }
        circle(radius=radius, line_width=radius-c_dot_radius-distance, height=height);
    }    
}


// centre dot
cylinder(h=height_cd, r=radius_cd);
right_half_c(radius=radius_cd*4, distance=line_thickness, height=height_cd, c_dot_radius=radius_cd);
// outter rings from inner most to outter most
circle(radius=radius_cd*5.9, line_width=line_thickness, height=height_cd);
circle(radius=radius_cd*6.7, line_width=line_thickness, height=height_cd);
circle(radius=radius_cd*10, line_width=line_thickness+(line_thickness*.5), height=height_cd);
