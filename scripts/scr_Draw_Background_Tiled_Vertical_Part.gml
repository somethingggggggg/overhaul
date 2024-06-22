// ==== FUNCTION ====================================================================
// scr_Draw_Background_Tiled_Vertical_Part(background, left, top, width, height, x, y);
// ==================================================================================

    var BackgroundStart, BackgroundEnd, BackgroundStep;

    // Retrieve background properties
    BackgroundStep  = argument4+argument7;
    BackgroundStart = view_yview[view_current]+((argument6-view_yview[view_current]) mod BackgroundStep)-BackgroundStep;
    BackgroundEnd   = view_yview[view_current]+view_hview[view_current]+BackgroundStep;

    while(BackgroundStart<BackgroundEnd) {
        draw_background_part(argument0, argument1, argument2, argument3, argument4, argument5, BackgroundStart);
        BackgroundStart += BackgroundStep;
    }
