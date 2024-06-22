if (Action == ActionJump && KeyAction_Pressed && Ground == false)
{
    GSpeed = XSpeed;
    XSpeed = (dcos(RelativeAngle) * GSpeed) - (dsin(RelativeAngle) * -JumpStrength);
    YSpeed = -(dsin(RelativeAngle) * GSpeed) - (dcos(RelativeAngle) * -JumpStrength);
    JumpLock = true;
    Action = ActionNoControlJump;
}
if Action = ActionNoControlJump && scr_character_collision_bottom(x, y, Angle, spr_mask_main) == true
{
    Action = ActionNormal
}
