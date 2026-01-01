if(obj_UI.is_open == false){

	var egg = new create_egg(
		rarity_get_name(rarity),
		rarity_get_description(rarity),
		rarity_get_hatch_time(rarity),
		rarity_get_pool(rarity),
		rarity);

	for (var i = 0; i < obj_UI.inventory_slots; i++) {
	    if (obj_UI.hotbar[i] == -1 and global.money >= cost) {
	        obj_UI.hotbar[i] = egg;
			instance_destroy(self)
			global.money -= cost
	        break;
	    }
	}
}