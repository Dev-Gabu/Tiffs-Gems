function init_gems(){
	global.gem_data = {
    comum:    new GemData("Gema de Quartzo", spr_quartz, 10),
	incomum:    new GemData("Gema de Ametista", spr_ametist, 25),
    raro:     new GemData("Gema de Safira", spr_saphire, 70),
	epico:     new GemData("Gema de Rubi", spr_ruby, 150),
    lendario: new GemData("Gema de Diamante", spr_diamond, 350)
	};
}

function GemData(_name, _sprite, _base_value) constructor {
    name = _name;
    sprite = _sprite;
    value = _base_value;
}

function create_gem(_name,_sprite,_value,_description) constructor {
    name = _name
	sprite_index = _sprite
	description = _description
	rarity = _name
	value = _value
	
    on_use = function() {
		global.money += value;
		show_debug_message("Vendida por: " + string(value));
    }
}