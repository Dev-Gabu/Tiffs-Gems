function init_tiffs(){
	
	global.species_list = {
    tiff_jawlie:	new TiffData("Jawlie", spr_tiff_jawlie, 2, 4, 1.0, 1),
    tiff_zipper:	new TiffData("Zipper", spr_tiff_zipper, 3, 3, 1.2, 2),
    tiff_jummo:		new TiffData("Jummo", spr_tiff_jummo, 4, 2.5, 3.0, 3),
	tiff_leepie:	new TiffData("Leepie", spr_tiff_leepie, 5, 1.5,  3.0, 4),
	tiff_triboll:	new TiffData("Triboll", spr_tiff_triboll, 5, 1, 3.0, 6),
	}	
}

function TiffData(_name, _sprite, _spd, _mnspd, _luck, _value) constructor {
    name = _name;
    sprite = _sprite;
    move_speed = _spd;
	mining_speed = _mnspd
    luck = _luck;
    gem_value_mult = _value;
}

