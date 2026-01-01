if mouse_x > x and mouse_x < x + sprite_width and
   mouse_y > y and mouse_y < y + sprite_height and
   obj_UI.is_open == false{
        draw_sprite(spr_textbox,1,mouse_x,mouse_y)
		draw_set_font(fnt_tags)
		draw_text(mouse_x + 20, mouse_y + 20, " " + string(name) + "   [ " + string(rarity) + " ]")
		draw_set_font(fnt_descriptions)
		draw_text(mouse_x + 20, mouse_y + 40, "Velocidade: " +  string(move_speed))
		draw_set_font(fnt_descriptions)
		draw_text(mouse_x + 20, mouse_y + 60, "Mineracao: " +  string(mining_speed))
}