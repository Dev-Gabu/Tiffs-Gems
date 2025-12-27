if ores_in_game < MAX_ore { 
	instance_create_depth(random_range(32,room_width-32),random_range(room_height/4,room_height-32),1,obj_ore)
	ores_in_game += 1
}

alarm[1] = random_range(60, 600)