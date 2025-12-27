var egg = new create_egg(
	rarity_get_name(rarity),
	rarity_get_description(rarity),
	rarity_get_hatch_time(rarity),
	rarity_get_pool(rarity),
	rarity);

for (var i = 0; i < obj_inventory.inventory_slots; i++) {
    if (obj_inventory.hotbar[i] == -1) {
        obj_inventory.hotbar[i] = egg;
		instance_destroy(self)
        break;
    }
}