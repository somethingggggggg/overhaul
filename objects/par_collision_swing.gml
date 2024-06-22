#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    ChainSize = sprite_get_height(ChainSprite); // Size of the Chain.
    AngleVal  = 270;
    AngleMov  = AngleVal;                       // How much the swing moves.
    _X        = x;                              // X used for chains.
    _Y        = y-(ChainSize*Chains);           // Y used for chains.
    AngleSpd  = 3;                              // How fast the platform swings.
    XPrevious = x;                              // Previous X position.
    XRelative = x;                              // Relative X Position.
    YRelative = y;                              // Relative Y Position.
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Swing Movement.
    var Temp;
    Temp = AngleMov+AngleSpd;
    AngleMov = scr_character_wrap_angle(Temp);

    if(AngleMov > AngleVal){
       AngleSpd -= 0.051;
    }
    if(AngleMov < AngleVal){
       AngleSpd += 0.051;
    }
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Swing & Handle Character.
    var player_main, i, Var_Cos, Var_Sin, XPrevious;
    XPrevious = x;

//  Set Cos/Sin:
    Var_Cos = (cos(degtorad(AngleMov))*ChainSize);
    Var_Sin = (sin(degtorad(AngleMov))*ChainSize);

//  Set the X/Y Position:
    x = floor(XRelative+Var_Cos);
    y = floor(YRelative-Var_Sin);

//  Change the X/Y Position of the Player:
    i = 0;
    repeat(instance_number(par_character)){
           CharacterMain = par_character;
           if(instance_exists(CharacterMain) == false && CharacterMain != noone){
              i+=1;
              continue;
           }
           if((CharacterMain.Ground == true && CharacterMain.Action != ActionDie) && (CharacterMain.OnSwing = id)){
               CharacterMain.x += (x-XPrevious);
               CharacterMain.y  = ((y-sprite_yoffset)-PlatformOffset);
           }
           i+=1;
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Chains and platform.

    draw_sprite(ChainSpriteTop, 0, _X, _Y);
    XRelative = _X;
    YRelative = _Y;
    repeat(Chains-1){
           XRelative = XRelative+(cos(degtorad(AngleMov))*ChainSize);
           YRelative = YRelative-(sin(degtorad(AngleMov))*ChainSize);
           draw_sprite(ChainSprite, 0, floor(XRelative), floor(YRelative));
    }

// Draw Platform:
   draw_sprite(sprite_index, 0, floor(x), floor(y));
