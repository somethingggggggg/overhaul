 if(argument0 == "Top"){
          Monitor = scr_character_collision_bottom_object(x, y, Angle, spr_mask_big, obj_monitor);
          if((Monitor && YSpeed >= 0 && ((Action = ActionJump) || Action = ActionRolling || Action = ActionNormal && Animation == "ROLL" && CharacterID != CharacterAmy))){

             // Destroy the Monitor:
                Monitor.DestroyParent = id;
                with(Monitor) { instance_destroy(); }

             // Rebound:
                if(KeyAction){
                   if(HomingUsed == true){
                      HomingUsed  = false;
                      XSpeed      = 0;
                   }
                   YSpeed  *= -1;
                   Ground  = false;
                   JumpHeightMod = false;
                }else{
                   if(HomingUsed == true){
                      HomingUsed  = false;
                      XSpeed      = 0;
                   }
                   YSpeed  = max(-4, YSpeed*-1);
                   Ground  = false;
                   JumpHeightMod = false;
                }

             // If we used a shield attack deactivate it:
                if(Shield == ShieldBubble){
                   ShieldUsable = true;
                   ShieldChild.Shield_State = "default";
                }
          }

       }

    // Destroy Monitors while standing on them with Amy:
       if(CharacterID == CharacterAmy){
          if((AmyHammerAttack = 1 && AnimationFrame >= 5)){
             Monitor = scr_character_collision_object(x, y, obj_monitor);
             if(Monitor != noone){

             // Destroy the Monitor:
                Monitor.DestroyParent = id;
                with(Monitor) { instance_destroy(); }

             }
          }
       }

 // Check if we collide with the side:
    if(argument0 == "Side")
    {
       var monitor;
       monitor = instance_nearest(x, y, obj_monitor);
       if(monitor != noone && (Action == ActionRolling || ShieldAttack == 1 || (AmyHammerAttack = 1 && AnimationFrame >= 5) || AmyHammerAttack = 2 || Action == ActionGlide || Action == ActionSlide) && (scr_character_collision_left_object(x, y, Angle, spr_mask_main,monitor) || scr_character_collision_right_object(x, y, Angle, spr_mask_main,monitor)))
       {
          // Destroy monitor:
             monitor.DestroyParent = par_character;
             with(monitor)
             {
                  instance_destroy();
             }
       }
    }

    // Check if we collide with the bottom:
       Monitor = instance_nearest(x, y, obj_monitor)
       if(Monitor != noone && (YSpeed != 0) && (scr_character_collision_top_object(x, y, 0, spr_mask_big, Monitor))){
          if(AmyHammerAttack = 0){
             Monitor.Bump   = true;
             Monitor.YSpeed = -2;
             Angle          = 0;
             YSpeed         = 0;
          }else{
             // Destroy the Monitor:
                Monitor.DestroyParent = id;
                with(Monitor) { instance_destroy(); }
          }
       }
