/// @description Create the puzzle pieces and update grid position
// Individual pieces are responsible for their own logic and drawing
var g = global.grid;

for (var i = 0; i < ds_grid_width(g); i++){
	for (var j = 0; j < ds_grid_height(g); j++){
		switch(ds_grid_get(g, i, j)){
			#region // Fire
			case 1: 
				draw_sprite_ext(sFire,  0,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			case 11: 
				draw_sprite_ext(sFire,  1,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			case 21: 
				image_speed = 0.5;
				draw_sprite_ext(sFireBurst, image_index,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			#endregion
			
			#region // Water
			case 2:
				draw_sprite_ext(sWater,  0,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			case 12:
				draw_sprite_ext(sWater,  1,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			case 22:
				image_speed = 0.5;
				draw_sprite_ext(sWaterSplit, image_index,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			#endregion
			
			#region // Leaf
			case 3:
				draw_sprite_ext(sLeaf,  0,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			case 13:
				draw_sprite_ext(sLeaf,  1,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			case 23:
				image_speed = 0.5;
				draw_sprite_ext(sVineEat, image_index,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			#endregion
			
			#region // Bolt
			case 4:
				draw_sprite_ext(sBolt,  0,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			case 14:
				draw_sprite_ext(sBolt,  1,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			case 24:
				draw_sprite_ext(sBolt, 1,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
				var r = choose(0, 1);
				draw_sprite_ext(sBoltStrike,  r,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			#endregion
			
			#region // Potion
			case 5:
				image_speed = 0.4;
				draw_sprite_ext(sPotionItem,  image_index,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			
			case 15:
				draw_sprite_ext(sPotionItemWhite,  0,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			#endregion
			
			#region // Shuffle
			case 6:
				image_speed = 0.4;
				draw_sprite_ext(sShuffleItem,  image_index,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			case 16:
				draw_sprite_ext(sShuffleItemWhite,  0,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			#endregion
			
			#region // Bottle
			case 7:
				image_speed = 0.4;
				draw_sprite_ext(sBottleItem,  image_index,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			case 17:
				draw_sprite_ext(sBottleItemWhite,  0,
					GridToWorld(i, "x"), GridToWorld(j, "y"),
					1, 1, 0, c_white, 1);
			break;
			#endregion
		}
	}
}