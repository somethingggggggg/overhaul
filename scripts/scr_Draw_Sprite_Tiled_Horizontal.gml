// ==== FUNCTION ====================================================================
// scr_Draw_Sprite_Tiled_Horizontal(sprite, image, x, y);
// ==================================================================================

    var SpriteStart, SpriteEnd, SpriteCurrent, SpriteStep;

    // Retrieve sprite properties
    SpriteStep  = sprite_get_width(argument0);
    SpriteStart = view_xview[view_current]+((argument2-view_xview[view_current]) mod SpriteStep)-SpriteStep;
    SpriteEnd   = view_xview[view_current]+view_wview[view_current]+SpriteStep;

    for (SpriteCurrent = SpriteStart; SpriteCurrent <= SpriteEnd; SpriteCurrent += SpriteStep)
        draw_sprite(argument0, argument1, SpriteCurrent, argument3);
