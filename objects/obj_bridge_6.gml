#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    /// Bridge setup.

    log_sprite   = spr_aaz_bridge;
    num_logs     = 6;
    bridge_width = num_logs*16;
    half_width   = bridge_width / 2;
    max_tension  = 9;

    for (i=0; i<num_logs; i+=1)
    {
        heights[i] = 0;
        logs[i]    = instance_create(x+i*16, y, obj_bridge_node);
        logs[i]    . sprite_index = other.log_sprite;
    }
