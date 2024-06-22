#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 1/9;
globalvar (Pipe) = 0;
globalvar Cycle;
Cycle = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if par_character.Action = ActionPipe && Pipe = 0{
if objSlotPanel01.image_index = 0 && objSlotPanel02.image_index = 0 && objSlotPanel03.image_index = 0 && Cycle = false{
global.Rings += 10
Pipe = 1
}
if objSlotPanel01.image_index = 1 && objSlotPanel02.image_index = 1 && objSlotPanel03.image_index = 1 && Cycle = false{
global.Rings += 30
Pipe = 1
}
if objSlotPanel01.image_index = 2 && objSlotPanel02.image_index = 2 && objSlotPanel03.image_index = 2 && Cycle = false{
global.Rings += 150
Pipe = 1
}
if objSlotPanel01.image_index = 3 && objSlotPanel02.image_index = 3 && objSlotPanel03.image_index = 3 && Cycle = false{
global.Rings += 25
Pipe = 1
}
if objSlotPanel01.image_index = 4 && objSlotPanel02.image_index = 4 && objSlotPanel03.image_index = 4 && Cycle = false{
global.Rings += 20
Pipe = 1
}
if objSlotPanel01.image_index = 5 && objSlotPanel02.image_index = 5 && objSlotPanel03.image_index = 5 && Cycle = false{
if global.Rings < 100 && global.Rings > 0{
global.Rings = 0
Pipe = 1
}
if global.Rings = 100 || global.Rings > 100{
global.Rings -= 100
Pipe = 1
}
}
if objSlotPanel01.image_index = 6 && objSlotPanel02.image_index = 6 && objSlotPanel03.image_index = 6 && Cycle = false{
global.Rings += 30
Pipe = 1
}
}
