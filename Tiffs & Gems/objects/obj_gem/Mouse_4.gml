if(obj_UI.is_open == false){

	var _item_gem = new create_gem(gem_name, sprite_index, final_value, "Vale $" + string(final_value));

	var _added = false;

	for (var i = 0; i < obj_UI.inventory_slots; i++) {
	    if (obj_UI.hotbar[i] == -1) {
	        obj_UI.hotbar[i] = _item_gem;
	        _added = true;
	        break;
	    }
	}

	if (_added) {
	    instance_destroy();
		audio_play_sound(snd_pick_gem,1,0)
	}
}