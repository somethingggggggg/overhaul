///Flicky_LoadConfiguration()
// Loads the configuration. (Game Settings, Controller, etc)

   ini_open("Flicky.ini"){
            // Main Settings:
               global.ScreenSize   = ini_read_real("Flicky Main",    "ScreenSize", 1);
               global.ScreenWidth  = ini_read_real("Flicky Main",   "ScreenWidth", global.ScreenWidth);
               global.ScreenHeight = ini_read_real("Flicky Main",  "ScreenHeight", global.ScreenHeight);
               global.Shaders      = ini_read_real("Flicky Main", "ScreenShaders", 1);
               global.MaxBGMV      = ini_read_real("Flicky Main",   "VolumeMusic", 1);
               global.BGMVolume    = ini_read_real("Flicky Main",   "VolumeMusic", 1);
               global.MaxSFXV      = ini_read_real("Flicky Main",   "VolumeSound", 1);
               global.SFXVolume    = ini_read_real("Flicky Main",   "VolumeSound", 1);

            // Keyboard Settings:
               global.Key_UP       = ini_read_real("Flicky Keyboard",      "Up", vk_up);
               global.Key_DOWN     = ini_read_real("Flicky Keyboard",    "Down", vk_down);
               global.Key_LEFT     = ini_read_real("Flicky Keyboard",    "Left", vk_left);
               global.Key_RIGHT    = ini_read_real("Flicky Keyboard",   "Right", vk_right);
               global.Key_ACTION   = ini_read_real("Flicky Keyboard",  "Action", ord("Z"));
               global.Key_SPECIAL  = ini_read_real("Flicky Keyboard", "Special", ord("X"));
               global.Key_ENTER    = ini_read_real("Flicky Keyboard",   "Enter", vk_enter);
   }
   ini_close();
