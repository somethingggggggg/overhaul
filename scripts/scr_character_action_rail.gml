if Action != ActionDie{
if scr_character_collision_bottom_object(x,y,Angle,spr_mask_big,par_rail) && AnimationDirection = 1{
if !CheckSound(SFX.snd_rain_bowring) && !instance_exists(obj_grindspark){
PlaySound(SFX.snd_rail_contact,global.SFXVolume,1,1)
instance_create(x,y,obj_grindspark)
}
if XSpeed < 5.5{
XSpeed = 5.5
}
Action = ActionRail
if CharacterID != CharacterAmy{
Animation = "RAIL"
}
else{
Animation = "ROLL"
}
}
else
if !scr_character_collision_bottom_object(x,y,Angle,spr_mask_big,par_rail) && Action = ActionRail && AnimationDirection = 1{
if CheckSound(SFX.snd_rail_contact) = true{
StopSound(SFX.snd_rail_contact)
}
Action = ActionJump
}
if scr_character_collision_bottom_object(x,y,Angle,spr_mask_big,par_rail) && AnimationDirection = -1{
if !instance_exists(obj_grindspark){
PlaySound(SFX.snd_rail_contact,global.SFXVolume,1,1)
instance_create(x,y,obj_grindspark)
}
if XSpeed > -5.5{
XSpeed = -5.5
}
Action = ActionRail
if CharacterID != CharacterAmy{
Animation = "RAIL"
}
else{
Animation = "ROLL"
}
}
else
if !scr_character_collision_bottom_object(x,y,Angle,spr_mask_big,par_rail) && Action = ActionRail && AnimationDirection = -1{
if CheckSound(SFX.snd_rail_contact) = true{
StopSound(SFX.snd_rail_contact)
}
Action = ActionJump
}
}
