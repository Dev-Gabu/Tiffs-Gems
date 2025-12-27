position_x = room_width - sprite_get_width(spr_inventory) - 64
position_y = 32

inventory_slots = 10

selected = 1
position_select = get_inventory_position(position_x,selected,spr_selection)

hotbar = array_create(inventory_slots,-1)

init_tiffs()
init_eggs()