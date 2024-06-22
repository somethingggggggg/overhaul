#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set Font and Text.
    Credit_Font      = global.Font_Credits;
    Credit_Alpha     = 1;
    Credit_Fade      = false;

//  Set Text.
    String_Number      = 0;
    END                = 16;
    Credit_String[0]   = "FLICKY ENGINE##CREATED BY F4LK##2016 - 2017##ANB AND FRIENDS##2018##GM8.X PORTED##BY JOHN-KUN 2019##";
    Credit_String[1]   = "BASED ON THE##360 MOVEMENT ENGINE##BY DAMIZEAN##GMATE BY F4LK";
    Credit_String[2]   = "ASSISTANCE AND##ACCURACY##TRUEPOWEROFTEAMWORK##MR POTATOBADGER##MR LANGE";
    Credit_String[3]   = "ASSISTANCE AND##ACCURACY##AEROGP - VECTORSATYR##THEVALEEV##HOBBERS";
    Credit_String[4]   = "ASSISTANCE AND##ACCURACY##NOAH COPELAND##POLAR STAR##SONIC RETRO GUIDE";
    Credit_String[5]   = "SOME SCRIPTS WERE##PROVIDED BY##TPOT##AEROGP";
    Credit_String[6]   = "SPRITES##SEGA##THE SPRITERS RESOURCE##AY JAY";
    Credit_String[7]   = "MUSIC AND SOUNDS##SEGA##MICHAEL STAPLE##SONIC 3 COMPLETE##MR LANGE";
    Credit_String[8]   = "BETA TESTERS##CG##CASANOVA##DASHBOY##FCHAR##SWAG63";
    Credit_String[9]   = "BETA TESTERS##POLAR STAR##ASHURATH##CAPPER##DOLPHMAN##DRLUIGI";
    Credit_String[10]  = "BETA TESTERS##THEGOKU7729##GEONEO##HYPERSONIC##SUPER TAILS##SWIFT";
    Credit_String[11]  = "BETA TESTERS##ILLIAS3000##LILAC##MICHAEL STAPLE##MTTHWBARAJAS";
    Credit_String[12]  = "BETA TESTERS##NOAH COPELAND##PVIC##QUINTINPLAYS##SAVORDEZ";
    Credit_String[13]  = "BETA TESTERS##STARZOR##SPEED##STARTURBO##TEX##VOLTRIX";
    Credit_String[14]  = "PAST BETA TESTERS##MR LANGE##TRUEPOWEROFTEAMWORK##AEROGP";
    Credit_String[15]  = "PAST BETA TESTERS##THEVALEEV##HOBBERS##AY JAY##MR POTATOBADGER";
    Credit_String[END] = "";

//  Start Going through the text.
    alarm[0] = 180;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Load Next String/Fade out.
    if(Credit_Fade == false){
       Credit_Fade  = true;
    }else{
       Credit_Fade  = false;
       String_Number+=1
       if(String_Number == END){
          alarm[1] = 120;
          obj_audio_manager.DeadFade = true;
       }else{
          alarm[0] = 180;
       }
    }
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Restart.
    StopSound_All();
    room_goto(rm_flicky_intro);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade.

    if(Credit_Fade == true && Credit_Alpha != 0){
       Credit_Alpha -= 0.05;
    }else if(Credit_Fade == false && Credit_Alpha != 1){
       Credit_Alpha += 0.05;
    }

    if(Credit_Fade == true && Credit_Alpha == 0){
       if(alarm[0] == -1){
          alarm[0]  = 30;
       }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Skip.

    if(keyboard_check(global.Key_ENTER)){
       alarm[1] = 1;
    }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw the Credits.
    draw_set_alpha(Credit_Alpha);
    draw_set_font(Credit_Font);
    draw_set_color(c_white);

    draw_set_halign(fa_center);
    draw_set_valign(fa_center);
    if(String_Number != END){
       draw_text(global.ScreenWidth/2, global.ScreenHeight/2, Credit_String[String_Number]);
    }
    draw_set_halign(-1);
    draw_set_valign(-1);
