function init_eggs(){
	global.rarity_table = [
	    { tag: "Comum",    weight: 50 },
		{ tag: "Incomum",  weight: 25 },
	    { tag: "Raro",     weight: 15 },
	    { tag: "Epico",    weight: 8  },
	    { tag: "Lendario", weight: 2  } 
	];

	global.egg_pools = {
		commom_pool : [
			global.species_list.tiff_jawlie
			],
		uncommom_pool : [
			global.species_list.tiff_zipper
			],
		rare_pool : [
			global.species_list.tiff_leepie
			],
		epic_pool : [
			global.species_list.tiff_jummo
			],	
		legendary_pool : [
		    global.species_list.tiff_triboll
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

function hatch_creature() {

	
    var _species_stats = creature_pool[irandom(array_length(creature_pool) - 1)];

    var _creature = instance_create_layer(x, y, "Instances", obj_tiff);

    with(_creature) {
        name = _species_stats.name;
        sprite_index = _species_stats.sprite;
        move_speed = _species_stats.move_speed;
        luck = _species_stats.luck;
        gem_mult = _species_stats.gem_value_mult;
        
        //if (other.rarity == "Lendário") {
        //    move_speed *= 1.5;
        //    image_blend = c_gold;
        //}
    }
	//effect_create_above(ef_explosion, x, y, 1, c_white);
    instance_destroy();
}

function rarity_get_pool(_rarity_tag) {
    switch (_rarity_tag) {
        case "Comum":     return global.egg_pools.commom_pool;
        case "Incomum":   return global.egg_pools.uncommom_pool;
        case "Raro":      return global.egg_pools.rare_pool;
        case "Epico":     return global.egg_pools.epic_pool;
        case "Lendario":  return global.egg_pools.legendary_pool;
        default:          return global.egg_pools.commom_pool;
    }
}

function rarity_get_sprite(_rarity){
	
	switch(_rarity){
		case "Comum": return spr_egg_common;
		case "Incomum": return spr_egg_uncommon;
		case "Raro": return spr_egg_rare;
		case "Epico": return spr_egg_epic
		case "Lendario": return spr_egg_legendary
		default: return spr_egg
	}
}

function rarity_get_name(_rarity){
	
	switch(_rarity){
		case "Comum": return "Ovo Comum";
		case "Incomum": return "Ovo Incomum";
		case "Raro": return "Ovo Raro";
		case "Epico": return "Ovo Epico";
		case "Lendario": return "Ovo Lendario";
		default: return "Ovo Nulo"
	}
}

function rarity_get_description(_rarity){
	
	switch(_rarity){
		case "Comum": return "Um Ovo Comum";
		case "Incomum": return "Um Ovo Incomum";
		case "Raro": return "Um Ovo Raro";
		case "Epico": return "Um Ovo Epico";
		case "Lendario": return "Um Ovo Lendario";
		default: return "Descricao Nula";
	}
}

function rarity_get_hatch_time(_rarity){
	
	switch(_rarity){
		case "Comum": return 5;
		case "Incomum": return 15;
		case "Raro": return 25;
		case "Epico": return 40;
		case "Lendario": return 60;
		default: return 1
	}
}
function create_egg(_name,_description, _hatch_time, _pool, _rarity) constructor {
    name = _name;
	description = _description;
    hatch_time = _hatch_time;
    creature_pool = _pool; 
    rarity = _rarity;
    
    on_use = function() {
        var _inst = instance_create_layer(mouse_x-16, mouse_y, "Instances", obj_egg_hatching);
		_inst.nome = name
		_inst.description = description
        _inst.hatch_timer = hatch_time * 60;
		_inst.max_hatch_timer = hatch_time * 60;
        _inst.creature_pool = creature_pool;
        _inst.rarity = rarity;
		_inst.sprite_index = rarity_get_sprite(rarity)
    }
}