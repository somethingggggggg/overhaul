#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    Shield_State  = "default"; // State of the shield. ("default" or "dash")
    Drawing_Layer = "back";    // Changes the Layer of the sprite. ("back" or "fore")
    Drawing_Speed = 0.3;       // How fast the animation plays.
    Parent        = 0;         // Checks who's the parent of this object.
    instance_create(x,y,obj_shield_flame_alt)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation and depth.
/// Change Layer and animate the Shield.
            x = floor(par_character.x);
    if(sprite_index != spr_shield_flame_action)
    {
       if(par_character.Action != ActionGrab)
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
    else{ y = floor(par_character.y-2);}
    // Change animation and set the speed:
       if(Shield_State == "default"){
          sprite_index  = spr_shield_flame;
          Drawing_Speed = 0.3;
          image_speed   = Drawing_Speed;
          image_xscale  = 1;
          depth  = 1;

       }

       if(Shield_State == "dash"){
          sprite_index  = spr_shield_flame_action;
          Drawing_Speed = 0.5;
          image_speed   = Drawing_Speed;
          if(image_xscale == 0){
             image_xscale  = Parent.AnimationDirection;
             depth  = -1;
          }
       }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(par_character.Invincibility < 1.5){
draw_sprite_ext(sprite_index, -1, floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
