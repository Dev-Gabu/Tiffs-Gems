if mouse_x > x and mouse_x < x + sprite_width and
   mouse_y > y - sprite_height/2 and mouse_y < y + sprite_height/2 {
        draw_sprite(spr_textbox,1,mouse_x,mouse_y)
		draw_set_font(fnt_tags)
		draw_text(mouse_x + 20, mouse_y + 20, "      " + string(nome))
		draw_set_font(fnt_descriptions)
		draw_text(mouse_x + 20, mouse_y + 40, description)
		draw_set_font(fnt_descriptions)
		draw_text(mouse_x + 20, mouse_y + 60, rarity)
		
		var _pct = (hatch_timer / max_hatch_timer);
		draw_healthbar(mouse_x + 30, mouse_y + 90, mouse_x + 230, mouse_y + 100, (1 - _pct) * 200, c_black, c_yellow, c_lime, 0, true, true);
		
}