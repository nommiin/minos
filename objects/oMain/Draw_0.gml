// Board
draw_set_colour(c_black);
draw_rectangle(room_width / 2 - surface_get_width(mSurface) / 2, 32, room_width / 2 + surface_get_width(mSurface) / 2, 32 + surface_get_height(mSurface), true);
draw_set_colour(c_white);
draw_surface_ext(mSurface, ((room_width / 2) - (surface_get_width(mSurface) / 2)) + 1, 32 + 1, 1, 1, 0, c_black, 0.5);
draw_surface(mSurface, (room_width / 2) - (surface_get_width(mSurface) / 2), 32);

// Hold
if (mHeld != -1) {
	draw_set_colour(c_black);
	draw_rectangle((room_width / 2 - surface_get_width(mSurface) / 2) - (mSize * 5), 32, room_width / 2 - surface_get_width(mSurface) / 2, 32 + (mSize * 4), true);
	draw_set_colour(c_white);
	for(var i = 0; i < array_length_1d(mHeldPiece); i++) {
		var mPlace = mHeldPiece[i];
		minoDrawFree((room_width / 2 - surface_get_width(mSurface) / 2) + (mPlace[0] * mSize) - (mSize * 5), 32 + (mPlace[1] * mSize) + mSize, mSize, mHeld + 1);	
	}
}

//draw_text_color(2, 2, "Score: " + string(mScore) + "\nLines: " + string(mLines), c_black, c_black, c_black, c_black, 1);
//draw_text(4, 4, "mTick = " + string(mTick) + "\nmPaused = " + string(mPaused));
/*for(var yy = 0; yy < ds_grid_height(mBoard); yy++) {
	for(var xx = 0; xx < ds_grid_width(mBoard); xx++) {
		draw_line(	
	}
}*/