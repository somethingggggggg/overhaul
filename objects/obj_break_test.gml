#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Variables.

    pieces_hor  = 2;
    pieces_ver  = 2;
    pieces_xspd = 0;
    pieces_vspd = 0;
    pieces_dir  = 0;
    broken      = false;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create pieces.

    if(broken == true)
    {
       for(i=0; i<pieces_hor; i+=1)
       {
           for(j=0; j<pieces_ver; j+=1)
           {
               if(j == 0)
               {
                  pieces_xspd =  pieces_dir*(i+1*2);
                  pieces_yspd = -2;
               }
               if(j == 1 || j == 2)
               {
                  pieces_xspd =  pieces_dir*(i+1*3);
                  pieces_yspd =  0;
               }
               if(j == 3)
               {
                  pieces_xspd =  pieces_dir*(i+1*2);
                  pieces_yspd =  2;
               }
               with(instance_create(x+i*16, y+j*16, obj_break_test_piece))
               {
                    hspeed  = other.pieces_xspd;
                    vspeed  = other.pieces_yspd;
                    gravity = 0.21875
               }
           }
       }

    }
