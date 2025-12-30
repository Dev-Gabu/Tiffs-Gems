name = 0
move_speed = 0
mining_speed = 0;
luck = 0
gem_mult = 0

x_point = x
y_point = y
alarm[0] = 60

enum TIFF_STATE {
    IDLE,
    WANDER,
    MINING_MOVE,
    MINING_ACTION
}

state = TIFF_STATE.IDLE;
target_ore = noone;
mining_timer = 0;
