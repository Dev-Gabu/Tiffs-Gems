if keyboard_check_pressed(vk_right) or mouse_wheel_down() and obj_UI.is_open == false { selected += 1}
else if keyboard_check_pressed(vk_left) or mouse_wheel_up() and obj_UI.is_open == false { selected -= 1}

if(keyboard_check_pressed(ord("M"))){
	if (!mute){
		mute = true
		audio_pause_sound(snd_bg_music)
	}else{
		mute = false
		audio_play_sound(snd_bg_music,1,1)
	}	
}

if selected > 10 {
	selected = 1
} else if selected < 1 {
	selected = 10
}

position_select = get_inventory_position(position_x,selected,spr_selection)

var _item = hotbar[selected - 1];

if (_item != -1) {
	
	if (mouse_check_button_pressed(mb_right) and obj_UI.is_open == false) {
		_item.on_use();
		hotbar[selected - 1] = -1;
	}
}
