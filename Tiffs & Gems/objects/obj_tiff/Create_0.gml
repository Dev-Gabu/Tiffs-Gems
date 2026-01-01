name = 0
move_speed = 0
mining_speed = 0;
luck = 0
gem_mult = 0
rarity = ""

x_point = x
y_point = y

enum TIFF_STATE {
	IDLE,
	WANDER,
	MINING_MOVE,
	MINING_ACTION,
	COLLECT_MOVE
}

state = TIFF_STATE.IDLE;
target_ore = noone;
target_gem = noone;
mining_timer = 0;
wait_timer = 0;

sell = false
