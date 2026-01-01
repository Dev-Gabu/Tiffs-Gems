depth = -y

if (sell){
	if(image_alpha > 0){
	image_alpha -= 0.1
	} else instance_destroy(self)
}

if mouse_x > x and mouse_x < x + sprite_width and
   mouse_y > y and mouse_y < y + sprite_height and keyboard_check_pressed(ord("S") and !sell) {
	   
	   var _valor = 0
	   
        switch(rarity){
			
			case "Comum" : _valor = 40;
				break;
			case "Incomum" : _valor = 120;
				break;
			case "Raro" : _valor = 250;
				break;
			case "Epico" : _valor = 800;
				break;
			case "Lendario" : _valor = 2000;
				break;
			case "Mitico" : _valor = 8000;
				break;
			default: _valor = 0;
		}
		
		
		global.money += _valor
		sell = true
		audio_play_sound(snd_sell_tiff,1,0)
}

switch (state) {
	
    case TIFF_STATE.IDLE:
	
        if(rarity == "Mitico"){
			var _nearest_gem = noone;
			var _dist_min = room_width;
			with(obj_gem) {
	            if (!is_targeted) {
	                var _d = point_distance(other.x, other.y, x, y);
	                if (_d < _dist_min) {
	                    _dist_min = _d;
	                    _nearest_gem = id;
				    }
				}
			}

	        if (_nearest_gem != noone) {
	            target_gem = _nearest_gem;
	            target_gem.is_targeted = true;
				target_gem.tiff = self
	            state = TIFF_STATE.COLLECT_MOVE;
	        } else {
				x_point = random_range(32,room_width-32)
				y_point = random_range(room_height/3,room_height-32)
				state = TIFF_STATE.WANDER;
				}
		} else {
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
				target_ore.tiff = self
	            state = TIFF_STATE.MINING_MOVE;
	        } else if (wait_timer <= 0) {
	            x_point = random_range(32, room_width - 32);
	            y_point = random_range(room_height / 3, room_height - 32);
	            state = TIFF_STATE.WANDER;
		        } else {
		            wait_timer--;
	        }
		}
		
    break;
	
	case TIFF_STATE.WANDER:
	    move_towards_point(x_point, y_point, move_speed/2);
    
	    if (point_distance(x, y, x_point, y_point) < move_speed/2) {
	        speed = 0;
	        x = x_point;
	        y = y_point;
        
	        wait_timer = irandom_range(60, 240); 
	        state = TIFF_STATE.IDLE;
	    }
	break;

	
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

		    if (_luck_roll > 110)      _gem_type = global.gem_data.lendario;
			else if (_luck_roll > 100) _gem_type = global.gem_data.epico;
		    else if (_luck_roll > 90) _gem_type = global.gem_data.raro;
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
		} else {
	                mining_timer = mining_speed * 60;
	            }
	        }
    break;
	
	    case TIFF_STATE.COLLECT_MOVE:
        if (!instance_exists(target_gem)) {
            state = TIFF_STATE.IDLE;
            exit;
        }

        move_towards_point(target_gem.x, target_gem.y, move_speed);

        if (point_distance(x, y, target_gem.x, target_gem.y) < move_speed + 2) {
            speed = 0;
            global.money += target_gem.final_value
			audio_play_sound(snd_pick_gem,1,0)
			instance_destroy(target_gem)
			target_gem = noone;
			state = TIFF_STATE.IDLE
        }
    break;
}

x = clamp(x,32,room_width-32)
y = clamp(y,room_height/4,room_height-32)