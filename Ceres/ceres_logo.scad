include <basic_shapes.scad>;

logo_radius=33;
base_thickness=0;
radius_cd=logo_radius/10;
line_height=1;
line_thickness=logo_radius/25;
core_left_c_thickness=line_thickness*6.5; // thickness of left, solid, core part from outter edge to inner hole

$fn = 50;

/****** logo shapes  ******/
module base(){
    translate([0,0,base_thickness*-0.99]){
        color([1,1,1]) circle(radius=logo_radius-5-0.01, line_width=logo_radius, height=base_thickness);
    }
    translate([0,0,base_thickness*-1]){
        color([1,0,0]) circle(radius=logo_radius-5, line_width=line_thickness, height=base_thickness*2); 
    }
}

module core(){
    difference(){
        union(){
            // core c
            color([1,0,0]) 
            half_circle(radius=radius_cd+1.5, line_width=line_thickness, height=line_height, offsetx=-1, offsety=-1, offsetz=0);
            // left slotted body
            color([1,0,0]) 
            half_circle(radius=radius_cd*4, line_width=core_left_c_thickness, height=line_height, offsetx=0, offsety=-1, offsetz=0);
            // right body outline
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

module second_ring(){
    difference(){
        // outter rings from inner most to outter most
        color([1,0,0]) circle(radius=radius_cd*4.85, line_width=line_thickness, height=line_height);
        line(
            length=line_thickness, 
            width=line_thickness*2, 
            height=line_height, 
            offsetx=radius_cd*4.2, 
            offsety=line_thickness*2/2*-1, 
            offsetz=0,
            rotation=0,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
        line(
            length=line_thickness, 
            width=line_thickness*2, 
            height=line_height, 
            offsetx=radius_cd*4.2, 
            offsety=line_thickness*2/2*-1, 
            offsetz=0,
            rotation=45,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
        line(
            length=line_thickness, 
            width=line_thickness*2, 
            height=line_height, 
            offsetx=radius_cd*4.2, 
            offsety=line_thickness*2/2*-1, 
            offsetz=0,
            rotation=90,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
        line(
            length=line_thickness, 
            width=line_thickness*2, 
            height=line_height, 
            offsetx=radius_cd*4.2, 
            offsety=line_thickness*2/2*-1, 
            offsetz=0,
            rotation=135,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
        line(
            length=line_thickness, 
            width=line_thickness*2, 
            height=line_height, 
            offsetx=radius_cd*4.2, 
            offsety=line_thickness*2/2*-1, 
            offsetz=0,
            rotation=180,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
        line(
            length=line_thickness, 
            width=line_thickness*2, 
            height=line_height, 
            offsetx=radius_cd*4.2, 
            offsety=line_thickness*2/2*-1, 
            offsetz=0,
            rotation=225,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
        line(
            length=line_thickness, 
            width=line_thickness*2, 
            height=line_height, 
            offsetx=radius_cd*4.2, 
            offsety=line_thickness*2/2*-1, 
            offsetz=0,
            rotation=270,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
        line(
            length=line_thickness, 
            width=line_thickness*2, 
            height=line_height, 
            offsetx=radius_cd*4.2, 
            offsety=line_thickness*2/2*-1, 
            offsetz=0,
            rotation=315,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
    }
}

module third_ring(){
    difference(){
        // ring
        color([1,0,0]) circle(radius=radius_cd*5.4, line_width=line_thickness, height=line_height);
        // line cuts
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
            offsety=-5.5, 
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
            offsety=2.5, 
            offsetz=0,
            rotation=90,
            aroundx=0,
            aroundy=0,
            aroundz=1
        );
    }
}

module fourth_ring(){
    // outtermost ring
    color([1,0,0]) circle(radius=logo_radius-5, line_width=line_thickness+(line_thickness*.5), height=line_height);
}

module ceres_logo(){
    base();
    core();
    second_ring();
    third_ring();
    fourth_ring();
}

ceres_logo();
