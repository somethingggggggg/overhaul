if Action != ActionDie{
if scr_character_collision_bottom_object(x, y, 0, spr_mask_big, par_collision_slipping_right)
{Rotation_Animation = 1
Ground = false
XSpeed = 5.5
YSpeed = 1
Animation = "HURT"
AnimationDirection = 1
InputAlarm = 0
Action = ActionSlipping
StopSound(SFX.snd_character_roll)
}
if scr_character_collision_bottom_object(x, y, 0, spr_mask_big, par_collision_slipping_left)
{Rotation_Animation = -1
Ground = false
XSpeed = -5.5
YSpeed = 1
Animation = "HURT"
AnimationDirection = -1
InputAlarm = 0
Action = ActionSlipping
StopSound(SFX.snd_character_roll)
}
if !scr_character_collision_bottom_object(x, y, 0, spr_mask_big, par_collision_slipping_left) &&  Action = ActionSlipping || !scr_character_collision_bottom_object(x, y, 0, spr_mask_big, par_collision_slipping_right) && Action = ActionSlipping{
Action = ActionNormal
Rotation_Animation = 0
}
}
