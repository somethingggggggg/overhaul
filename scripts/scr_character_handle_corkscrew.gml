/// scr_character_handle_corkscrew()
 // Script to handle the corkscrew from STH2.

    if(Action == ActionCorkscrew || Action == ActionCorkscrewRoll)
    {
       // Find corkscrew:
          var cork_handle;
          cork_handle = scr_character_collision_object(x, y, par_corkscrew);

       // Perform Corkscrew move:
          if(abs(XSpeed) >= 4 && cork_handle != noone)
          {
             // Set relative position and angle.
                var relativeX, corkAngle;
                relativeX = x - cork_handle.x;
                corkAngle = degtorad((relativeX/384)*360);

             // Set y possition according to the relative position.
                 y = cork_handle.y + 26 + ( 1+cos(corkAngle) )*( 75*0.5 );

             // Change animation frame.
                if(Action == ActionCorkscrew)
                {
                if CharacterID = CharacterSonic{
                   Animation       = "ROTATION_1";
                   }
                   else{
                   Animation       = "ROLL";
                   }
                   AnimationFrame = 0+abs((radtodeg(corkAngle)/360*11)mod 12);
                }

             // Set ground flag.
                Ground = true;
          }
          else
          {
             // Revert back to normal state.
                if(Action == ActionCorkscrew)
                {
                   Action     = ActionNormal;
                }
                if(Action == ActionCorkscrewRoll)
                {
                   Action  = ActionRolling;
                   Animation = "WALK";
                }
          }
    }
    else
    {
       // Trigger corkscrew state.
          if(abs(XSpeed) >= 4 && Ground == true)
          {
             if(scr_character_collision_object(x, y, par_corkscrew) != noone)
             {
                if(Action != ActionRolling)
                {
                   Action  = ActionCorkscrew;
                }
                else
                {
                   Action  = ActionCorkscrewRoll;
                }
                Ground = false;
                scr_character_angle(0);
             }
          }
    }

 // Cork animation.
 if CharacterID = CharacterSonic{
    if(Animation == "ROTATION_1")
    {
       AnimationFrame += .05;
    }
    }
     if CharacterID != CharacterSonic{
    if(Animation == "ROLL")
    {
       AnimationFrame += .05;
    }
    }
