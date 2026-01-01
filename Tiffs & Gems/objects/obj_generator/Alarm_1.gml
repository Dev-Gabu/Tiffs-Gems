if global.ores_in_game < MAX_ore { 
	instance_create_depth(random_range(64,room_width-64),random_range(room_height/4,room_height-64),1,obj_ore)
	global.ores_in_game += 1
}

alarm[1] = random_range(60, 120)