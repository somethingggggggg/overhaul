/// audio_initialize()
 // Loads sounds and music used in the game. This script should be used frames after the game has loaded to prevent crashes or freezes.
 // To play a sound effect, use: audio_play_sound(SFX.filename, volume, pitch, duplicate). Adding SFX. infront of the filename is IMPORTANT!
 // To play music, use audio_play_music(SFX.filename, volume, pitch);

 // Player Sounds:
    var sound_i;
    sound_i = 0;

    var sound_id;
    sound_id = file_find_first(working_directory+"\audio\SFX\*.wav", 0);

    var sound_id_name;
    sound_id_name = "";

    var sound_count;
    sound_count = 0;

    var sound_temp;
    sound_temp  = "";

    while not(sound_id == "")
    {
              soundTemp     = AudioAdd(working_directory+"\audio\SFX\"+string(sound_id));
              sound_id_name = string_replace_all(sound_id, ".wav", "");
              variable_local_set(sound_id_name, soundTemp);
              sound_id      = file_find_next();
    }

 // ########################################################################################################################## //

 // General Sounds:
    var sound_i;
    sound_i = 0;

    var sound_id;
    sound_id = file_find_first(working_directory+"\audio/SFX\*.wav", 0);

    var sound_id_name;
    sound_id_name = "";

    var sound_count;
    sound_count = 0;

    var sound_temp;
    sound_temp  = "";

    while not(sound_id == "")
    {
              soundTemp     = AudioAdd(working_directory+"\audio\SFX\"+string(sound_id));
              sound_id_name = string_replace_all(sound_id, ".wav", "");
              variable_local_set(sound_id_name, soundTemp);
              sound_id      = file_find_next();
    }

 // ########################################################################################################################## //

 // Shields:
    var sound_i;
    sound_i = 0;

    var sound_id;
    sound_id = file_find_first(working_directory+"\audio\SFX\*.wav", 0);

    var sound_id_name;
    sound_id_name = "";

    var sound_count;
    sound_count = 0;

    var sound_temp;
    sound_temp  = "";

    while not(sound_id == "")
    {
              soundTemp     = AudioAdd(working_directory+"\audio\SFX\"+string(sound_id));
              sound_id_name = string_replace_all(sound_id, ".wav", "");
              variable_local_set(sound_id_name, soundTemp);
              sound_id      = file_find_next();
    }

 // ########################################################################################################################## //

 // Jingles:
    var sound_i;
    sound_i = 0;

    var sound_id;
    sound_id = file_find_first(working_directory+"\audio\BGM\*.ogg", 0);

    var sound_id_name;
    sound_id_name = "";

    var sound_count;
    sound_count = 0;

    var sound_temp;
    sound_temp  = "";

    while not(sound_id == "")
    {
              soundTemp     = AudioAdd(working_directory+"\audio\BGM\"+string(sound_id));
              sound_id_name = string_replace_all(sound_id, ".ogg", "");
              variable_local_set(sound_id_name, soundTemp);
              sound_id      = file_find_next();
    }

 // ########################################################################################################################## //

 // Music:
    var sound_i;
    sound_i = 0;

    var sound_id;
    sound_id = file_find_first(working_directory+"\audio\BGM\*.ogg", 0);

    var sound_id_name;
    sound_id_name = "";

    var sound_count;
    sound_count = 0;

    var sound_temp;
    sound_temp  = "";

    while not(sound_id == "")
    {
              soundTemp     = AudioAdd(working_directory+"\audio\BGM\"+string(sound_id));
              sound_id_name = string_replace_all(sound_id, ".ogg", "");
              variable_local_set(sound_id_name, soundTemp);
              sound_id      = file_find_next();
    }

 // ########################################################################################################################## //
