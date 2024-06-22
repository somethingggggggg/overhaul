#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    image_speed = .0625;
    alarm[0]    = 20;
    alarm[1]    = 40;
    alarm[2]    = 120;
    Active      = true;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create a small Bubble.
    if(Active == true){
       SmallBubble = instance_create(x+choose(8, -5, -5, -4, 4, 10.14), self.y-2, obj_air_bubble);
       SmallBubble.BubbleIndex = choose(0, 1);
    }  alarm[0]    = random(60) + 40;
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create a medium Bubble.
    if(Active == true){
       SmallBubble = instance_create(x+choose(8, 5, 4, 10.14), self.y-2, obj_air_bubble);
       SmallBubble.BubbleIndex = choose(2, 3);
    }  alarm[1]    = random(90) + 100;
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create a big Bubble.
    if(Active == true){
       SmallBubble = instance_create(x+choose(8, -5, -5, -4, 4, 10.14), self.y-2, obj_air_bubble);
       SmallBubble.BubbleIndex = 6;
    }  alarm[2]    = random(300) + 150;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Disable.
    if(global.WaterSurfacePosition <= y){
       Active  = true;
       visible = true;
    }else{
       Active  = false;
       visible = false;
    }
