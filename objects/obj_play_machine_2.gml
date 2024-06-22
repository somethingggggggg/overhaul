#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Active = true;
ActionTimer = 800;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ActionTimer < 0) { ActionTimer = 0; }
if (ActionTimer > 800) { ActionTimer = 800; }

if (ActionTimer == 0)
{
Active = false;
}

if (Active == false)
{
ActionTimer += 50;
}

if (ActionTimer == 800)
{
Active = true;
}
with(par_character){
if Action = ActionPipe{
YSpeed = 10
XSpeed = 0
}
if Ground && Action = ActionPipe{
Pipe = 0
YSpeed = 0
Action = ActionNormal
}
}
#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (Active == true){

ActionTimer -= 4;

with(self){
par_character.x = self.x;
par_character.y = self.y;
par_character.Animation = "ROLL"
}

with(par_character){
Action = ActionPipe
}

with(objSlotPanel01){
if (CanCycle == true){
Cycle = true;
    }
}
with(objSlotPanel02){
if (CanCycle == true){
Cycle = true;
    }
}
with(objSlotPanel03){
if (CanCycle == true){
Cycle = true;
    }
}

}
