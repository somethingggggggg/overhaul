///Flicky_SaveConfiguration()
// Saves the configuration. (Game Settings, Controller, etc)

   ini_open("Flicky.ini"){
            // Main Settings:
               ini_write_real("Flicky Main",    "ScreenSize", global.ScreenSize);
               ini_write_real("Flicky Main",   "ScreenWidth", global.ScreenWidth);
               ini_write_real("Flicky Main",  "ScreenHeight", global.ScreenHeight);
               ini_write_real("Flicky Main", "ScreenShaders", global.Shaders);
               ini_write_real("Flicky Main",   "VolumeMusic", global.BGMVolume);
               ini_write_real("Flicky Main",   "VolumeSound", global.SFXVolume);

            // Keyboard Settings:
               ini_write_real("Flicky Keyboard",      "Up", global.Key_UP);
               ini_write_real("Flicky Keyboard",    "Down", global.Key_DOWN);
               ini_write_real("Flicky Keyboard",    "Left", global.Key_LEFT);
               ini_write_real("Flicky Keyboard",   "Right", global.Key_RIGHT);
               ini_write_real("Flicky Keyboard",  "Action", global.Key_ACTION);
               ini_write_real("Flicky Keyboard", "Special", global.Key_SPECIAL);
               ini_write_real("Flicky Keyboard",   "Enter", global.Key_ENTER);

   }
   ini_close();
