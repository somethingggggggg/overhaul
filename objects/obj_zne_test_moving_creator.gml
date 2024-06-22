#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Platform.
if(bbox_right  > view_xview
    && bbox_left   < view_xview + view_wview
    && bbox_bottom > view_yview
    && bbox_top    < view_yview + view_hview)
    {
       instance_create(x, y, obj_zne_test_moving_platform)
       instance_destroy();
    };
