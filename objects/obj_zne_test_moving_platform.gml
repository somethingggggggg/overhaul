#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init. Platform.

    // Call the parent:
       event_inherited()

    // X/Y Speed:
       XSpd = 0;
       YSpd = 0;

    // Character Y offset. Default set at 10, you might need to tweak this for other platforms.
       PlatformOffset = 10;
#define Collision_obj_moving_handle_up
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set YSpeed.
    XSpd =  0;
    YSpd = -1;
#define Collision_obj_moving_handle_down
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set YSpeed.
    XSpd =  0;
    YSpd =  1;
#define Collision_obj_moving_handle_right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set XSpeed.
    XSpd =  1;
    YSpd =  0;
#define Collision_obj_moving_handle_left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set XSpeed.
    XSpd = -1;
    YSpd =  0;
#define Collision_obj_moving_handle_up_left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
   YSpd = -1;
   XSpd = -1;
#define Collision_obj_moving_handle_up_right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
   YSpd = -1;
   XSpd = 1;
#define Collision_obj_moving_handle_down_right
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
   YSpd = 1;
   XSpd = 1;
#define Collision_obj_moving_handle_down_left
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
   YSpd = 1;
   XSpd = -1;
