if keyboard_check_pressed(vk_right) or mouse_wheel_down() { selected += 1}
else if keyboard_check_pressed(vk_left) or mouse_wheel_up() { selected -= 1}

if selected > 10 {
	selected = 1
} else if selected < 1 {
	selected = 10
}


position_select = get_inventory_position(position_x,selected,spr_selection)

var _item = hotbar[selected - 1];

if (_item != -1) {
	
	draw_sprite(rarity_get_sprite(_item.rarity),1,mouse_x,mouse_y)
	
	if (mouse_check_button_pressed(mb_right)) {
		_item.on_use();
		hotbar[selected - 1] = -1;
	}
}

