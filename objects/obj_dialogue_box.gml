#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init Dialogue object.

/*  How to use:
    Right click this instance and select creation code.
    Add the following:
    Dialogue = Your Text.
    Color    = Color of the text, default is c_white.
*/

    MyDialogue = "";
    MyColor    = c_white;
    alarm[0]   =  1;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Get Dialogue.

    MyDialogue = Dialogue;
    MyColor    = Color;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw your Dialogue.

    draw_set_font(global.Font_Letters)
    draw_set_color(c_gray)
    draw_rectangle(x - 2, y - 2, x + string_width(MyDialogue) + 2, y + string_height(MyDialogue) + 2, false);
    draw_set_color(c_black)
    draw_rectangle(x - 3, y - 3, x + string_width(MyDialogue) + 3, y + string_height(MyDialogue) + 3, true);
    draw_set_color(MyColor)
    draw_text(x+1, y+1, MyDialogue)
    draw_set_color(c_white)
    draw_set_font(-1)
