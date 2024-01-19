// move
dir = keyboard_check(ord("D"))
esq = keyboard_check(ord("A"))
cima = keyboard_check(ord("W"))
baixo = keyboard_check(ord("S"))

hor_v = (dir-esq) * real_v

if place_meeting(x + hor_v ,y,obj_parede){
	while !place_meeting(x + sign(hor_v),y,obj_parede){
		x+= sign(hor_v);
	}
	hor_v = 0
}

x+= hor_v;

vert_v = (baixo -cima) * real_v;

if place_meeting(x,y + vert_v,obj_parede){
	while !place_meeting(x ,y+ sign(vert_v),obj_parede){
		y+= sign(vert_v);
	}
	vert_v = 0;
}
y+= vert_v;

// mudar sprites

dir = floor((point_direction(x,y,mouse_x,mouse_y)/90)+0.5);

if hor_v == 0 and vert_v == 0{
	switch dir {
		default:
			sprite_index = spr_personagem_parado_direita
		break;
		case 1:
			sprite_index = spr_personagem_parado_cima
		break;
		case 2:
			sprite_index = spr_personagem_parado_esquerda
		break;
		case 3:
			sprite_index = spr_personagem_parado_baixo
		break;
	}
}else{
		switch dir {
		default:
			sprite_index = spr_personagem_correndo_direita
		break;
		case 1:
			sprite_index = spr_personagem_correndo_cima
		break;
		case 2:
			sprite_index = spr_personagem_correndo_esquerda
		break;
		case 3:
			sprite_index = spr_personagem_correndo_baixo
		break;
	}
}
