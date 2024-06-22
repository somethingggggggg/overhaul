/// scr_character_handle_bar()
 // Script for bars.

 /// ------------------------ VERTICAL

 var vbar;
 vbar = instance_place(x,y,obj_bar_vertical)

 if vbar && Ground == false && bar_timer_wait = 0 && (Action == ActionSpring or Action == ActionNormal or Action == ActionJump){
 Action = ActionBarV;
 var (barobj) = vbar;

 YSpeed = 0;
 bartimer = 60;
 }


 if Action = ActionBarV{
 x = barobj.x+10;
 y = barobj.y;
 XSpeed = 0;
 YSpeed = 0;

 if AnimationFrame == 0{
 depth = 2;
 }else{
 depth = 0;
 }

 if bartimer>0{
 bartimer-=1;
 }

 if (KeyAction == true  && bartimer<30) or bartimer == 0{
 if AnimationFrame <= 1{
 bar_timer_wait = 10;
 YSpeed = -7.5
 Action = ActionSpring;
 }
 if AnimationFrame > 1{
 bar_timer_wait = 10;
 YSpeed = 7.5
 }
 }



 }

 /// ------ HORIZONTAL

 var hbar;
 hbar = instance_place(x,y,obj_bar_horizontal)

 if hbar && bar_timer_wait = 0 && abs(XSpeed)>4 && (Action != ActionBarH && Action != ActionDie){
 Action = ActionBarH;
 Ground = false;
 var (barobj) = hbar;
 XSpeed = 0;
 bartimer = 50;
 }


 if Action = ActionBarH{
 x = barobj.x-3;
 y = barobj.y-10;
 XSpeed = 0;
 YSpeed = 0;

 if AnimationFrame == 0{
 depth = 2;
 }else{
 depth = 0;
 }

 if bartimer>0{
 bartimer-=1;
 }

 if (KeyAction == true && bartimer<30) or bartimer == 0{
 Action = ActionNormal;
  if AnimationFrame <= 1{
 bar_timer_wait = 10;
 XSpeed = -7.5
 Action = ActionNormal;
 }
 if AnimationFrame > 1{
 bar_timer_wait = 10;
 XSpeed = 7.5
 Action = ActionNormal;
 }
 }



 }



 /// -------------- misc

 if bar_timer_wait>0{
 bar_timer_wait-=1;
 }
 if CharacterID = CharacterSonic{
  if(Action == ActionBarV && Animation != "BAR_V")
              {
                 Animation = "BAR_V";
              }
              if(Action == ActionBarH && Animation != "BAR_H")
              {
                 Animation = "BAR_H";
              }
              }
   if CharacterID != CharacterSonic{
  if(Action == ActionBarV && Animation != "ROLL")
              {
                 Animation = "ROLL";
              }

              if(Action == ActionBarH && Animation != "ROLL")
              {
                 Animation = "ROLL";
              }
              }
