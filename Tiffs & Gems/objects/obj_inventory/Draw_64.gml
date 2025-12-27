// INVENTARIO

draw_sprite(spr_inventory,0,position_x,position_y)
draw_sprite(spr_selection,0,position_select,position_y)

for (var i = 0; i < obj_inventory.inventory_slots; i++) {
    if (hotbar[i] != -1) {
        draw_sprite(spr_item,item_to_index(hotbar[i].rarity),get_inventory_position(position_x,i+1,spr_selection),position_y)
    }
}

// LOGS

var _log_1 = ""
var _log_2 = ""

draw_set_font(fnt_log)
draw_text(32,32,_log_1)
draw_text(32,64,_log_2)

// POSICIONAR

var _item = hotbar[selected - 1];

if (_item != -1) {
	draw_sprite_ext(rarity_get_sprite(_item.rarity),1,mouse_x-16,mouse_y,image_xscale, image_yscale, image_angle, image_blend,0.3)
}
