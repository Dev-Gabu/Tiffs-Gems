if(tiff == -1){
	tiff = instance_nearest(x,y,obj_tiff)
	tiff.target = self
	alarm[0] = 600
}else{
	tiff.target = -1
	tiff = instance_nearest(x,y,obj_tiff)
	tiff.target = self
	alarm[0] = 600
}