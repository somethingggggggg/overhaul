#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
    NumParallaxNodes                = 0;
    ParallaxNodes                   = -1;
    // ---- Constants declaration ------------------------------------------------
    constParallaxTileDirection      = 0;
    constParallaxBackground         = 1;

    constParallaxXFactor            = 2;
    constParallaxXSpeed             = 3;
    constParallaxXScroll            = 4;
    constParallaxXOffset            = 5;
    constParallaxXSeparation        = 6;

    constParallaxYFactor            = 7;
    constParallaxYSpeed             = 8;
    constParallaxYScroll            = 9;
    constParallaxYOffset            = 10;
    constParallaxYSeparation        = 11;

    constParallaxLeft               = 12;
    constParallaxTop                = 13;
    constParallaxWidth              = 14;
    constParallaxHeight             = 15;

    // ---- Parallax data --------------------------------------------------------
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    ds_grid_destroy(ParallaxNodes);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    var CurrentNode, xSpeed, xScroll, ySpeed, yScroll;
// -----------------------------------------------------------------------------------------------

    // Handle parallax
    for (CurrentNode = 0; CurrentNode < NumParallaxNodes; CurrentNode += 1) {
        // Retrieve values
        xSpeed  = ds_grid_get(ParallaxNodes, constParallaxXSpeed, CurrentNode);
        xScroll = ds_grid_get(ParallaxNodes, constParallaxXScroll, CurrentNode);
        ySpeed  = ds_grid_get(ParallaxNodes, constParallaxYSpeed, CurrentNode);
        yScroll = ds_grid_get(ParallaxNodes, constParallaxYScroll, CurrentNode);

        // Add speed values to scroll
        ds_grid_set(ParallaxNodes, constParallaxXScroll, CurrentNode, xScroll+xSpeed);
        ds_grid_set(ParallaxNodes, constParallaxYScroll, CurrentNode, yScroll+ySpeed);
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    var CurrentNode, Number, TileDirection, Background, xFactor, xSpeed, xScroll, xOffset, xSeparation;
    var yFactor, ySpeed, yScroll, yOffset, ySeparation, Left, Top, Width, Height, xFinal, yFinal;
// -----------------------------------------------------------------------------------------------

    // Handle parallax
    for (CurrentNode = 0; CurrentNode < NumParallaxNodes; CurrentNode += 1) {
        // Retrieve values
        TileDirection = ds_grid_get(ParallaxNodes, constParallaxTileDirection, CurrentNode);
        Background    = ds_grid_get(ParallaxNodes, constParallaxBackground,    CurrentNode);
        Number        = all

        xFactor       = ds_grid_get(ParallaxNodes, constParallaxXFactor,       CurrentNode);
        xSpeed        = ds_grid_get(ParallaxNodes, constParallaxXSpeed,        CurrentNode);
        xScroll       = ds_grid_get(ParallaxNodes, constParallaxXScroll,       CurrentNode);
        xOffset       = ds_grid_get(ParallaxNodes, constParallaxXOffset,       CurrentNode);
        xSeparation   = ds_grid_get(ParallaxNodes, constParallaxXSeparation,   CurrentNode);

        yFactor       = ds_grid_get(ParallaxNodes, constParallaxYFactor,       CurrentNode);
        ySpeed        = ds_grid_get(ParallaxNodes, constParallaxYSpeed,        CurrentNode);
        yScroll       = ds_grid_get(ParallaxNodes, constParallaxYScroll,       CurrentNode);
        yOffset       = ds_grid_get(ParallaxNodes, constParallaxYOffset,       CurrentNode);
        ySeparation   = ds_grid_get(ParallaxNodes, constParallaxYSeparation,   CurrentNode);

        Left          = ds_grid_get(ParallaxNodes, constParallaxLeft,          CurrentNode);
        Top           = ds_grid_get(ParallaxNodes, constParallaxTop,           CurrentNode);
        Width         = ds_grid_get(ParallaxNodes, constParallaxWidth,         CurrentNode);
        Height        = ds_grid_get(ParallaxNodes, constParallaxHeight,        CurrentNode);

        // Calculate final position
        xFinal = floor((view_xview[view_current])*xFactor+xOffset+xScroll);
        yFinal = floor((view_yview[view_current])*yFactor+yOffset+yScroll);

        // Draw
        switch(TileDirection) {
            case 0:
                draw_sprite_part(Background, Number, Left, Top, Width, Height, xFinal, yFinal);
                break;
            case 1:
                scr_Draw_Sprite_Tiled_Horizontal_Part(Background, Number, Left, Top, Width, Height, xFinal, yFinal, xSeparation);
                break;
            case 2:
                scr_Draw_Sprite_Tiled_Vertical_Part(Background , Number, Left, Top, Width, Height, xFinal, yFinal, ySeparation);
                break;
            case 3:
                scr_Draw_Sprite_Tiled_Part(Background, Number, Left, Top, Width, Height, xFinal, yFinal, xSeparation, ySeparation);
                break;
        }
    }
