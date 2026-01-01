function init_eggs(){
	global.rarity_table = [
	    { tag: "Comum",		weight: 50 },
		{ tag: "Incomum",	weight: 25 },
	    { tag: "Raro",		weight: 15 },
	    { tag: "Epico",		weight: 8  },
	    { tag: "Lendario",	weight: 2  },
		{ tag: "Mitico",	weight: 50  }
	];

	global.egg_pools = {
		commom_pool : [
			global.species_list.tiff_jawlie,
			global.species_list.tiff_bob,
			global.species_list.tiff_mono,
			],
		uncommom_pool : [
			global.species_list.tiff_zipper,
			global.species_list.tiff_elith,
			],
		rare_pool : [
			global.species_list.tiff_jummo,
			global.species_list.tiff_billus,
			],
		epic_pool : [
			global.species_list.tiff_leepie,
			global.species_list.tiff_badzzie,
			global.species_list.tiff_brutte,
			],	
		legendary_pool : [
		    global.species_list.tiff_triboll,
			global.species_list.tiff_hibou,
			global.species_list.tiff_lumiere,
			global.species_list.tiff_burnny,
			global.species_list.tiff_fool,
			
		],
		mitical_pool : [
			global.species_list.tiff_drillo,
			global.species_list.tiff_racnera,
			global.species_list.tiff_plennet,
		]
	}
}

function get_random_rarity() {
    var _total_weight = 0;
    
    for (var i = 0; i < array_length(global.rarity_table); i++) {
        _total_weight += global.rarity_table[i].weight;
    }

    var _rand = random(_total_weight);
    var _current_sum = 0;

    for (var i = 0; i < array_length(global.rarity_table); i++) {
        _current_sum += global.rarity_table[i].weight;
        if (_rand <= _current_sum) {
            return global.rarity_table[i].tag;
        }
    }
}

function hatch_creature(_rarity) {

	
    var _species_stats = creature_pool[irandom(array_length(creature_pool) - 1)];

    var _creature = instance_create_layer(x, y, "Instances", obj_tiff);

    with(_creature) {
        name = _species_stats.name;
        sprite_index = _species_stats.sprite;
        move_speed = _species_stats.move_speed;
		mining_speed = _species_stats.mining_speed
        luck = _species_stats.luck;
        gem_mult = _species_stats.gem_value_mult;
		rarity = _rarity
    }
	
	discover_specie(_creature.name)
	audio_play_sound(snd_egg_hatch,1,0)
	
    instance_destroy();
}

function rarity_get_cost(_rarity_tag) {
    switch (_rarity_tag) {
        case "Comum":     return 50;
        case "Incomum":   return 150;
        case "Raro":      return 400;
        case "Epico":     return 1000;
        case "Lendario":  return 3000;
		case "Mitico":	  return 10;
        default:          return 500;
    }
}

function rarity_get_pool(_rarity_tag) {
    switch (_rarity_tag) {
        case "Comum":		return global.egg_pools.commom_pool;
        case "Incomum":		return global.egg_pools.uncommom_pool;
        case "Raro":		return global.egg_pools.rare_pool;
        case "Epico":		return global.egg_pools.epic_pool;
        case "Lendario":	return global.egg_pools.legendary_pool;
		case "Mitico":		return global.egg_pools.mitical_pool;
        default:			return global.egg_pools.commom_pool;
    }
}

function rarity_get_sprite(_rarity){
	
	switch(_rarity){
		case "Comum":		return spr_egg_common;
		case "Incomum":		return spr_egg_uncommon;
		case "Raro":		return spr_egg_rare;
		case "Epico":		return spr_egg_epic
		case "Lendario":	return spr_egg_legendary
		case "Mitico":		return spr_egg_mitical
		default:			return spr_egg
	}
}

function rarity_get_name(_rarity){
	
	switch(_rarity){
		case "Comum":		return "Ovo Comum";
		case "Incomum":		return "Ovo Incomum";
		case "Raro":		return "Ovo Raro";
		case "Epico":		return "Ovo Epico";
		case "Lendario":	return "Ovo Lendario";
		case "Mitico":		return "Ovo Mitico";
		default:			return "Ovo Nulo"
	}
}

function rarity_get_description(_rarity){
	
	switch(_rarity){
		case "Comum":		return "Um Ovo Comum";
		case "Incomum":		return "Um Ovo Incomum";
		case "Raro":		return "Um Ovo Raro";
		case "Epico":		return "Um Ovo Epico";
		case "Lendario":	return "Um Ovo Lendario";
		case "Mitico":		return "Um Ovo Mitico";
		default:			return "Descricao Nula";
	}
}

function rarity_get_hatch_time(_rarity){
	
	switch(_rarity){
		case "Comum":		return 5;
		case "Incomum":		return 15;
		case "Raro":		return 25;
		case "Epico":		return 40;
		case "Lendario":	return 60;
		case "Mitico":		return 12;
		default:			return 1
	}
}
function create_egg(_name,_description, _hatch_time, _pool, _rarity) constructor {
    name = _name;
	type = "ovo"
	description = _description;
    hatch_time = _hatch_time;
    creature_pool = _pool; 
    rarity = _rarity;
    
    on_use = function() {
        var _inst = instance_create_layer(clamp(mouse_x-16,32,room_width-64),clamp(mouse_y,room_height/3,room_height-32), "Instances", obj_egg_hatching);
		audio_play_sound(snd_set_egg,1,0)
		_inst.nome = name
		_inst.description = description
        _inst.hatch_timer = hatch_time * 60;
		_inst.max_hatch_timer = hatch_time * 60;
        _inst.creature_pool = creature_pool;
        _inst.rarity = rarity;
		_inst.sprite_index = rarity_get_sprite(rarity)
    }
}