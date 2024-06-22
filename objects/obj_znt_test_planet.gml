#define Collision_obj_flicky_plane
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if other.image_xscale = -0.5 && !instance_exists(obj_fade_next){
instance_create(x,y,obj_fade_next)
}
