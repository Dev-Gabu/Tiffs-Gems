function get_inventory_position(_start, _position, _sprite) {
	
	var _inv_position = _start + (_position * sprite_get_width(_sprite) - sprite_get_width(_sprite))
	return _inv_position
	
}

function item_to_index(_rarity){
	if _rarity == "Comum"{
		index = 1
	}else if _rarity == "Incomum"{
		index = 2
	}else if _rarity == "Raro"{
		index = 3
	}else if _rarity == "Epico"{
		index = 4
	}else if _rarity == "Lendario"{
		index = 5
	}else 
		index = 0
		
	return index
}