#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
/// Create and define most common character values.
ActionNoControlJump = 888
   // Set the Chracter ID:
      CharacterID    = global.Character_1; // Who we're playing as.
      CharacterState = CharacterNormal;    // State of our Character, either Normal (Default), Super or Hyper.
      CharacterType  = IsPlayable;         // Is Playable or AI?
      
   // Horizontal Speed Values:
      XSpeed          = 0;        // The current horizontal speed.
      XSpeed_Top      = 6;        // Characters top horizontal speed when on flat ground.
      XSpeed_Max      = 16;       // Fastest the Character can move horizontally.
      GSpeed          = 0;        // Temp. Variable to store X or Y Speed.       
      XAcceleration   = 0.046875; // Horizontal acceleration and friction when on ground.
      XDeceleration   = 0.5;      // Horizontal deceleration when opposite input is held.
      XSlopeFactor    = 0.125;    // Rate at which the character slows down when moving up slopes. //0.5;
      AirAccel        = 0.09375   // Acceleration value in air.
      _Accel          = 0;        // Temp. acceleration variable.
      _Decel          = 0;        // Temp. deceleration variable.
      _Fric           = 0;        // Temp. friction variable.
      SpeedLimit      = false;    // Whether or not we limit the Horizontal Speed.
      Allow_XMovement = true;     // Whether or not we allow the Horizontal movement.
      SpeedShoeTimer  = 900;      // How long Speed shoes last.       
      jump_completed = false
      
   // Vertical Speed Values:
      YSpeed         = 0;        // The current vertical speed.
      YSpeed_Max     = 16;       // Fastest the player can move/fall vertically.
      YAcceleration  = 0.21875;  // The force of gravity applied to the character while ion the air.
      YAccel_Common  = 0.21875;  // Common/Default force of acceleration. In case we have to reset it quickly.
      YDeceleration   = 0.25;      // Vertical deceleration when opposite input is held.
      ConversionFact = 1;        // Speed conversion when landing on ground.
      AirLimit       = true;     // Whether or not we limit the Vertical Speed.
      AirTimer       = 0;        // Checks how long we're in the air.
      Allow_YMovement = true;    // Whether or not we allow the Vertical movement.

   // Other movement variables
      XSample        = 13;       // Pixel limit to divide horizontal movement; ignored if 0 or less
      YSample        = 13;       // Pixel limit to divide vertical movement; ignored if 0 or less

   // Terain interaction:
      Ground              = true;    // Checks if the character has/is grounded.
      PlatformCheck       = false;    // Checks if the character has landed on a platform.
      PlatformCheckTimer  = 30;       // Used to reset the Platform check. Prevents that the character looses collision.
      OnSwing             = noone;    // Checks if the character is on a swinging platform.
      OnMoving            = noone;    // Checks if the character is on a moving platform.
      OnCollapse          = noone;    // Checks if the character is on a collapsing tile.
      AllowStuck          = noone;    // If true, this will prevent the "Stuck in terrain" code.
      Angle               = 0;        // Angle of the terrain.
      AngleRound          = 0;        // Rounded angle.
      RelativeAngle       = 0;        // Current angle relative to the gravity angle.
      AngleHold           = 0;        // Used for smoothing angle values.
      AnimationAngle      = 0;        // Used to rotate the characters sprite.
      Layer               = 0;        // Characters collision layer. Used for loops and special paths.

   // Control Flags:
      InputAlarm     = 0;        // Used for locking input temporarly when loosing speed on step slopes.
      AlarmDirection = 0;        // For the above variable, this one locks either the right or left key.
      InputLock_L    = 0;        // Is the left input locked?
      InputLock_R    = 0;        // Is the right input locked?
      InputLock_S    = 0;        // Is the input locked after using a spring?
      LockTimer      = 0;        // Keep track how long the input is locked.
      LockControl    = 1;        // Looks the control.
      LockTunnel     = 0;        // Locks falling when inside a tunnel.
      Launched       = 0;        // Whether or not we launched up in the air (using a slope)
      LaunchedTimer  = 0;        // Makes sure to disable any kind of horizontal force when being launched.
      JumpLock       = false;        // Used to lock the jumping direction.
      AllowLookUp    = 1;        // Checks if we're allowed to look up.
      AllowLookDown  = 1;        // Checks if we're allowed to look down.
      UsedCorkscrew  = 0;        // Used after a Corkscrew to revert changes made to the character.

   // Special/Character Specific Abilities and flags:
      AbilityPeelout  = 1;       // Can we use the Peelout?
      PeeloutFlag     = 0;       // Checks if we're performing a peelout.
      PeeloutTimer    = 0;       // Has to be 12 to perform a peelout.
      AbilityGrind    = 0;       // Can we grind on rails?
      AbilityBoost    = 0;       // Can we boost?
      AbilityHoming   = 1;       // Can we perform a homing attack?
      HomingTable     = 0;       // Contains the objects we can target.
      HomingUsed      = 0;       // Checks if we're used a homing attack.
      AbilityTricks   = 0;       // Can we perform tricks?
      AbilityDropDash = 1;       // Can we perform a drop dash?
      DropDashFlag    = 0;       // Used to change the animation.
      DropDashTimer   = 15;      // How long it takes to charge the drop dash.
      DropDashSpeed   = 0;       // How strong the drop dash is.

   // Camera:
      Offset_Up      = -104;     // How many pixels the camera will move up while looking up.
      Offset_Down    = 88;       // How many pixels the camera will mvoe down while crouching.
      Offset_Hor     = 60;       // Horizontal offset.
      TimerUp        = 0;        // Keeps track of how long the character has been looking up.
      TimerDown      = 0;        // Keeps track of how long the character has been looking down.
      TimerDash      = 0;        // Keeps track of how long the character has been spindashing.
      ShiftX         = 0;        // How much the camera shifts on the x-axis.
      PreviousX      = x;        // Previous X Position.
      PreviousY      = y;        // Previous Y Position.
      BindToCam      = false;    // Whether or not the character can leave the boundaries.

   // World interaction:
      Underwater     = false;    // Checks if the character is underwater.
      DrownTimer     = 1800;     // How long it takes (in frames) for the character to drown.
      DrownCounter   = -1;       // The number count down above the character while about to drown.
      BubbleTimer    = 0;        // How long the character is stuck in the breathing state after touching a bubble.
      BreathTimer    = 20;       // Needed for creating bubbles after we drowned.
      HasDrowned     = false;    // Checks if the Character has drowned.
      Invincibility  = 0;        // Check whether or not the character is invincible. (1 - When Hurt, 1.5 - When having a invincibility shield, 2 - When Super/Hyper)
      InvTimer       = 0;        // How long the invincibility last.
      Shield         = 0;        // The current shield of the Character.
      ShieldChild    = 0;        // Needed to destroy/change a shield.
      ShieldBackup   = 0;        // Used when in super/hyper form and getting a shield.
      ShieldUsable   = 0;        // Whether or not we can use a shield.
      ShieldAttack   = 0;        // Checks if we're attacking using a shield.
      ShieldCoolDown = 0;        // Prevent insta-use of electricity shield on ceilings.
      ShieldState    = 0;        // Players shield state.
      FloorMode      = 0;        // Returns the floor mode.
      LoopDirection = 0;
       
   // Rendering:
      FramesCount     = 0;       // Used for various animations. Like count frames when no input is given and the character is doing nothing.
      FrameHold       = 0;       // Holds the number of a frame, used after the character turns back to normal after their super/hyper form.
      RenderingSpeed  = 0;       // Used to modify the speed of various animations.
      SnapTimer       = 0;       // Used to rotate the Character properly in 8°Mode.
      PalettePosition = 0;       // If we manipulate a sprites palette, this keeps track of the position.  
      Rotation_Animation = 0;    // Used when the character has to use a rotation animation (ex. corkscrew) 
      Rotation_Speed  = 0.25;    // Used for rotation animations.
      Rotation_Frame  = 0;       // Used for rotation animations, but if we manually want to change the frame.
      Alpha           = 1;       // The opacity of the characters sprite.
      XLen            = 1;       // The X Length value used for drawing sparks.
      YLen            = 0;       // The Y Length value used for drawing sparks.

   // State:
      Action         = 0;        // Keeps track of the current action/state.
      
   // Physic Modifications:
      PhysicMode     = "Normal"; // Whether we're using default physics, water physics or super physics.
      HasSpeedShoes  = false;    // Checks whether or not we got speed shoes.

   // Jumping:
      JumpStrength   = -6.5;     // Strength of the characters jump.
      JumpRelease    = -4;       // The minimum strength the character can jump.
      JumpHeightMod  = true;     // Whether or not we can modify the jump height.

   // Rolling:
      RollDec        = 0.3;       // Rolling deceleration.
      RollDecLight   = 0.0234375; // Deceleration when holding the forward direction.
      RollDecStrong  = 0.125;     // Deceleration when holding the opposite direction.
      Rolling_Deceleration_Up   = 0.078125; // Slope decel. factor when rolling up.
      Rolling_Deceleration_Down = 0.3125;   // Slope decel. factor when rollong down.

   // Spindash:
      SpindashAccumulator =  0;   // Spindash accumlator.
      SpindashAccumMax    =  12;  // Max. accumlator amount.
      SpindashAccumMin    =  8;   // Min. ammount needed to perform a spindash.
      SpindashPitch       =  0;   // How much the spindash sounds pitch gets increased.

   // Pushing:
      Pushing_Timer       = 0;    // Keeps track how long we're already trying to push.
      Pushing_Timer_Max   = 3;    // How long it takes to actually push.
      
   // Skidding:
      SkiddingFrames      = 80;   // How long you can skid.
      SkidDirection       = 1;
    
   // Goal:
      GoalState           = 0;    // Check if we're in our goal state. (Results)
      GoalTimer           = 5;    // Keeps track how many frames it takes to stop sonic from movement.

   // Flying:
      FlightTimer         = 0;
      FlightDuration      = 480;
      FlySoundTimer       = 0;
      FlySoundControl     = 0;
      FlyFallControl      = 0

   // (Amy only) - Hammer and dif. Jumps.
      AmyHammerAttack    = 0;    // Sets the Hammer attack for Amy. (0 = No attack, 1 = Standing Attack, 2 = Running Attack, 3 = Air Attack)
      AmyRollJump        = 0;    // Used to change Amy's animation.
      AmyHammerJump      = 0;    // Used when doing a hammer jump.
      AmyDashDirection   = 0;    // Used when doing a hammer dash.
   
   // (Knuckles only) - Gliding and Climbing.
      GlideTopSpeed      = 24;   // Fastest Knuckles can move horizontally while gliding.
      GlideGravity       = .125; // The gravity while gliding.
      GlideCrouchTimer   = 25;   // How long knuckles stays in his crouched state.
      GlideTurn_S        = 0;    // Special variable for turning knuckles.
      GlideTurn_A        = 0;    // Special variable for turning knuckles.
      GlideTurn_D        = 0;    // Special variable for turnuing knuckles.
      ClimbOX            = 0;    // Position returns the x position when grabbing onto a wall. If the X value is lower/higher, stop climbing.
      ClimbSpeed         = 1;    // How fast Knuckles can climb a wall.
      ClimbFrameTimer    = 6;    // When 0, advance the frame of knuckles climb animation.
      IsLedgeGrabbing    = 0;    // Checks if we're ledge grabbing.
       bar_timer_wait    = 0;
      //Planeo
