var _item_gem = new create_gem(gem_name, sprite_index, final_value, "Vale $" + string(final_value));

var _added = false;

for (var i = 0; i < obj_inventory.inventory_slots; i++) {
    if (obj_inventory.hotbar[i] == -1) {
        obj_inventory.hotbar[i] = _item_gem;
        _added = true;
        break;
    }
}

if (_added) {
    instance_destroy();
}