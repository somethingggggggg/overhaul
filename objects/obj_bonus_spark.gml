#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.
    image_speed = 0.25;
    time        = 0;
    accframe    = 0;
    lifetime    = 360;
    i = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy.
    if(lifetime > 0){
       lifetime-=1;
    }else{
       instance_destroy();
    }
#define Collision_par_character
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Get into special stage.
if(instance_exists(obj_fade_bonus) == false && accframe = 10){
   instance_create(par_character.x, par_character.y, obj_fade_bonus)
   with(par_character){
        if(Underwater == true){
           DrownTimer = 1800;
           if(CheckSound(obj_audio_manager.Jingle_Drowning) == true){
               if(Invincibility < 1.5){
                  global.BGMVolume = global.MaxBGMV;
                  LoopSound(obj_audio_manager.ZoneBGM, global.BGMVolume, 1);
               }
                  StopSound(obj_audio_manager.Jingle_Drowning);
           }
        }
   }
}

if(accframe < 10){
   accframe +=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Sparkles.

var (_roll) = 80;  //how much ring is tilted toward camera
var (_pitch) = sin(time*0.12)*15;  //rocking back and forth
var (_x0) = dcos(_pitch);
var (_x1) = dsin(_pitch)*dcos(_roll);
var (_y0) = -dsin(_pitch);
var (_y1) = dcos(_pitch)*dcos(_roll)
var (_yaw) = time * 30;  //rotation of ring
var (_scale) = sin(time*0.03) * 20 + 5; //expand or shrink
for (i = 0; i < 360; i += 45) {
var (_x) = random_range(0.8,1.2) * _scale * dcos(i + _yaw);
var (_y) = random_range(0.8,1.2) * _scale * dsin(i + _yaw);
    var (_xx) = x + _x * _x0 + _y * _x1;
    var (_yy) = y + _x * _y0 + _y * _y1;
    draw_sprite(sprite_index,-1,_xx,_yy);
    }
time += 0.5;
