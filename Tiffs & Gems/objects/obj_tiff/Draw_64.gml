if mouse_x > x and mouse_x < x + sprite_width and
   mouse_y > y - sprite_height/2 and mouse_y < y + sprite_height/2 {
        draw_sprite(spr_textbox,1,mouse_x,mouse_y)
		draw_set_font(fnt_tags)
		draw_text(mouse_x + 20, mouse_y + 20, "      " + string(name))
		draw_set_font(fnt_descriptions)
		draw_text(mouse_x + 20, mouse_y + 40, "Velocidade: " +  string(move_speed))
		draw_set_font(fnt_descriptions)
		draw_text(mouse_x + 20, mouse_y + 60, "Mineracao: " +  string(mining_speed))
}