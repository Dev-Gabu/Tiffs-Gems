init_tiffs()
init_eggs()
init_gems()

// MUSICA

audio_play_sound(snd_bg_music,1,1)
mute = false

// INVENTÁRIO

position_x = room_width - sprite_get_width(spr_inventory) - 64
position_y = 32

inventory_slots = 10
global.money = 100

selected = 1
position_select = get_inventory_position(position_x,selected,spr_selection)

hotbar = array_create(inventory_slots,-1)


// BESTIÁRIO

is_open = false;
grid_columns = 5;
item_spacing = 100;
start_x = 200;
start_y = 200;

species_keys = variable_struct_get_names(global.species_list);