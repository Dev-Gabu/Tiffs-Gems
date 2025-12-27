depth = -y

if (target != -1){
	x_point = target.x 
	y_point = target.y
}

if(is_moving){
	move_towards_point(x_point, y_point,move_speed)
	if(point_distance(x, y, x_point, y_point) < move_speed){
		is_moving = false
		speed = 0
		x = x_point
		y = y_point
		alarm[0] = random_range(60,600)
	}
}