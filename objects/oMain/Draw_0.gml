/*
	Render game board
*/
var bx = (room_width / 2) - (surface_get_width(mSurface) / 2), by = (room_height / 2) - (surface_get_height(mSurface) / 2);
draw_set_colour(c_black);
draw_rectangle(bx, by, bx + surface_get_width(mSurface), by + surface_get_height(mSurface), true);
draw_set_colour(c_white);
draw_surface_ext(mSurface, bx, by, 1, 1, 0, c_black, 0.5);
draw_surface(mSurface, bx, by);

/*
	Render held piece
*/
var hx = bx - (mSize * 4), hy = by;
draw_set_colour(c_black);
draw_rectangle(hx, by, bx, hy + (mSize * 4), true);
draw_set_colour(c_white);

if (mHeld != -1) {
	hx += ((mSize * 4) / 2) - ((minoWidth(mHeldPiece) * mSize) / 2);
	hy += ((mSize * 4) / 2) - ((minoHeight(mHeldPiece) * mSize) / 2);
	for(var i = 0; i < array_length_1d(mHeldPiece); i++) {
		var mPlace = mHeldPiece[i];
		minoDraw(hx + (mPlace[0] * mSize), hy + (mPlace[1] * mSize), mSize, mHeld + 1);	
	}
}

/*
	Render game information
*/
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text((bx + surface_get_width(mSurface)) + 4, by, "Score: " + string(mScore) + "\nLines: " + string(mLines) + "\nLevel: " + string(floor(mLines / 10) + 1));

/*
	Render pause state
*/
if (mPaused == true) {
	draw_set_alpha(0.25);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_colour(room_width / 2, room_height / 2, "Game Paused", c_white, c_white, c_white, c_white, 1);
}