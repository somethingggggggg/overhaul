#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy after the last loop.
if(LoopTimes != 1){
   LoopTimes = LoopTimes - 1;
}
else { instance_destroy(); }
