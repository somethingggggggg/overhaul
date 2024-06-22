/// Generate rain.
global.water_height = global.WaterSurfacePosition
    _yoff = global.water_height/sprite_get_height(spr_rain)
    for(_x=0; _x<room_width+sprite_get_width(spr_rain); _x+=sprite_get_width(spr_rain)){
        for(_ym=0; _ym<_yoff; _ym+=1){
        instance_create(_x, global.water_height-_ym*sprite_get_height(spr_rain), obj_rain)
        }
    }
