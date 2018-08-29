include <basic_shapes.scad>;

logo_radius=50;
base_thickness=2;
radius_cd=logo_radius/10;
line_height=2;
line_thickness=2;
core_left_c_thickness=line_thickness*6.5; // thickness of left, solid, core part from outter edge to inner hole

$fn = 50;

/****** logo shapes  ******/
module base(){
    translate([0,0,base_thickness*-0.99]){
        color([1,1,1]) circle(radius=logo_radius-0.01, line_width=logo_radius, height=base_thickness);
    }
    translate([0,0,base_thickness*-1]){
        color([1,0,0]) circle(radius=logo_radius, line_width=line_thickness, height=base_thickness*2); 
    }
}

module core(){
    difference(){
        union(){
            // right outline
            color([1,0,0]) 
            half_circle(radius=radius_cd+2, line_width=line_thickness, height=line_height, offsetx=-1, offsety=-1, offsetz=0);
            // left c 
            color([1,0,0]) 
            half_circle(radius=radius_cd*4, line_width=core_left_c_thickness, height=line_height, offsetx=0, offsety=-1, offsetz=0);
            // right c
            color([1,0,0]) 
            circle(radius=radius_cd*4, line_width=line_thickness, height=line_height);
        }
        // core line cuts
        line(
            length=core_left_c_thickness-line_thickness, 
            width=line_thickness, 
            height=line_height+1, 
            offsetx=core_left_c_thickness-(line_thickness*2), 
            offsety=line_thickness/2*-1, 
            offsetz=0,
            rotation=45,
            aroundx=0,
            aroundy=0,
            aroundz=1,
            lround=true
        );
        line(
            length=core_left_c_thickness-line_thickness, 
            width=line_thickness, 
            height=line_height+1, 
            offsetx=core_left_c_thickness-(line_thickness*2), 
            offsety=line_thickness/2*-1, 
            offsetz=0,
            lround=true
        );
        line(
            length=core_left_c_thickness-line_thickness, 
            width=line_thickness, 
            height=line_height+1, 
            offsetx=core_left_c_thickness-(line_thickness*2), 
            offsety=line_thickness/2*-1, 
            offsetz=0,
            rotation=-45,
            aroundx=0,
            aroundy=0,
            aroundz=1,
            lround=true
        );
    }
}

module third_ring(){
    difference(){
        // ring
        color([1,0,0]) circle(radius=radius_cd*5.4, line_width=line_thickness, height=line_height);
        // line cuts
        color([1,1,1])
        line(
            length=line_thickness*3, 
            width=core_left_c_thickness, 
            height=line_height+1, 
            offsetx=radius_cd*4.6, 
            offsety=core_left_c_thickness/2*-1, 
            offsetz=0,
            rotation=-37,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
        line(
            length=line_thickness*3, 
            width=core_left_c_thickness, 
            height=line_height+1, 
            offsetx=radius_cd*4.6, 
            offsety=core_left_c_thickness/2*-1, 
            offsetz=0,
            rotation=180+37,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
        // top two cuts
        line(
            length=line_thickness*3, 
            width=line_thickness*2.5, 
            height=line_height+1, 
            offsetx=radius_cd*4.4, 
            offsety=-9.5, 
            offsetz=0,
            rotation=90,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
        line(
            length=line_thickness*3, 
            width=line_thickness*2.5, 
            height=line_height+1, 
            offsetx=radius_cd*4.4, 
            offsety=4.5, 
            offsetz=0,
            rotation=90,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
    }
}

base();
core();
// outter rings from inner most to outter most
color([1,0,0]) circle(radius=radius_cd*4.7, line_width=line_thickness, height=line_height);
third_ring();
// outtermost ring
color([1,0,0]) circle(radius=logo_radius, line_width=line_thickness+(line_thickness*.5), height=line_height);
