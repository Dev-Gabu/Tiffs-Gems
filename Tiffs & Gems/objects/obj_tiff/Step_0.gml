depth = -y

switch (state) {
    case TIFF_STATE.IDLE:
        var _nearest_ore = noone;
        var _dist_min = room_width;
        
        with(obj_ore) {
            if (!is_targeted) {
                var _d = point_distance(other.x, other.y, x, y);
                if (_d < _dist_min) {
                    _dist_min = _d;
                    _nearest_ore = id;
                }
            }
        }

        if (_nearest_ore != noone) {
            target_ore = _nearest_ore;
            target_ore.is_targeted = true;
            state = TIFF_STATE.MINING_MOVE;
        } else {
			alarm[0] = random_range(60,400)
        }
		
    break;
	
	case TIFF_STATE.WANDER:
	
	 move_towards_point(x_point, y_point,move_speed)
			if(point_distance(x, y, x_point, y_point) < move_speed){
				state = TIFF_STATE.IDLE
				speed = 0
				x = x_point
				y = y_point
			}

	
    case TIFF_STATE.MINING_MOVE:
        if (!instance_exists(target_ore)) {
            state = TIFF_STATE.IDLE;
            exit;
        }

        move_towards_point(target_ore.x, target_ore.y, move_speed);

        if (point_distance(x, y, target_ore.x, target_ore.y) < move_speed + 2) {
            speed = 0;
            state = TIFF_STATE.MINING_ACTION;
            mining_timer = mining_speed * 60;
        }
    break;

    case TIFF_STATE.MINING_ACTION:
        if (!instance_exists(target_ore)) {
            state = TIFF_STATE.IDLE;
            exit;
        }

        mining_timer--;
        if (mining_timer <= 0) {
            target_ore.image_index++;
            
		if (target_ore.image_index >= target_ore.image_number - 1) {
    
		    var _luck_roll = random(100) + (luck);
		    var _gem_type = global.gem_data.comum;

		    if (_luck_roll > 99)      _gem_type = global.gem_data.lendario;
			else if (_luck_roll > 95) _gem_type = global.gem_data.epico;
		    else if (_luck_roll > 80) _gem_type = global.gem_data.raro;
			else if (_luck_roll > 70) _gem_type = global.gem_data.incomum;

		    var _gem_inst = instance_create_layer(target_ore.x, target_ore.y, "Instances", obj_gem);
    
		    with(_gem_inst) {
		        sprite_index = _gem_type.sprite;
		        gem_name = _gem_type.name;
		        final_value = _gem_type.value * other.gem_mult; 
		    }

		    instance_destroy(target_ore);
			global.ores_in_game --
		    target_ore = noone;
		    state = TIFF_STATE.IDLE;
		    alarm[0] = 60;
		} else {
	                mining_timer = mining_speed * 60;
	            }
	        }
    break;
}

x = clamp(x,32,room_width-32)
y = clamp(y,room_height/4,room_height-32)