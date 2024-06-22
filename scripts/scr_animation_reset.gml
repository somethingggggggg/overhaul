///scr_animation_reset();
// Reset. various variables we need in order to play a animation:

   Animation              = "IDLE";          // Character's animation. This is the one you have to change.
   AnimationSprite        = spr_mask_dot;    // The Sprite the animation uses. 
   AnimationPrevious      = "";               // Checks if the animation has changed.
   AnimationOffsetX       = 0;               // To adjust the X position of a animation.
   AnimationOffsetY       = 0;               // To adjust the Y position of a animation.

// Character Specific:
   TailSprite    = spr_miles_tail_1; // Used to draw Miles tail.
   TailX         = 0;                // Used to set the position of the tail.
   TailY         = 0;                // Used to set the position of the tail.
   TailAngle     = 0;                // Used to change the tail angle.
