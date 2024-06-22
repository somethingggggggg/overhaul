/// scr_character_handle_breakable_walls()
 // Script for breakable walls.

 // All Characters.
    var breakable_wall;
        breakable_wall = instance_nearest(x, y, par_collision_walls);
        if(breakable_wall != noone && (CharacterID == CharacterKnuckles || Action == ActionRolling || ShieldState == 1 || Action == ActionGlide || Action == ActionSlide) && (scr_character_collision_left_object(x, y, Angle,spr_mask_big,par_collision_walls)))
        {
           with(breakable_wall)
           {
                   PlaySound(SFX.snd_object_destroy, global.SFXVolume, 1,1);
                broken     = true;
                pieces_dir = -1;
                instance_destroy();
           }
        }
        if(breakable_wall != noone && (CharacterID == CharacterAmy && (AmyHammerAttack = 2 && AnimationFrame >= 3 && AnimationFrame <= 5 || AmyHammerAttack = 1 && AnimationFrame >= 5 || AmyHammerAttack = 3) || ShieldState == 1) && (scr_character_collision_left_object(x, y, Angle,spr_mask_big,par_collision_walls)) && AnimationDirection = -1)
        {
           with(breakable_wall)
           {
                   PlaySound(SFX.snd_object_destroy, global.SFXVolume, 1,1);
                broken     = true;
                pieces_dir = -1;
                instance_destroy();
           }
        }
        if(breakable_wall != noone && (CharacterID == CharacterAmy && (AmyHammerAttack = 2 && AnimationFrame >= 3 && AnimationFrame <= 5 || AmyHammerAttack = 1 && AnimationFrame >= 5 || AmyHammerAttack = 3) || ShieldState == 1) && (scr_character_collision_right_object(x, y, Angle,spr_mask_big,par_collision_walls)) && AnimationDirection = 1)
        {
           with(breakable_wall)
           {
                   PlaySound(SFX.snd_object_destroy, global.SFXVolume, 1,1);
                broken     = true;
                pieces_dir = -1;
                instance_destroy();
           }
        }
        if(breakable_wall != noone && (CharacterID == CharacterAmy && (AmyHammerAttack = 2 && AnimationFrame >= 3 && AnimationFrame <= 5 || AmyHammerAttack = 1 && AnimationFrame >= 5) || ShieldState == 1) && (scr_character_collision_bottom_object(x, y, Angle,spr_mask_big,par_collision_walls)))
        {
           with(breakable_wall)
           {
                   PlaySound(SFX.snd_object_destroy, global.SFXVolume, 1,1);
                broken     = true;
                pieces_dir = -1;
                instance_destroy();
           }
        }
        if(breakable_wall != noone && (CharacterID == CharacterKnuckles || Action == ActionRolling || ShieldState == 1 || Action == ActionGlide || Action == ActionSlide) && (scr_character_collision_right_object(x, y, Angle,spr_mask_big,par_collision_walls)))
        {
           with(breakable_wall)
           {
                   PlaySound(SFX.snd_object_destroy, global.SFXVolume, 1,1);
                broken     = true;
                pieces_dir = 1;
                instance_destroy();
           }
        }
              if(breakable_wall != noone && (Action = ActionJump && YSpeed > 0 && Animation = "ROLL") && (scr_character_collision_bottom_object(x, y+6, Angle,spr_mask_big,par_collision_walls)))
        {
        YSpeed  = max(-4, YSpeed*-1);
                   Ground  = false;
                   JumpHeightMod = false;
           with(breakable_wall)
           {
                   PlaySound(SFX.snd_object_destroy, global.SFXVolume, 1,1);
                broken     = true;
                pieces_dir = 1;
                instance_destroy();
           }
        }
 // Knuckles only.
    var breakable_wall_knux;
        breakable_wall_knux = instance_nearest(x, y, par_collision_break_walls_knux);
        if(breakable_wall_knux != noone && CharacterID == CharacterKnuckles && (scr_character_collision_left_object(x, y, Angle,spr_mask_big,par_collision_break_walls_knux)))
        {
           with(breakable_wall_knux)
           {
                   PlaySound(SFX.snd_object_destroy, global.SFXVolume, 1,1);
                broken     = true;
                pieces_dir = -1;
                instance_destroy();
           }
        }
        if(breakable_wall_knux != noone && CharacterID == CharacterKnuckles && (scr_character_collision_right_object(x, y, Angle,spr_mask_big,par_collision_break_walls_knux)))
        {
           with(breakable_wall_knux)
           {
                   PlaySound(SFX.snd_object_destroy, global.SFXVolume, 1,1);
                broken     = true;
                pieces_dir = 1;
                instance_destroy();
           }
        }
