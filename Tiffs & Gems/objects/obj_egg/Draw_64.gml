if mouse_x > x and mouse_x < x + sprite_width and
   mouse_y > y - sprite_height/2 and mouse_y < y + sprite_height/2 
   and obj_UI.is_open == false{
        draw_sprite(spr_textbox,1,mouse_x,mouse_y)
		draw_set_font(fnt_tags)
		draw_text(mouse_x + 20, mouse_y + 20, string("      Ovo "+ rarity))
		draw_set_font(fnt_tags)
		if (cost > global.money) draw_text_colour(mouse_x + 20, mouse_y + 40, "Custo: " + string(cost),c_red,c_red,c_red,c_red,1)
		else draw_text(mouse_x + 20, mouse_y + 40, "Custo: " + string(cost))
}