#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    Shield_State  = "default"; // State of the shield. ("default" or "bounce")
    BounceAnimate = 0;         // Whether or not the bounce should be animated.
    Parent        = 0;         // Checks who's the parent of this object.
    ShieldOffset  = 0;         // Y Offset.
    image_speed   = .3;        // How fast the animation plays.
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set the X/Y Position, Depth and sprite.

 // Position:
       x = floor(par_character.x);
    if(Shield_State != "bounce")
    {
       if(par_character.Action != ActionGrab && par_character.Action != ActionSpring)
       {
          if(par_character.FloorMode != 1 && par_character.FloorMode != 3)
          {
             if(par_character.FloorMode != 2)
             {
                y = floor(par_character.y-(2+(5*(par_character.Animation != "ROLL"))));
             }
             else y = floor(par_character.y-(2-(8*(par_character.Animation != "ROLL"))));
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
    }
    else
    {
       y = floor(par_character.y-6);
    }

 // Offset:
    if(Parent.Animation != "ROLL"){
       ShieldOffset = 0;
    }else{
       ShieldOffset = 4;
    }

 // Depth:
    depth = Parent.depth - 20;

 // Sprite:
    if(Shield_State == "default"){
       sprite_index  = spr_shield_bubble;
       image_speed   = .3;
       BounceAnimate = false;
    }else{
       if(sprite_index != spr_shield_bubble){
          image_speed   = 0;
       }else{
          image_speed   = .3;
       }
    }

    if(BounceAnimate){
       if(image_index < 6){
          image_index += 0.20;
       }else{
          if(sprite_index != spr_shield_bubble){
             image_index   = 0;
             sprite_index  = spr_shield_bubble;
          }
       }
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw the shield.
    if(Parent.Invincibility < 1.5){
       draw_sprite_ext(sprite_index, -1, floor(Parent.x), floor(Parent.y+ShieldOffset), 1, 1, Parent.AnimationAngle, c_white, Parent.Alpha);
    }
