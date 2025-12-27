if mouse_x > x and mouse_x < x + sprite_width and
   mouse_y > y - sprite_height/2 and mouse_y < y + sprite_height/2 {
        draw_sprite(spr_textbox,1,mouse_x,mouse_y)
		draw_set_font(fnt_tags)
		draw_text(mouse_x + 10, mouse_y + 10, nome)
		draw_set_font(fnt_descriptions)
		draw_text(mouse_x + 10, mouse_y + 20, description)
		draw_set_font(fnt_descriptions)
		draw_text(mouse_x + 10, mouse_y + 30, rarity)
		
		var _pct = (hatch_timer / max_hatch_timer);
		draw_healthbar(mouse_x + 15, mouse_y + 45, mouse_x + 115, mouse_y + 50, (1 - _pct) * 100, c_black, c_yellow, c_lime, 0, true, true);
		
}