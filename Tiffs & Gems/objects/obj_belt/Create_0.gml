if place_meeting(x,y-sprite_height,obj_belt) and place_meeting(x+sprite_width,y,obj_belt){ 
	sprite_index = spr_belt_c
	}
else if place_meeting(x,y-sprite_height,obj_belt) or place_meeting(x,y-sprite_height,obj_generator){ 
	sprite_index = spr_belt_v 
	}