FuerzaAcumulada     = 0
FuerzaAcumuladaMax  = 3.6
PlaneoDir           = 1 //1-Arriba; 2-Asciende; 3-Centro; 4-Desciende; 5-Abajo;
GravedadDePlaneoMax = 5.75

   // Transforming
      AllowTransformation = 1;    // Checks if we can transform.
      TransformEnded      = 0;    // Checks if a transformation has ended.
      if(CharacterID != CharacterKnuckles){
         TransformTimer      = 15;   // How long it takes to return to a normal stage.
      }else{
         TransformTimer      = 3;   // How long it takes to return to a normal stage.
      }

   // Death:
      DeathTimer          = false; // Dying timer.
// Tubes n' Stuff //
    tube_type           = 0;        // Used for correct movement.
    tube_timer          = 0;        // Used for playing the roll sound at the correct time when in a tube.
    tube_mov_x          = 0;        // The x movement for the player in a tube.
    tube_mov_y          = 0;        // The y movement for the player in a tube.
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Keys.

    // Keys:
       KeyUp               = false
       KeyDown             = false
       KeyRight            = false
       KeyLeft             = false
       KeyAction           = false
       KeySpecial          = false
       KeyEnter            = false

    // Key presses:
       KeyUp_Pressed       = false
       KeyDown_Pressed     = false
       KeyRight_Pressed    = false
       KeyLeft_Pressed     = false
       KeyAction_Pressed   = false
       KeySpecial_Pressed  = false
       KeyEnter_Pressed    = false

    // Key releases:
       KeyUp_Released      = false
       KeyDown_Released    = false
       KeyRight_Released   = false
       KeyLeft_Released    = false
       KeyAction_Released  = false
       KeySpecial_Released = false
       KeyEnter_Released   = false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Define Animation system.
   scr_animation_init();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Checkpoint Respawn & Bonus Stage Rewards.
    if(global.BonusStage == false){
       if(global.CheckpointX != -1 && global.CheckpointY != -1){
          x = global.CheckpointX;
          y = global.CheckpointY;
          if(global.BonusRings != 0){
             global.Rings     += global.BonusRings;
             global.BonusRings = 0;
          }
          if(global.BonusShield != 0){
             Shield = global.BonusShield;
             global.BonusShield  = 0;
          }
             global.Ring100Check_Deactivate = false;

          // Update Camera position:
             obj_camera.x      = x;
             obj_camera.y      = y;
             obj_camera.Cam_XX = x;
             obj_camera.Cam_XX = y;
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera.

    camera = instance_create(x, y, obj_camera);
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Decrease Rings.
    global.Rings-=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy shields underwater.
    if(Shield = ShieldElectricity && !instance_exists(obj_effect_electro_flash)){
       instance_create(0, 0, obj_effect_electro_flash);
    }
    Shield = ShieldDefault;
    with(ShieldChild){
         instance_destroy();
    }
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Death.
    if(Action = ActionDie){
    AmyHammerAttack = 0
       if(DeathTimer == false){
          Angle = 0;
          if(global.BonusStage == false && Underwater == false){
             YSpeed        = -7;
          }
          DeathTimer    = 120;
          depth         = -999995;
          if(instance_exists(obj_audio_manager)){
             with(obj_audio_manager){
                  DeadFade = true;
             }
          }
          if(global.BonusStage == false){
             global.Lives -= 1;
             global.DoTime = 0;
             PlaySound(SFX.snd_character_die, global.SFXVolume, 1, 0);
          }

          // Destroy Shields:
             if(ShieldChild != 0){
                with(ShieldChild){
                     instance_destroy();
                }
             }

          // Make sure to reset the Character state:
             CharacterState = CharacterNormal;
             Animation      = "IDLE";
             alarm[0]       = -1;

       }

       // Set Gravity:
          if(Underwater == false){
             YSpeed += 0.21875;
          }else{
             YSpeed += 0.0625;
          }
          y      += YSpeed;

        Animation = "DIE"
       // Stop Sounds:
          StopSound(SFX.snd_character_flying);
          StopSound(SFX.snd_character_flying_fall);

       // Decrease Kill Timer:
          if(DeathTimer != 0){
             DeathTimer-=1
          }
          if(DeathTimer > -128 && DeathTimer <= 0){
             if(global.BonusStage == false){
                if(global.Lives > 0){
                   if(instance_exists(obj_fade_restart) == false){
                      instance_create(0, 0, obj_fade_restart);
                   }
                }else{
                   if(instance_exists(obj_game_over) == false){
                      instance_create(0, 0, obj_game_over);
                   }
                }
             }else{
                   if(instance_exists(obj_fade_from_bonus) == false){
                      instance_create(0, 0, obj_fade_from_bonus);
                   }
             }
             DeathTimer = -128;
          }

    }

 // Death fade fix:
    if(instance_exists(obj_audio_manager)){
       if(obj_audio_manager.DeadFade == true && Action != ActionDie){
          DeadFade = -1;
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle X/Y, Collision and Objects.


 // Exit if we're death:
    if(Action != ActionDie){
                                                                             
    var TotalSteps, Sample;

    if(Allow_XMovement) {
       if(SpeedLimit){
          XSpeed = scr_clamp(XSpeed, -XSpeed_Max, XSpeed_Max);
       }

    TotalSteps = 1;
    if(XSample > 0) {
       TotalSteps += floor(abs(XSpeed) / XSample);
    }

    Sample = XSpeed / TotalSteps;

    repeat (TotalSteps) {
                                             
        x += cos(degtorad(Angle)) * Sample;               
        y -= sin(degtorad(Angle)) * Sample;
           
        // Move the Character outside in case he gets stuck inside a wall:
        while (Sample > 0 && scr_character_collision_right(x, y, Angle, spr_mask_mid) == true) {
               x -= cos(degtorad(Angle));
               y += sin(degtorad(Angle));          
        }
        while (Sample < 0 && scr_character_collision_left(x, y, Angle, spr_mask_mid) == true) {
               x += cos(degtorad(Angle));
               y -= sin(degtorad(Angle));         
        }
         
        scr_character_handle_layers();
        scr_character_handle_tunnel_locks();
        scr_character_handle_springs();
        scr_character_handle_casino_gimmicks();
        scr_character_handle_bosses();
        scr_character_handle_watersurface();  
        scr_character_handle_collapsing_tiles(); 
        scr_character_handle_platforms();
        scr_character_handle_launch_sensor();   
        scr_character_handle_bonus_objects();   
        scr_character_handle_tornado();  
        
        if (Ground) {
            while (scr_character_collision_main(x, y)) {
                x -= sin(degtorad(Angle));
                y -= cos(degtorad(Angle));
            }
            if (scr_character_collision_slopes(x, y, Angle, spr_mask_mid)) {
                while (not scr_character_collision_main(x, y)) {
                    x += sin(degtorad(Angle));
                    y += cos(degtorad(Angle));
                }
            }
              
            if (Allow_YMovement) {

                // Get a new angle:
                if (scr_character_collision_left_edge(x, y, Angle) and scr_character_collision_right_edge(x, y, Angle)) {
                    Angle = scr_character_calculate_angle(x, y, Angle);
                }
            }
        }
        
        scr_character_handle_tunnel_locks();          
        scr_character_handle_collectibles();       
        scr_character_handle_harmful();
        scr_character_handle_spikes();         
        scr_character_handle_obstacles();                                               
        scr_character_handle_monitors("Side");      
        scr_character_handle_enemies();  
        scr_character_handle_corkscrew();
        scr_character_handle_tornado();
                        
        if (XSpeed == 0) {
            break; // abort;
        }
               
    }
            
}     
                
if (Allow_YMovement) {   
    // Limit the vertical speed:
    if (AirLimit) {
        YSpeed = scr_clamp(YSpeed, -YSpeed_Max, YSpeed_Max);
    }

    if (not Ground) {
        TotalSteps = 1;
        if (XSample > 0) {
            TotalSteps += floor(abs(YSpeed) / YSample);
        }
    
        Sample = YSpeed / TotalSteps;
    
        repeat (TotalSteps) {
                                                 
            x += sin(degtorad(Angle)) * Sample;
            y += cos(degtorad(Angle)) * Sample;

            // Move the player outside in case he got stuck inside floor or the ceiling:        
            while (Sample < 0 and scr_character_collision_top(x, y, 0, spr_mask_mid) == true) {
                   x += sin(degtorad(Angle));
                   y += cos(degtorad(Angle));
            }
            while (Sample > 0 and scr_character_collision_bottom(x, y, 0, spr_mask_mid) == true) {
                   x -= sin(degtorad(Angle));            
                   y -= cos(degtorad(Angle));           
            }
  
            scr_character_handle_launch_sensor();                        
            scr_character_handle_layers();
            scr_character_handle_tunnel_locks();            
            scr_character_handle_watersurface()
            scr_character_handle_collapsing_tiles();
            scr_character_handle_springs();
            scr_character_handle_casino_gimmicks();   
            scr_character_handle_bosses();                     
            scr_character_handle_platforms();
            scr_character_handle_enemies()        
            scr_character_handle_monitors("Top");            
            scr_character_handle_bonus_objects();   
            scr_character_handle_corkscrew();                 
                                  
            // Check for Landing:            
            if (YSpeed >= 0 and scr_character_collision_bottom(x, y, 0, spr_mask_big)) {
                 if (scr_character_collision_left_edge(x, y, 0) and scr_character_collision_right_edge(x, y, 0)) {
                    scr_character_angle(scr_character_calculate_angle(x, y, Angle));
                 } else {
                    scr_character_angle(global.GravityAngle);
                 }
                 
                 // Check if landed on obstacles
                 if (scr_character_collision_bottom_object(x, y, Angle, spr_mask_main, par_collision_obstacles)) {
                     scr_character_angle(global.GravityAngle);
                 }

                 if(abs(XSpeed) <= abs(YSpeed) && RelativeAngle >= 22.5 && RelativeAngle <= 337.5){
                    XSpeed = -YSpeed*sign(sin(degtorad(RelativeAngle)));
                    if(RelativeAngle < 45 || RelativeAngle > 315) { XSpeed *= 0.5 }
                 }
  
                 //XSpeed -= sin(degtorad(Angle))*(YSpeed+ConversionFact);
                 YSpeed = 0;
                 Ground = true;
                                               
                 // Return to a normal state when the character was hurt or jumping:
                 if (Action = ActionHurt || Action = ActionJump){
                     Action = ActionNormal;    
                 }
              
                 // Return to a normal state when the character was flying:
                 if (Action = ActionFly || Action = ActionFlydrop || Action = ActionSuperFly) {
                     Action = ActionNormal;
                     YAcceleration = YAccel_Common;
                 }
            }
            
            if ((YSpeed < 0 and scr_character_collision_top(x, y, 0, spr_mask_large)) && (!scr_character_collision_top_object(x, y, Angle, spr_mask_large, par_collision_obstacles))) {
            
                // Calculate new terrain angle
                scr_character_angle(180);
             
                // Check if possible to land using that angle
                if (scr_character_collision_left_edge(x, y, Angle) && scr_character_collision_right_edge(x, y, Angle)) {
                    scr_character_angle(scr_character_calculate_angle(x, y, Angle));

                                                                 
                    // Check if the landed angle isn't a flat top
                    if (RelativeAngle > 160 && RelativeAngle < 200) {
                        scr_character_angle(global.GravityAngle);
                        YSpeed       = 0;
                        ShieldUsable = true;
                    }

                    // Calculate new movement values
                       XSpeed -= sin(degtorad(Angle))*(YSpeed);
                       Ground = true;

                } else {
                    scr_character_angle(global.GravityAngle);
                    YSpeed       = 0;
                    if (not Ground) {
                        break; // no need to continue looping
                    }
                }

            }

            // Wall Collision (again)
            while (scr_character_collision_right(x, y, Angle, spr_mask_mid)) {
                x -= cos(degtorad(Angle));
                y += sin(degtorad(Angle));
            }
            while (scr_character_collision_left(x, y, Angle, spr_mask_mid)) {
                x += cos(degtorad(Angle));
                y -= sin(degtorad(Angle));
            }

            scr_character_handle_tunnel_locks();
            scr_character_handle_collectibles();
            scr_character_handle_harmful();
            scr_character_handle_spikes();
            scr_character_handle_obstacles();
            scr_character_handle_monitors("Side");
            scr_character_handle_corkscrew();

        if (YSpeed == 0) {
            break; // abort;
        }

      }

   }
}

    // Fall off the ground if the edges aren't colliding         
       if(Ground && Angle != 0){
          if(!scr_character_collision_left_edge(x, y, Angle) || !scr_character_collision_right_edge(x, y, Angle)){
             if(FloorMode == 1 || FloorMode == 3){
                GSpeed        = XSpeed;             
                YSpeed        = -(dsin(RelativeAngle) * GSpeed)                           
                LaunchedTimer = 3;     
                XSpeed        = cos(degtorad(RelativeAngle))*XSpeed;
                Ground        = false;                             
             }else{
                Ground        = false;
                YSpeed        = -sin(degtorad(Angle))*XSpeed;
                XSpeed        = cos(degtorad(Angle))*XSpeed;                   
             }
          }
       }
    scr_character_handle_break()
    // Get the GSpeed:   
       scr_character_movement_gspeed();
     
   }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=other
*/
/// Accel/Decel and more X/Y Movement related stuff.

 // Exit if we're death:
    if(Action != ActionDie){

    // Input Alarm, ignores left or right input while above zero.
    // Used to stop the character from inching up steep slopes.
       if(InputAlarm > 0){
          InputAlarm -= 1;
       }else{
          InputAlarm     = 0;
          AlarmDirection = 0;
       }
       
    // Accel/Decel changes:
       if(Ground){
          _Accel = XAcceleration;
          _Decel = XDeceleration;
          _Fric  = _Accel;
       }else{
          _Accel = XAcceleration * 2;
          _Decel = 0;
          _Fric  = 0;       
       }
       
   // Perform Horizontal / X Movement:
      scr_character_movement_x();
              
   // Perform Vertical / Y Movement:
      scr_character_movement_y();
            
   // Air Drag:
      if(!Ground && (Action != ActionHurt) ){
         if(YSpeed < 0 && YSpeed >= -4){
            XSpeed -= ((XSpeed / 0.125) / 256);
         }
      }           
 // Floor Mode
      FloorMode = round(Angle/90) mod 4;  
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Character states and actions.
//  Add all actions the character can perform, here!

  // Exit if we're death:
     if(Action != ActionDie || Animation != "GOAL"){

  // Goal State:
     scr_character_action_goal();
                
  // Transforming (Has to be triggered before the jump script.)
     if(CharacterID != CharacterAmy){
        if(CharacterID != CharacterTails){
           scr_character_action_transform();
        }else if(CharacterID == CharacterTails){
                 if(global.Emeralds == 14){
                    scr_character_action_transform(); 
                 }
        }
     }
          
  // Shields (Has to be triggered before the jump script.)
     scr_character_action_shield();

  // Insta Shield (Has to be triggered before the jump script.)
     if(CharacterID == CharacterSonic){
        scr_character_action_insta_shield()
     }
                            
  // Drop Dash (Has to be triggered before the jump script.)
     if(CharacterID == CharacterSonic){  
        scr_character_action_drop_dash();
     }
  
  // Miles Fly/Drop Action (Has to be triggered before the jump script.)
     if(CharacterID == CharacterTails){
        scr_character_action_fly();
     }
      
  // Knuckles gliding and climbing ability (Has to be triggered before the jump script.)
     if(CharacterID == CharacterKnuckles){ 
        scr_character_action_glide();
        scr_character_action_climb();
        scr_character_action_slide();
     }
       
  // Amy Hammer attacks 
     if(CharacterID == CharacterAmy){
        scr_character_action_hammer();
     }     

                 
   // Collapsing tiles have to be handled differently to prevent that the Character gets stuck or gets pushed away.
   // This is why the following code exists here. Anywhere else, we'll just get stuck and won't be able to Jump.
    if(place_meeting(x, y + YSpeed, par_collision_collapse_tiles)){
       while(!place_meeting(x, y + sign(YSpeed), par_collision_collapse_tiles)){
              y += sign(YSpeed);
       }
       Ground = true;   
    }         
                       
     
  // Look up:     
     scr_character_action_lookup();    
           
  // Crouch:
     scr_character_action_crouch();      
     
  // Spindash:   
     scr_character_action_spindash();   
           
  // Push:
     scr_character_action_push();  
     
  // Peelout:
     if(CharacterID == CharacterSonic){
        if(AbilityPeelout == 1){
           scr_character_action_peelout();
        }
     }
        
  // Skidding:
     scr_character_action_skid();
     
     scr_character_action_slipping();
     scr_character_action_tubes();
     }
     scr_test_char_abil()
   // Jump:
     scr_character_action_jump(); 
     if CharacterState = CharacterSuper or CharacterState = CharacterHyper{
     if global.Rings = 0{
     scr_animation_reset()
     }
  scr_character_action_super_fly()
  }
  scr_character_action_rail()
  scr_character_handle_bar()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Lock.

 // Exit if we're death:
    if(Action != ActionDie){
       
    // Exit if we're dead or hurt:
       if(Action != ActionDie && Action != ActionHurt){

    // Enable after jumping:
       if(InputLock_S && !JumpLock && Action = ActionJump){
          LockTimer = 0;
          AlarmDirection = 0;
       }

    // Disable Alarm Direction when the angle is 0:
       if(AlarmDirection != 0 && Angle = 0){
          AlarmDirection = 0;
       }

    // Disable Locks:
       if(LockTimer < 1 && InputLock_S = true){
          InputLock_S = false;

          // Enable input:
             InputLock_L = 0;
             InputLock_R = 0;

       }

    // Enable Locks:
       if(InputLock_S && XSpeed > 0){
          InputLock_L = 1;
          KeyRight    = 1;
       }else if(InputLock_S && XSpeed < 0){
                InputLock_R = 1;
                KeyLeft    = 1;
       }

    // Decrease lock timer:
       if(LockTimer > 0){
          LockTimer -= 1;
       }

       }

    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///(Invincibility) Timers & Sparkle Effects.

 // Exit if we're death:
    if(Action != ActionDie){
          
   // Speed Shoe timer:
      if(SpeedShoeTimer > -1 && HasSpeedShoes == true){
         SpeedShoeTimer-=1
      }else{
         HasSpeedShoes  = false;
         SpeedShoeTimer = 900;
      }
   
   // If our Invincibility timer is above zero, slowly decrease from it:
      if(InvTimer > -1){
         InvTimer -= 1;
         if(InvTimer == 0){
            Invincibility = 0;
            InvTimer      = 0;
         }
      }
   
   // When we're hit and collide with the ground, set a invincibility timer:
      if(Invincibility == 1 && InvTimer == -1 && Ground){
         InvTimer = 120;
      }

   // When we're super, we're always invincible:
      if(CharacterState = CharacterSuper or CharacterState = CharacterHyper){
         Invincibility =  2;
         InvTimer      = -2;
      }else{
         if(InvTimer = -2){
            Invincibility = 0;
            InvTimer      = 0;
         }
      }

   // Sparkles:
      if(Invincibility > 1){
         if(CharacterState != CharacterHyper){
            repeat(1){
                   instance_create(x + YLen*4, y-XLen*4, obj_invincibility_sparkle)
            }
         }else{
            if(CharacterState == CharacterHyper){
               repeat(1){
                      instance_create(x + YLen*4, y-XLen*4, obj_hyper_sparkle)
               }
            }
         }
      }

    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Die from Heights.

    if(global.DeathHeight == noone){
       if(y >= room_height && Action != ActionDie){
          Action = ActionDie;
       }
    }else{
       if(y >= global.DeathHeight && Action != ActionDie){
          Action = ActionDie;
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Gameplay Effects.

    // After Effect:
       if(!Underwater){
          if((CharacterState = CharacterHyper && current_time div 40) || (HomingUsed = true && current_time div 40) | (CharacterID == CharacterAmy
          && (AmyHammerAttack = 2 || AmyHammerAttack = 3) && current_time div 40)){
             if(instance_number(obj_aftereffect) < 3){
                Effect = (instance_create(xprevious, yprevious, obj_aftereffect)){
                          Effect.Parent             = id;
                          Effect.sprite_index       = AnimationSprite;
                          Effect.AnimationFrame     = AnimationFrame;
                          Effect.AnimationDirection = AnimationDirection;
                          Effect.AnimationAngle     = AnimationAngle;
                }
             }
          }
       }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Underwater handling.

 // Only run this if we're not in a bonus stage, died or won a stage.
    if(Action != ActionDie && GoalState != 1 && !instance_exists(obj_scoring_results) && !instance_exists(obj_game_over)){
    
       // Underwater:
          if(Underwater == true){
          
             // Stop this code block if we have a Bubble Shield or we're hyper:
                if(Shield == ShieldBubble && CharacterState != CharacterHyper){
                   DrownTimer = 1800;
                   if(DrownCounter != -1){
                      if(instance_exists(DrownCounter)){
                         instance_deactivate_object(DrownCounter);
                      }
                   }
                   exit;
                }

             // Reduce the drowning timer:
                if(DrownTimer != 0 && CharacterState != CharacterHyper){
                   DrownTimer-=1
                }

             // Start the drowning theme:
                if(DrownTimer == 650){
                   if(CheckSound(obj_audio_manager.Jingle_Drowning ) == false){
                      PlaySound(obj_audio_manager.Jingle_Drowning, global.SFXVolume, 1, 1);
                   }
                   if(instance_exists(obj_water_countdown) == false){
                      DrownCounter = instance_create(x, y-32, obj_water_countdown);
                      DrownCounter.Parent = id;
                   }
                }

             // Kill the Character.
                if(DrownTimer == 0){
                   DrownTimer = 1800;
                   Action     = ActionDie;
                   HasDrowned = true;
                   if(CheckSound(obj_audio_manager.Jingle_Drowning)){
                      StopSound(obj_audio_manager.Jingle_Drowning);
                   }
                }

             // Bubble Action.
                if(Action = ActionBreath && !Ground){
                   if(BubbleTimer < 1){
                      XSpeed = 0;
                      YSpeed = 0;
                   }
                    if(KeyLeft or KeyRight){
                       XSpeed += AnimationDirection*.025
                    }
                   if(BubbleTimer < 20){
                      BubbleTimer+=1
                   }else{
                      BubbleTimer = 0;
                      Animation   = "WALK";
                      Action      = ActionNormal;
                   }
                   DrownTimer = 1800;
                   if(DrownCounter != -1){
                      if(instance_exists(DrownCounter)){
                         instance_deactivate_object(DrownCounter);
                      }
                   }
                   if(CheckSound(obj_audio_manager.Jingle_Drowning) == true){
                      if(Invincibility < 1.5){
                         LoopSound(obj_audio_manager.ZoneBGM, global.BGMVolume, 1);
                         global.BGMVolume = global.MaxBGMV;
                      }
                      StopSound(obj_audio_manager.Jingle_Drowning);
                   }
                }else if(Action = ActionBreath && Ground){
                         Action       = ActionNormal;
                         BubbleTimer  = 0;
                }

             // No Bubble Action.
                if(Action != ActionBreath){
                   BubbleTimer = 0;
                }

             // Alarm Sounds:
              if(DrownTimer mod 400 == 0){
                 if(CheckSound(obj_audio_manager.Jingle_Drowning) == false){
                     PlaySound(SFX.snd_object_alarm_count, global.SFXVolume, 1, 1);
                 }
              }

             // Air bubbles:
                if(DrownTimer mod 78 == 0 && DrownTimer > 600){
                   Bubble = instance_create(x+irandom_range(-7, 8), y-6, obj_air_bubble);
                   Bubble.BubbleIndex = choose(0, 1, 2, 1, 3);
                }

          }

          // Last Checks above water:
             if(Underwater == false && DrownTimer != 1800){
                DrownTimer = 1800;
                DrownTimer = 1800;
                if(DrownCounter != -1){
                   if(instance_exists(DrownCounter)){
                      instance_deactivate_object(DrownCounter);
                   }
                }
                if(CheckSound(obj_audio_manager.Jingle_Drowning) == true){
                   if(Invincibility < 1.5){
                      LoopSound(obj_audio_manager.ZoneBGM, global.BGMVolume, 1);
                      global.BGMVolume = global.MaxBGMV;
                   }
                   StopSound(obj_audio_manager.Jingle_Drowning);
                }
             }

    }

          // Drowning Bubbles.
             if(Action = ActionDie && HasDrowned){
                if(BreathTimer != 0){
                   BreathTimer -= 0.5;
                   if(random(4) >= 2){
                      Bubble = instance_create(x+irandom_range(-7, 8), y-6, obj_air_bubble);
                      Bubble.BubbleIndex = choose(0, 1, 2, 1, 3);
                   }
                }
             }

          // Prevent music from not restarting.
             if(GoalState != 1 && !instance_exists(obj_scoring_results) && !instance_exists(obj_game_over)){
                if(CheckSound(obj_audio_manager.Jingle_Drowning) == false && CheckSound(obj_audio_manager.ZoneBGM) == false){
                   if((Action = ActionBreath or Underwater == false) && Action != ActionDie && DrownTimer > 0 && Invincibility < 1.5){
                      LoopSound(obj_audio_manager.ZoneBGM, global.BGMVolume, 1);
                      global.BGMVolume = global.MaxBGMV;
                   }
                }
             }
if HasDrowned = true && Action != ActionDie{
Action = ActionDie
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Score Animation Fix.
                      if instance_exists(obj_scoring_results) && Action != ActionNormal && Ground{
           Animation = "GOAL"
           Action = ActionNormal
           }
           if global.Rings = 0 && Action = ActionSuperFly{
           Animation = "ROLL"
           Action = ActionRolling
           }
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Get the input keys.
// If you want to modify any of this. Do so in scr_game_init()

          if(LockControl == 0){

             // Keys:
                KeyUp               = keyboard_check(global.Key_UP)
                KeyDown             = keyboard_check(global.Key_DOWN)
                KeyRight            = keyboard_check(global.Key_RIGHT)
                KeyLeft             = keyboard_check(global.Key_LEFT)
                KeyAction           = keyboard_check(global.Key_ACTION);
                KeySpecial          = keyboard_check(global.Key_SPECIAL);
                KeyEnter            = keyboard_check(global.Key_ENTER);

             // Key presses:
                KeyUp_Pressed       = keyboard_check_pressed(global.Key_UP);
                KeyDown_Pressed     = keyboard_check_pressed(global.Key_DOWN);
                KeyRight_Pressed    = keyboard_check_pressed(global.Key_RIGHT);
                KeyLeft_Pressed     = keyboard_check_pressed(global.Key_LEFT);
                KeyAction_Pressed   = keyboard_check_pressed(global.Key_ACTION);
                KeySpecial_Pressed  = keyboard_check_pressed(global.Key_SPECIAL);
                KeyEnter_Pressed    = keyboard_check_pressed(global.Key_ENTER);

             // Key releases:
                KeyUp_Released      = keyboard_check_released(global.Key_UP);
                KeyDown_Released    = keyboard_check_released(global.Key_DOWN);
                KeyRight_Released   = keyboard_check_released(global.Key_RIGHT);
                KeyLeft_Released    = keyboard_check_released(global.Key_LEFT);
                KeyAction_Released  = keyboard_check_released(global.Key_ACTION);
                KeySpecial_Released = keyboard_check_released(global.Key_SPECIAL);
                KeyEnter_Released   = keyboard_check_released(global.Key_ENTER);

             // Stop left & right at the same time:
                if(KeyRight && KeyLeft){
                   KeyRight = false;
                   KeyLeft  = false;
                }

             // Input Alarm:
                if(InputAlarm){
                   if(AlarmDirection = 1){
                      KeyRight = false
                   }
                   if(AlarmDirection = -1){
                      KeyLeft  = false
                   }
                }

             // Input Lock:
                if(InputLock_L){
                   KeyLeft = false;
                }
                if(InputLock_R){
                   KeyRight = false;
                }

          }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Modify Physics.

 // Previous Positions:
    PreviousX = x;
    PreviousY = y;

 // Switch Physic Modes:
    if(y < global.WaterSurfacePosition or instance_exists(obj_water) == false){
       if(PhysicMode != "Normal"){
          PhysicMode  = "Normal";
          Underwater  = false;
       }
    }
    if(y > global.WaterSurfacePosition && instance_exists(obj_water) == true){
       if(PhysicMode != "Underwater"){
          PhysicMode  = "Underwater";
          Underwater  = true;
       }
    }

 // Sonic and Tails Physics:
    if((CharacterID == CharacterSonic || CharacterID == CharacterTails || CharacterID == CharacterKnuckles) && CharacterState = CharacterNormal){

       if(PhysicMode == "Normal"){

          // Horizontal Values:
             if(HasSpeedShoes == false){
                XSpeed_Top    = 6;
             }else{
                XSpeed_Top    = 12;
             }

             XSpeed_Max     = 16;

             if(HasSpeedShoes == false){
                XAcceleration = 0.046875;
             }else{
                XAcceleration = 0.09375;
             }

             XDeceleration  = 0.5;
             XSlopeFactor   = 0.5;

             if(HasSpeedShoes == false){
                AirAccel      = 0.09375;
             }else{
                AirAccel      = 0.1875;
             }


          // Vertical Values:
             YSpeed_Max     = 16;
             if(Action != ActionGlide && Action != ActionClimb){
                if(Action != ActionFly && Action != ActionFlydrop && Action != ActionSuperFly){
                   if(Action = ActionHurt){
                      YAcceleration = 0.1875;
                   }else{
                      YAcceleration = YAccel_Common;
                   }
                }
             }else{
               YAcceleration = 0;
             }
             ConversionFact = 0.8;

          // Jumping Values:
             if(CharacterID != CharacterKnuckles){
                JumpStrength = -6.5;
             }else{
                JumpStrength = -6;
             }
             JumpRelease    = -4;

          // Rolling Values:
             RollDec                   = 0.3;

             if(HasSpeedShoes == false){
                RollDecLight  = 0.0234375;
             }else{
                RollDecLight  = 0.046875;
             }


             RollDecStrong             = 0.125;
             Rolling_Deceleration_Up   = 0.078125;
             Rolling_Deceleration_Down = 0.3125;

          // Spindash:
             SpindashAccumMax    =  12;
             SpindashAccumMin    =  8;

       }

       if(PhysicMode == "Underwater"){

          // Horizontal Values:
             XSpeed_Top     = 3;
             XSpeed_Max     = 16;
             XAcceleration  = 0.0234375;
             XDeceleration  = 0.5;
             XSlopeFactor   = 0.25;
             AirAccel       = 0.09375*0.5;

          // Vertical Values:
             YSpeed_Max     = 16;
             if(Action != ActionGlide && Action != ActionClimb){
                if(Action != ActionFly && Action != ActionFlydrop && Action != ActionSuperFly){
                   if(Action = ActionHurt){
                      YAcceleration = 0.1875*0.5;
                   }else{
                      YAcceleration = 0.0625;
                   }
                }
             }else{
               YAcceleration = 0;
             }
             ConversionFact = 0.8;

          // Jumping Values:
             if(CharacterID != CharacterKnuckles){
                JumpStrength = -3.5;
             }else{
                JumpStrength = -3;
             }
             JumpRelease    = -2;



          // Rolling Values:
             RollDec                   = 0.3;
             RollDecLight              = 0.0234375;
             RollDecStrong             = 0.125;
             Rolling_Deceleration_Up   = 0.078125;
             Rolling_Deceleration_Down = 0.3125;

          // Spindash:
             SpindashAccumMax    =  12;
             SpindashAccumMin    =  8;

       }

    }
    if((CharacterID == CharacterSonic || CharacterID == CharacterTails || CharacterID == CharacterKnuckles) && (CharacterState = CharacterSuper or CharacterState = CharacterHyper)){

       if(PhysicMode == "Normal"){

          // Horizontal Values:
             XSpeed_Top     = 10;
             XSpeed_Max     = 16;
             XAcceleration  = 0.046875*4;
             XDeceleration  = 1;
             XSlopeFactor   = 0.5*2;
             AirAccel       = 0.09375*4;

          // Vertical Values:
             YSpeed_Max     = 16;
             if(Action != ActionGlide && Action != ActionClimb){
                if(Action != ActionFly && Action != ActionFlydrop && Action != ActionSuperFly){
                   if(Action = ActionHurt){
                      YAcceleration = 0.1875;
                   }else{
                      YAcceleration = YAccel_Common;
                   }
                }
             }else{
               YAcceleration = 0;
             }
             ConversionFact = 0.8;

          // Jumping Values:
             if(CharacterID == CharacterSonic){
                JumpStrength = -8;
             }
             if(CharacterID == CharacterTails){
                JumpStrength = -6.5;
             }
             if(CharacterID == CharacterKnuckles){
                JumpStrength = -6
             }
             JumpRelease    = -4;

          // Rolling Values:
             RollDec                   = 0.3;
             RollDecLight              = 0.0234375;
             RollDecStrong             = 0.125;
             Rolling_Deceleration_Up   = 0.078125;
             Rolling_Deceleration_Down = 0.3125;

          // Spindash:
             SpindashAccumMax    =  15;
             SpindashAccumMin    =  11;

       }

       if(PhysicMode == "Underwater"){

          // Horizontal Values:
             XSpeed_Top     = 5;
             XSpeed_Max     = 16;
             XAcceleration  = 0.0234375*4;
             XDeceleration  = 0.25;
             XSlopeFactor   = 0.25*2;
             AirAccel       = 0.09375*0.5;

          // Vertical Values:
             YSpeed_Max     = 16;
             if(Action != ActionGlide && Action != ActionClimb){
                if(Action != ActionFly && Action != ActionFlydrop && Action != ActionSuperFly){
                   if(Action = ActionHurt){
                      YAcceleration = 0.1870*0.5;
                   }else{
                      YAcceleration = 0.046875;
                   }
                }
             }else{
               YAcceleration = 0;
             }
             ConversionFact = 0.8;

          // Jumping Values:
             if(CharacterID == CharacterSonic || CharacterID == CharacterTails){
                JumpStrength = -3.5;
             }
             if(CharacterID == CharacterKnuckles){
                JumpStrength = -3
             }
             JumpRelease    = -2;

          // Rolling Values:
             RollDec                   = 0.3;
             RollDecLight              = 0.0234375;
             RollDecStrong             = 0.125;
             Rolling_Deceleration_Up   = 0.078125;
             Rolling_Deceleration_Down = 0.3125;

          // Spindash:
             SpindashAccumMax    =  15;
             SpindashAccumMin    =  11;

       }

    }

 // Amy Rose Physics:
    if((CharacterID == CharacterAmy) && CharacterState = CharacterNormal){

       if(PhysicMode == "Normal"){

          // Horizontal Values:
             if(HasSpeedShoes == false){
                XSpeed_Top    = 5.8;
             }else{
                XSpeed_Top    = 11.8;
             }

             XSpeed_Max     = 13.25;

             if(HasSpeedShoes == false){
                XAcceleration = 0.046875;
             }else{
                XAcceleration = 0.09375;
             }

             XDeceleration  = 0.5;
             XSlopeFactor   = 0.5;

             if(HasSpeedShoes == false){
                AirAccel      = 0.09375;
             }else{
                AirAccel      = 0.1875;
             }


          // Vertical Values:
             YSpeed_Max     = 16;

             if(Action != ActionFly && Action != ActionFlydrop && Action != ActionSuperFly){
                if(Action = ActionHurt){
                   YAcceleration = 0.1875;
                }else{
                   YAcceleration = YAccel_Common;
                }
             }
             ConversionFact = 0.8;

          // Jumping Values:
             JumpStrength   = -6.5;
             JumpRelease    = -4;

          // Rolling Values:
             RollDec = 0.3;

             if(HasSpeedShoes == false){
                RollDecLight  = 0.0234375;
             }else{
                RollDecLight  = 0.046875;
             }

             RollDecStrong             = 0.125;
             Rolling_Deceleration_Up   = 0.078125;
             Rolling_Deceleration_Down = 0.3125;

          // Spindash:
             SpindashAccumMax    =  10;
             SpindashAccumMin    =  6;

       }

       if(PhysicMode == "Underwater"){

          // Horizontal Values:
             XSpeed_Top     = 2.8;
             XSpeed_Max     = 13.25;
             XAcceleration  = 0.0234375;
             XDeceleration  = 0.5;
             XSlopeFactor   = 0.25;
             AirAccel       = 0.09375*0.5;

          // Vertical Values:
             YSpeed_Max     = 16;
             if(Action != ActionFly && Action != ActionFlydrop && Action != ActionSuperFly){
                if(Action = ActionHurt){
                   YAcceleration = 0.1875*0.5;
                }else{
                   YAcceleration = 0.0625;
                }
             }
             ConversionFact = 0.8;

          // Jumping Values:
             JumpStrength   = -3.5;
             JumpRelease    = -2;

          // Rolling Values:
             RollDec                   = 0.3;
             RollDecLight              = 0.0234375;
             RollDecStrong             = 0.125;
             Rolling_Deceleration_Up   = 0.078125;
             Rolling_Deceleration_Down = 0.3125;

          // Spindash:
             SpindashAccumMax    =  10;
             SpindashAccumMin    =  6;

       }

    }
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Keep the character within the level's boundaries.
   // Create the Sprite offset:
      var (_SOffset) = sprite_get_width(spr_mask_main) div 2;
      
   // Find Camera:    
      var (_Cam)    = obj_camera;
      
   // Check the Horizontal speed and whether not we collide with the horizontal borders:
      if(instance_exists(_Cam)){
         if(x <= (_Cam.limit_left)+_SOffset && XSpeed < 0.0){  
            XSpeed = 0;
            x     = (_Cam.limit_left)+_SOffset;
         }else
         if(x >= (_Cam.limit_right)-_SOffset && XSpeed > 0.0){   
            XSpeed = 0;
            x      = (_Cam.limit_right)-_SOffset
         }                          
      }
    // Keep the character within the camera's boundaries.
       var _C;
       _C = instance_nearest(x, y, obj_camera);
      /*
       if(_C != noone){
          if(_C.Camera_BindX == 1){
             if(x <= _C.Camera_MinX - 7 + _SOffset && XSpeed < 0.0){
                XSpeed = 0;
                x      = _C.Camera_MinX - 7  + _SOffset;
             }else
             if(x >= _C.Camera_MaxX - 7  - _SOffset && XSpeed > 0.0){
                XSpeed = 0;
                x      = _C.Camera_MaxX - 7  - _SOffset;
             }
          }
          if(_C.Camera_BindY == 1){
             if(y <= _C.Camera_MinY + _SOffset*2 && YSpeed < 0.0){
                YSpeed = 0;
                y      = _C.Camera_MinY + _SOffset*2;
             }
          }
       }
       */
/*         if(_C != noone){
          if(_C.Camera_BindX == 1){
             if(x <= view_xview - 7 + _SOffset && XSpeed < 0.0){
                XSpeed = 0;
                x      = view_xview - 7 + _SOffset;
             }
             if(x >= view_xview+320 + 7 - _SOffset && XSpeed > 0.0){
                XSpeed = 0;
                x      = view_xview+320 + 7 - _SOffset;
             }
          }
       }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Apply Animations and Direction.
// Used to apply animations and change the facing direction:

   // Change the direction we face:
      scr_animation_direction();

   // Apply the correct animation:
      scr_animation_apply();
      scr_animation_apply_tail();
 scr_animation_core();
// In some cases we have to modify the animation speed, and we do exactly that here:

   // Walking/Jogging Animation:
      if(Animation == "WALK" && Ground && Action != ActionSlipping){
        if(CharacterID == CharacterSonic){
           AnimationSpeed = min(0.30, max(0.05+abs(XSpeed)/25));
        }
        if(CharacterID == CharacterTails){
           AnimationSpeed = min(0.25, max(0.10+abs(XSpeed)/25));
           TailSpeed      = min(0.20, max(0.10+abs(XSpeed)/25));
      }
        if(CharacterID == CharacterKnuckles){
           AnimationSpeed = min(0.25, max(0.05+abs(XSpeed)/25));
        }
        if(CharacterID == CharacterAmy){
           AnimationSpeed = min(0.20, max(0.05+abs(XSpeed)/25));
        }
     }

   // Running Animation:
      if(Ground && Animation == "RUN" && Action != ActionSlipping){
         if(CharacterID == CharacterSonic && CharacterState != CharacterNormal){
            AnimationSpeed = 0.20;
         }else{
            AnimationSpeed = 0.20+abs(XSpeed)/25;
         }
         if(CharacterID == CharacterTails){
            AnimationSpeed = 0.20+abs(XSpeed)/25;
            TailSpeed      = 0.25+abs(XSpeed)/25;
         }
         if(CharacterID == CharacterKnuckles){
            AnimationSpeed = 0.20+abs(XSpeed)/25;
         }
         if(CharacterID == CharacterAmy){
            if(Action != ActionSpindash){
               AnimationSpeed = 0.10+abs(XSpeed)/20;
            }else{
               AnimationSpeed = (SpindashAccumulator)*.030;
            }
         }
      }

   // Rolling Animation:
      if(Action = ActionRolling){
        if(CharacterID != CharacterTails){
           if(Ground == true){
              AnimationSpeed = 0.25+abs(XSpeed)/12;
              RenderingSpeed = AnimationSpeed;
           }else{
              AnimationSpeed = RenderingSpeed;
          }
        }else{
            AnimationSpeed = 0.25;
            TailSpeed      = 0.25;
        }
      }

   // Jumping Animation:
      if(Action = ActionJump && CharacterID != CharacterAmy){
         if(CharacterID != CharacterAmy){
            if(CharacterID != CharacterTails){
               if(DropDashFlag != 2){
                  // We set the rendering speed in the jump script.
                     AnimationSpeed = RenderingSpeed;
               }
            }else{
               AnimationSpeed = 0.25;
               TailSpeed      = 0.25;
            }
         }
      }

   // Amy's Jumping/Rolling Animation: 
      if(CharacterID == CharacterAmy){
         if(Action == ActionJump && AmyRollJump == false || Animation == "JUMP"){
            if(YSpeed > 0 && AnimationFrame < 2){
               AnimationFrame += 0.25;
            }else if(YSpeed > 0 && AnimationFrame >= 2){
                     AnimationFrame = 2;
            }
            if(YSpeed <= 0){
               AnimationFrame = 0;
            }
         }else if(Action == ActionJump && AmyRollJump == true){
                  AnimationSpeed = RenderingSpeed;
         }
      }  
  
   // Amy's Hammer Spin Animation:
      if(CharacterID == CharacterAmy){
         if(AmyHammerAttack == 2){
            AnimationSpeed = min(0.30, max(0.10+abs(XSpeed)/25));
         }
      }

   // Limit Jump/Roll Animation:
      if(Action == ActionJump || Action == ActionRolling){
         if(RenderingSpeed > 1.5){
            RenderingSpeed = 1.5;
         }
         if(AnimationSpeed > 1.5){
            AnimationSpeed = 1.5
         }
      }

   // If we hit a wall, reset the animation speed while jumping.
      if(!Ground && YSpeed >= 0 && (scr_character_collision_right(x, y, 0, spr_mask_big) && KeyRight || scr_character_collision_left(x, y, 0, spr_mask_big) && KeyLeft )){
         if(Action = ActionJump || Action = ActionRolling){
            RenderingSpeed = 0.25;
            AnimationSpeed = 0.25;
         }
      }


   // In some cases, we have to modify the animation speed, we do exactly that, here:
/*
      // Modify the Walking/Jogging animation:
      if(Animation == "WALK" && Ground){
         if(CharacterID == CharacterSonic){
            AnimationSpeed = min(0.30, max(0.05+abs(XSpeed)/25));
         }
         if(CharacterID == CharacterAmy){
            AnimationSpeed = min(0.20, max(0.05+abs(XSpeed)/25));
         }
         if(CharacterID == CharacterTails){
            AnimationSpeed = 0
            TailSpeed      = min(0.025, max(0.05+abs(XSpeed)/25));
         }
      }

      // Modify the Running animation:
      if(Ground){
         if(Animation == "RUN"){
            if(CharacterID != CharacterAmy){
               if((CharacterState != CharacterSuper && CharacterState != CharacterHyper)){
                  AnimationSpeed = 0.20+abs(XSpeed)/25
               }else{
                  AnimationSpeed = 0.20; // Super Sonic "Flying" Frame speed.
               }
               TailSpeed = 0.25+abs(XSpeed)/25;
            }else{
               if(Action != ActionSpindash){
                  AnimationSpeed = 0.10+abs(XSpeed)/20;
               }else{
                  AnimationSpeed = (SpindashAccumulator)*.030
               }
            }
         }
      }

      // Modify the Rolling animation:
         if(CharacterID != CharacterTails){
            if(Action = ActionRolling && Ground){
               AnimationSpeed = 0.25+abs(XSpeed)/12;
               RenderingSpeed = AnimationSpeed;
            }else
            if(Action = ActionRolling && !Ground){
               AnimationSpeed = RenderingSpeed;
            }
         }else{
               AnimationSpeed = 0.25
         }


      // Modify the Jumping animation:
      if(CharacterID != CharacterAmy){
         if(CharacterID != CharacterTails){
            if(Action = ActionJump && DropDashFlag != 2){
               // We set the rendering speed that we use here
               // in scr_character_action_jump()
               AnimationSpeed = RenderingSpeed;
            }
         }else{
               AnimationSpeed = 0.25;
         }
      }

      // Amy Jump/Roll Animation:
      if(CharacterID = CharacterAmy){
         if(Action = ActionJump && AmyRollJump = false || Animation = "JUMP"){
            if(YSpeed > 0 && AnimationFrame < 2){
               AnimationFrame += 0.25;
            }else if(YSpeed > 0 && AnimationFrame >= 2 ){
                     AnimationFrame = 2;
            }
            if(YSpeed <= 0){
               AnimationFrame = 0;
            }
         }else if(Action = ActionJump && AmyRollJump = true){
                  AnimationSpeed = RenderingSpeed;
         }
      }

      // Amy hammer spin:
      if(CharacterID == CharacterAmy){
         if(AmyHammerAttack = 2){
            AnimationSpeed = min(0.30, max(0.10+abs(XSpeed)/25));
         }
      }

      // Limit the Jumping/Rolling animation speed:
         if(Action = ActionJump || Action = ActionRolling){
            if(RenderingSpeed > 1.5){
               RenderingSpeed = 1.5;
            }
            if(AnimationSpeed > 1.5){
               AnimationSpeed = 1.5;
            }
         }

      // If we hit a wall while Jumping OR rolling, reset the animation speed just like in original games:
      if(!Ground && YSpeed >= 0 && (scr_character_collision_right(x, y, 0, spr_mask_big) && KeyRight || scr_character_collision_left(x, y, 0, spr_mask_big) && KeyLeft )){
         if(Action = ActionJump || Action = ActionRolling){
            RenderingSpeed = 0.25;
            AnimationSpeed = 0.25;
         }
      }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Rotate the characters sprite.
// This will rotate the sprite while resolve thikering when moving on slopes.

   // Only run this if we're using the 360 rotation.
      if(global.AngleMode == 360){
         if(!scr_character_collision_bottom_object(x,y, Angle, spr_mask_main, par_collision_solid_no_angle) && !scr_character_collision_bottom_object(x, y, Angle, spr_mask_main, par_collision_platform_no_angle)){
            if(Ground && (AnimationDirection == 1 && Angle >= 45 && Angle <= 300) or (AnimationDirection == -1 && Angle >= 45 && Angle <= 310)){            
               AnimationAngle = RelativeAngle; 
               TailAngle      = Angle;
            }else{
               AnimationAngle = scr_character_rotate_towards(0, AnimationAngle, 6);
               TailAngle      = scr_character_rotate_towards(0, TailAngle, 6);  
            }
         }else{
               AnimationAngle = 0;
               TailAngle      = 0;         
         }
       }
          
   // Otherwise, only use 8 directions for the rotation:
      if(global.AngleMode == 8){ 
         if(Ground && !scr_character_collision_bottom_object(x,y, Angle, spr_mask_main, par_collision_solid_no_angle) && !scr_character_collision_bottom_object(x, y, Angle, spr_mask_main, par_collision_platform_no_angle)){    
            if(Angle>=328   && Angle<   360) { AnimationAngle =   0; TailAngle =   0; }
            if(Angle>=0     && Angle<    45) { AnimationAngle =   0; TailAngle =   0; }
            if(Angle>=45    && Angle<  67.5) { AnimationAngle =  45; TailAngle =  45; }
            if(Angle>=67.5  && Angle< 112.5) { AnimationAngle =  90; TailAngle =  90; }
            if(Angle>=112.5 && Angle< 157.5) { AnimationAngle = 135; TailAngle = 135; }
            if(Angle>=157.5 && Angle< 202.5) { AnimationAngle = 180; TailAngle = 180; }
            if(Angle>=202.5 && Angle< 247.5) { AnimationAngle = 225; TailAngle = 225; }
            if(Angle>=247.5 && Angle< 292.5) { AnimationAngle = 270; TailAngle = 270; }
            if(Angle>=292.5 && Angle<   328) { AnimationAngle = 315; TailAngle = 315; } 
            SnapTimer = 8;
         }else{
            if(--SnapTimer <= 0){
               AnimationAngle = scr_character_rotate_towards(0, AnimationAngle, 45);
               TailAngle      = scr_character_rotate_towards(0, TailAngle, 45);         
               SnapTimer      = 8;
            }
            else{
             AnimationAngle = 0;
               TailAngle      = 0;    
               }
         }              
    }
        
   // Set the Angle to 0 at certain animations:
      if(Animation = "IDLE" || Animation = "IDLE_2" || Animation = "LOOK_UP"       || Animation = "CROUCH"         || Animation = "SPINDASH" || 
         Animation = "ROLL" || Animation = "HURT"   || Animation = "GOAL"          || Animation = "EDGE_BALANCE_1" || Animation = "EDGE_BALANCE_2" ||
         Animation = "PUSH" || Animation = "FLY"    || Animation = "FLY_EXHAUSTED" || Rotation_Animation != 0){  
           
         AnimationAngle = 0;
                  if(Animation  != "ROLL"){
            TailAngle   = 0;
         }
         
      }

   // Set the Angle of Miles tail.
      if((Action = ActionJump || Action = ActionRolling || Animation = "ROLL") && Ground == false){
          TailAngle     = point_direction(xprevious, yprevious, x, y);
          if(Ground == false && TailDirection != 1){
             TailDirection = 1;
          }
      }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Water Splash effect.

 // Create a Water Splash:
    if(global.WaterSurfacePosition != -1 && Action != ActionDie){
       if ((abs(YSpeed) >= 0)
       && ((y > global.WaterSurfacePosition && PreviousY < global.WaterSurfacePosition)
       ^^  (y < global.WaterSurfacePosition && PreviousY > global.WaterSurfacePosition))){
           scr_create_dummy_effect(spr_water_splash, 0.25, x, global.WaterSurfacePosition-8, 1, -999996);
           PlaySound(SFX.snd_object_water_splash, global.SFXVolume, 1, 1);
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Platform Check Reset.
 // To prevent that the character bounces or loses collision on platforms, we create a 30 frames long timer.

   if((Ground == false || place_meeting(x, y, par_collision_platform) == false) && PlatformCheck == 1){
      if(PlatformCheckTimer > 0){
         PlatformCheckTimer -= 1;
      }else if(PlatformCheckTimer = 0){
               PlatformCheck      = false;
               PlatformCheckTimer = 30;
      }
   }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Flashlight Mode.
if instance_exists(obj_flashlight) && !instance_exists(obj_shield_flame){
size = 128;
draw_set_blend_mode(bm_subtract)
surface_set_target(light);
draw_ellipse_color(x-size/2-view_xview,y-size/2-view_yview,x+size/2-view_xview,y+size/2-view_yview,c_white,c_black,false)
surface_reset_target()
draw_set_blend_mode(bm_normal)
}
///Flashlight Mode.
if instance_exists(obj_flashlight) && instance_exists(obj_shield_flame){
size = 128;
draw_set_blend_mode(bm_subtract)
surface_set_target(light);
draw_ellipse_color(x-size/2-view_xview,y-size/2-view_yview,x+size/2-view_xview,y+size/2-view_yview,c_red,c_black,false)
surface_reset_target()
draw_set_blend_mode(bm_normal)
}
#define Collision_obj_player_jump
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(obj_tornado){
if control = true{
      if(!Ground){
          AirTimer += 1;
          if(AirTimer > 10) {
             AirTimer = 10;
          }
      }else if(Ground){
          AirTimer = 0;
          JumpHeightMod = true;
      }

      // Set a check variable we need for the next step. Otherwise we'd perform a full jump underwater even if we release the jump button.
         var JSCheck;
                if(PhysicMode == "Normal")     { JSCheck = -4 }
                if(CharacterID != CharacterKnuckles){
                   if(PhysicMode == "Underwater") { JSCheck = -3 }     
                }else{
                   if(PhysicMode == "Underwater") { JSCheck = -2 }    
                }          
                       
         if(Ground == true && !scr_character_collision_top(x, y-6, Angle, spr_mask_big) && LockTunnel == 0){
                                                       
             // Set X and Y Speed:
                GSpeed = XSpeed;             
                XSpeed =  (dcos(RelativeAngle) * GSpeed) - (dsin(RelativeAngle) * -JumpStrength);
                YSpeed = -(dsin(RelativeAngle) * GSpeed) - (dcos(RelativeAngle) * -JumpStrength);   
                        
             // Make sure to disable that we're grounded:
                Ground        = false;
                Angle         = 0;
                RelativeAngle = 0;

             // If we're rolling, enable the jump lock (which prevents us to change the direction and speed:
                if(Action = ActionRolling){
                   if(CharacterID != CharacterAmy){
                      JumpLock    = true;
                   }else{
                      AmyRollJump = true;
                   }
                }else{
                   JumpLock = false;
                }              
           
             // Finish the Jump by defining the current action...
                Action       = ActionJump;
              
             // Enable the shield usage while playing the jump sound.       
                ShieldUsable = true;
                if(CharacterID != CharacterAmy){
                   PlaySound(SFX.snd_character_jump, global.SFXVolume, 1, 1);  
                }else{
                   PlaySound(SFX.snd_character_jump, global.SFXVolume, 1.10, 1); 
                }
                          
             // Set the rendering speed of the animation
                RenderingSpeed = 1/max(5-abs(XSpeed), 1);//0.25+abs(GSpeed)/10;                
         }
         
}
         

}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Draw and Animate the character.

   // Draw the Character:
      if(InvTimer > 0 && Invincibility == 1){
         if((global.ObjectTime div 60) mod 3){
            if(TailSprite != noone){
               draw_sprite_ext(TailSprite, floor(TailFrame), floor(x+TailX), floor(y+TailY), TailDirection, 1, TailAngle, c_white, Alpha);
            }
            draw_sprite_ext(AnimationSprite, floor(AnimationFrame), floor(x+AnimationOffsetX), floor(y+AnimationOffsetY), AnimationDirection, 1, AnimationAngle, c_white, Alpha);
         }
      }else{
            if(TailSprite != noone){
               draw_sprite_ext(TailSprite, floor(TailFrame), floor(x+TailX), floor(y+TailY), TailDirection, 1, TailAngle, c_white, Alpha);
            }
            draw_sprite_ext(AnimationSprite, floor(AnimationFrame), floor(x+AnimationOffsetX), floor(y+AnimationOffsetY), AnimationDirection, 1, AnimationAngle, c_white, Alpha);
      }

   // Draw the Spindash Dust:
      if(Action = ActionSpindash or (Action = ActionPeelout && Animation = "PEELOUT")){
         draw_sprite_ext(spr_spindash_dust, current_time div 40, floor(x-AnimationDirection*7), floor(y+13), AnimationDirection, 1, 0, c_white, 1);
      }
