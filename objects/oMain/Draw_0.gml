// Board
var bx = (room_width / 2) - (surface_get_width(mSurface) / 2), by = (room_height / 2) - (surface_get_height(mSurface) / 2);
draw_set_colour(c_black);
draw_rectangle(bx, by, bx + surface_get_width(mSurface), by + surface_get_height(mSurface), true);
draw_set_colour(c_white);
draw_surface_ext(mSurface, bx, by, 1, 1, 0, c_black, 0.5);
draw_surface(mSurface, bx, by);

// Hold
if (mHeld != -1) {
	var hx = bx - (mSize * 4), hy = by;
	var pw = (minoWidth(mHeldPiece) * mSize), ph = (minoHeight(mHeldPiece) * mSize);
	draw_set_colour(c_black);
	draw_rectangle(hx, by, bx, hy + (mSize * 4), true);
	draw_set_colour(c_white);
	
	
	
	//draw_rectangle(hx, hy, hx + (, by + (mSize * 4), true);
	
	hx += (mSize * 4) / 2;
	hx -= (pw / 2);
	
	hy += (mSize * 4) / 2;
	hy -= (ph / 2);
	for(var i = 0; i < array_length_1d(mHeldPiece); i++) {
		var mPlace = mHeldPiece[i];
		minoDrawFree(hx + (mPlace[0] * mSize), hy + (mPlace[1] * mSize), mSize, mHeld + 1);	
	}
}

// Text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text((bx + surface_get_width(mSurface)) + 4, by, "Score: " + string(mScore) + "\nLines: " + string(mLines) + "\nLevel: " + string(floor(mLines / 10) + 1));

//draw_text_color(2, 2, "Score: " + string(mScore) + "\nLines: " + string(mLines), c_black, c_black, c_black, c_black, 1);
//draw_text(4, 4, "mTick = " + string(mTick) + "\nmPaused = " + string(mPaused));
/*for(var yy = 0; yy < ds_grid_height(mBoard); yy++) {
	for(var xx = 0; xx < ds_grid_width(mBoard); xx++) {
		draw_line(	
	}
}*/