/// @description 
hp --;

if (hp <= 0) {
	instance_create_layer(x, y, layer, oExplosion);
	instance_destroy();
}