function init_tiffs(){
	
	global.species_list = {
		
	// Comum
    tiff_jawlie:	new TiffData(	"Jawlie",	spr_tiff_jawlie,	2,		4,		1,		1	),
	tiff_bob:		new TiffData(	"Bob",		spr_tiff_bob,		2,		4,		1,		1	),
	tiff_mono:		new TiffData(	"Mono",		spr_tiff_mono,		2,		4,		1,		1	),
	
	// Incomum
    tiff_zipper:	new TiffData(	"Zipper",	spr_tiff_zipper,	3,		3,		5,		1.2	),
	tiff_elith:		new TiffData(	"Elith",	spr_tiff_elith,		3,		3,		5,		1.2	),
	
	// Raro
    tiff_jummo:		new TiffData(	"Jummo",	spr_tiff_jummo,		4,		2.5,	10,		1.5	),
	tiff_billus:	new TiffData(	"Billus",	spr_tiff_billus,	4,		2.5,	10,		1.5	),
	
	// Epico
	tiff_leepie:	new TiffData(	"Leepie",	spr_tiff_leepie,	5,		1.5,	20,		1.7	),
	tiff_badzzie:	new TiffData(	"Badzzie",	spr_tiff_badzzie,	5,		1.5,	20,		1.7	),
	tiff_brutte:	new TiffData(	"Brutte",	spr_tiff_brutte,	5,		1.5,	20,		1.7	),
	
	// Lendario
	tiff_triboll:	new TiffData(	"Triboll",	spr_tiff_triboll,	5,		1,		30,		2	),
	tiff_hibou:		new TiffData(	"Hibou",	spr_tiff_hibou,		5,		1,		30,		2	),
	tiff_lumiere:	new TiffData(	"Lumiere",	spr_tiff_lumiere,	5,		1,		30,		2	),
	tiff_burnny:	new TiffData(	"Burnny",	spr_tiff_burnny,	5,		1,		30,		2	),
	tiff_fool:		new TiffData(	"Fool",		spr_tiff_fool,		5,		1,		30,		2	),
	
	// Mitico
	tiff_drillo:	new TiffData(	"Drillo",	spr_tiff_drillo,	3,		1,		0,		1	),
	tiff_racnera:	new TiffData(	"Racnera",	spr_tiff_racnera,	3,		1,		0,		1	),
	tiff_plennet:	new TiffData(	"Plennet",	spr_tiff_plennet,	3,		1,		0,		1	),
	
	}	
	
	global.discovered_species = {
        // Comum
    tiff_jawlie:	false,
	tiff_bob:		false,
	tiff_mono:		false,
	
	// Incomum
    tiff_zipper:	false,
	tiff_elith:		false,
	
	// Raro
    tiff_jummo:		false,
	tiff_billus:	false,
	
	// Epico
	tiff_leepie:	false,
	tiff_badzzie:	false,
	tiff_brutte:	false,
	
	// Lendario
	tiff_triboll:	false,
	tiff_hibou:		false,
	tiff_lumiere:	false,
	tiff_burnny:	false,
	tiff_fool:		false,
	
	// Epico
	tiff_drillo:	false,
	tiff_racnera:	false,
	tiff_plennet:	false,
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

function discover_specie(_name) {
    var _id = "tiff_" + string_lower(_name);
    
    if (variable_struct_get(global.discovered_species, _id) == false) {
        variable_struct_set(global.discovered_species, _id, true);
    }
}
