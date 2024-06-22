//Fly If Sonic is in Super State.
if CharacterID = CharacterSonic && !Ground && (Action = ActionJump && Animation = "ROLL") && KeyAction_Pressed && ShieldUsable == true && !scr_character_collision_top(x,y,0,spr_mask_big) && !scr_character_collision_bottom(x,y,0,spr_mask_big){
Action = ActionSuperFly
Animation = "FLY"
Angle = 0
}
if Action = ActionSuperFly{
if !KeyRight{
XSpeed -= XDeceleration
Angle = 0;
if XSpeed < 0 && !KeyLeft{
XSpeed = 0
}
}
if !KeyLeft{
XSpeed += XDeceleration
Angle = 0;
if XSpeed > 0 && !KeyRight{
XSpeed = 0
}
}
if !KeyUp{
YSpeed += YDeceleration
Angle = 0;
if YSpeed > 0 && !KeyDown{
YSpeed = 0
}
}
if !KeyDown{
YSpeed -= YDeceleration
Angle = 0;
if YSpeed < 0 && !KeyUp{
YSpeed = 0
}
}
if KeyLeft{
XSpeed -= XAcceleration
Angle = 0;
if XSpeed < -8{
XSpeed = -8
}
AnimationDirection = -1
}
if KeyRight{
XSpeed += XAcceleration
Angle = 0;
if XSpeed > 8{
XSpeed = 8
}
AnimationDirection = 1
}
if KeyUp{
YSpeed -= YAcceleration;
Angle = 0;
if YSpeed < -8{
YSpeed = -8
}
}
if KeyDown{
YSpeed += YAcceleration;
Angle = 0;
if YSpeed > 8{
YSpeed = 8
}
}
if scr_character_collision_top(x,y,0,spr_mask_main){
Action = ActionRolling
Animation = "ROLL"
}
if place_meeting(x,y,obj_sign_post){
CharacterState = CharacterNormal
Action = ActionNormal
XSpeed = 0
}
}
