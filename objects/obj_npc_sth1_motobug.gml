#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    XSpd        =      -1;
    YSpd        =       0;
    YGrv        = 0.21875;
    image_speed =      .3;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement.

 // Change direction/Wall Collision.
    if(place_meeting(x + XSpd, y, par_collision_solid)){
       while(!place_meeting(x + sign(XSpd), y, par_collision_solid)){
             x += sign(XSpd);
       }
       image_xscale *= -1;
       XSpd         *= -1;
    }
    if(place_meeting(x + XSpd, y, obj_badnik_wall)){
       while(!place_meeting(x + sign(XSpd), y, obj_badnik_wall)){
             x += sign(XSpd);
       }
       image_xscale *= -1;
       XSpd         *= -1;
    }
    x += XSpd;
    image_xscale = XSpd;
