#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    Parent        =  0;        // Checks who's the parent of this object.        
    image_speed   = .3;        // How fast the animation plays.
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set the X/Y Position and Depth.

 // Set position:
    x = floor(par_character.x);
    if(par_character.Action != ActionGrab)
    {
       if(par_character.FloorMode != 1 && par_character.FloorMode != 3)
       {
          if(par_character.FloorMode != 2)
          {
             y = floor(par_character.y-(2+(4*(par_character.Animation != "ROLL"))));
          }
          else y = floor(par_character.y-(2-(7*(par_character.Animation != "ROLL"))));
       }
       else y = floor(par_character.y-(2*(par_character.Animation != "ROLL")));
    }
    else
    {
       if(par_character.Action == ActionGrab)
       {
          y = floor(par_character.y+8);
       }
       else if(par_character.Action == ActionSpring)
       {
            if(par_character.YSpeed < 0)
            {
               y = floor(par_character.y+4);
            }
            else
            {
               y = floor(par_character.y-(2+(5*(par_character.Animation != "ROLL"))));
            }
       }
    }

 // Change Depth:
    if(image_index >= 0 && image_index < 15){
       depth  = -20;
    }else{
       depth  = 20;
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw the shield.
    if(Parent.Invincibility < 1.5){
       draw_sprite_ext(sprite_index, -1, floor(x), floor(y), 1, 1, Parent.AnimationAngle, c_white, Parent.Alpha);
    }
