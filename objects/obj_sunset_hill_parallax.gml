#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    var overallYOffset; overallYOffset = 0.999;
       scr_Parallax_Add_Node_Spr_Mode(1, spr_sunset_hill_parallax_1, 0.999, 0, 0, 0, 0, overallYOffset, 0, 0, 97, 0,-1, 98, -1, 224);
       scr_Parallax_Add_Node_Spr_Mode(1, spr_sunset_hill_parallax_2, 0.850, 0, 0, 0, 0, overallYOffset, 0, 0, 97, 0,-1, 98, -1, 224);
       image_speed = 0.175
       create = false
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(spr_sunset_hill_parallax_1,all,view_xview[0],view_yview[0])
/*    parallaxAdd(RepeatedOver, Background, XFactor, XSpeed, XScroll, XOffset, XSeparation,
                YFactor, YSpeed, YScroll, YOffset, YSeparation, Left, Top, Width, Height)*/
// parallaxAdd(RepeatedOver, Background,
//             XFactor, XSpeed, XScroll, XOffset, XSeparation,
//             YFactor, YSpeed, YScroll, YOffset, YSeparation,
//             SizeList, LimitList)
    var overallYOffset; overallYOffset = 0.999;
       scr_Parallax_Add_Node_Spr_Mode(1, spr_sunset_hill_parallax_2, 0.850, 0, 0, 0, 0, overallYOffset, 0, 0, 97, 0,-1, 98, -1, 224);
       image_speed = 0.175
       create = false
