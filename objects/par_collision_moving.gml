#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Int. Variables.
    RelativeX = x; // Relative X Position.
    RelativeY = y; // Relative Y Position.
    PreviousX = x; // Previous X Position.
    PreviousY = y; // Previous Y Position.
    HorSpd    = 0; // Horizontal Speed.
    VerSpd    = 0; // Vertical Speed.
    X_DCSpeed = 0; // Increases/Decreases the horizontal speed when changing directions.
    Y_DCSpeed = 0; // Increases/Decreases the vertical speed when changing directions.
    Activated = 0; // Is activated? Used to prevent deactivation.
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle the moving platform & character position.

var i, PreviousX, PreviousY;
PreviousX = x;
PreviousY = y;

//Set Horizontal/Vertical Speed:
if(XSpd < X_DCSpeed) {
   X_DCSpeed -= 0.025
}else if(XSpd > X_DCSpeed) {
   X_DCSpeed += 0.025
}
if(YSpd < Y_DCSpeed) {
   Y_DCSpeed -= 0.025
} else if(YSpd > Y_DCSpeed) {
   Y_DCSpeed += 0.025
}

HorSpd +=  X_DCSpeed;
VerSpd += -Y_DCSpeed;

// Activate:
Activated = true;

//Set the X/Y Position:
x = floor(RelativeX+HorSpd);
y = floor(RelativeY-VerSpd);

    // Change the X/Y Position of the Character standing on this platform:
       i = 0;
       repeat(instance_number(par_character)){
              CharMain = par_character;
              if(instance_exists(CharMain) == false){
                 i+=1
                 continue;
              }
              if(CharMain.Action != ActionDie){
                 if(CharMain.Ground == true && CharMain.OnMoving = id){
                 with CharMain{
                 if !scr_character_collision_left(x, y, 0, spr_mask_big) && !scr_character_collision_right(x, y, 0, spr_mask_big){
                 with par_collision_moving{
                    CharMain.x += (x-PreviousX);
                    CharMain.y  = ((y-sprite_yoffset)-PlatformOffset);
                    }
                    }
                    }
                 }
              }
              i+=1
       }
