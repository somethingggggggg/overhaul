#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
idletimer = 0
movetimer = 0
state = 0
startx = x
starty = y
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch state
{
    case 0:
        y += 1
        movetimer += 1
        if movetimer = 150 state = 2
    break;
    case 1:
        idletimer += 1
        if idletimer = 100
        {
            idletimer = 0
            state = 0
        }
    break;
    case 2:
        idletimer += 1
        if idletimer = 100
        {
            idletimer = 0
            state = 3
        }
    break;
    case 3:
        y -= 1
        movetimer -= 1
        if movetimer = 0 state = 1
    break;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite477,0,x,y)
draw_self()
