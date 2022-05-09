tablet_x = 80; 
tablet_y = 155;
tablet_z = 20;
tablet_bottom = 6;

make_stand(angle =70, thickness = 3, centre_mass= 3/4);


module tablet(){
    cube([tablet_x,tablet_y, tablet_z]);
}

module stand_bottom(thickness = 3){
    //translate([tablet_x/4,0,0])
     union(){
        cube([tablet_x/2,tablet_bottom, tablet_z+(thickness*2)]);
     cube([tablet_x/2,tablet_y/2, thickness]);
    }   
}

module make_stand( angle = 70, thickness = 3, centre_mass= 3/4){
    bottom_length = tablet_y*(centre_mass)*cos(angle);
    support_length = bottom_length*sin(angle);
    support_height = bottom_length*cos(angle);
    difference(){
        union(){
            stand_bottom(thickness);
            translate([0,support_height,-support_length])
            cube([tablet_x/2,thickness,support_length]);
        }
        translate([0, 3, 3]) tablet();
    };
};