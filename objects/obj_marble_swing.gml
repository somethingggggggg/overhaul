#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Swing.

   Chains         = 6;                    // How many chains.
   ChainSprite    = spr_marble_chain;     // Sprite of each chain.
   ChainSpriteTop = spr_marble_chain_top; // Sprite of the top chain / chain handle.
   PlatformOffset = 10;                   // Character Offset. Usually 10 but might need tweaks for other platforms.

// Call Parent:
   event_inherited();
