// INVENTARIO

draw_sprite(spr_inventory,0,position_x,position_y)

for (var i = 0; i < obj_UI.inventory_slots; i++) {
    if (hotbar[i] != -1) {
        draw_sprite(spr_item,item_to_index(hotbar[i].rarity),get_inventory_position(position_x,i+1,spr_selection),position_y)
    }
}

draw_sprite(spr_selection,0,position_select,position_y)

// LOGS

var _log_1 = "$ " + string(global.money)

draw_set_font(fnt_log)
draw_text(32,32,_log_1)

// POSICIONAR

var _item = hotbar[selected - 1];

if (_item != -1) {
	
	if (_item.type == "ovo"){
			draw_sprite_ext(rarity_get_sprite(_item.rarity),1,clamp(mouse_x-16,32,room_width-64),clamp(mouse_y,room_height/3,room_height-32),image_xscale, image_yscale, image_angle, image_blend,0.3)}
	else if (_item.type == "gema"){
		draw_set_font(fnt_tags)
		draw_text_colour(mouse_x,mouse_y,"Vender por " + string(_item.value) + "$",c_yellow,c_yellow,c_orange,c_orange,1)
	}
}

// BESTIÁRIO

if (is_open){

	draw_set_alpha(0.8);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);

	for (var i = 0; i < array_length(species_keys); i++) {
	    var _key = species_keys[i];
	    var _data = variable_struct_get(global.species_list, _key);
	    var _discovered = variable_struct_get(global.discovered_species, _key);
    
	    var _row = i div grid_columns;
	    var _col = i mod grid_columns;
	    var _xx = start_x + (_col * item_spacing);
	    var _yy = start_y + (_row * item_spacing);
    
	    if (_discovered) {
	        draw_sprite_ext(_data.sprite, 0, _xx, _yy, 1, 1, 0, c_white, 1);
	        draw_set_halign(fa_center);
	        draw_text(_xx, _yy + 40, _data.name);
			draw_set_halign(fa_left)
	    } else {
	        draw_sprite_ext(_data.sprite, 0, _xx, _yy, 1, 1, 0, c_black, 1);
	        draw_set_halign(fa_center);
	        draw_text(_xx, _yy + 40, "???");
			draw_set_halign(fa_left)
	    }
	}
}