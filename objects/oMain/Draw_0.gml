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
	Render piece queue
*/
var mQueueSize = mSize / 1.5;
var qo = 0;//(mQueueSize * 4);

draw_set_colour(c_black);
for(var i = 0; i < mQueueCount; i++) {
	var qp = minoGetShape(mQueue[i]);
	
	var qx = bx - (mQueueSize * 4);
	var qy = by + (mSize * 4);
	
	
	
	draw_rectangle(qx, qy + qo, bx, (qy + qo) + (mQueueSize * 4), true);
	
	qx += (mQueueSize * 4) / 2;
	qy += (mQueueSize * 4) / 2;
	
	qx -= (minoWidth(qp) * mQueueSize) / 2;
	qy -= (minoHeight(qp) * mQueueSize) / 2;
	
	for(var j = 0; j < array_length_1d(qp); j++) {
		var qpl = qp[j];
		minoDraw(qx + (qpl[0] * mQueueSize), (qy + (qpl[1] * mQueueSize)) + qo, mQueueSize, mQueue[i] + 1);
	}
	
	qo += (mQueueSize * 4);
	
	/*
	var mQueuePiece = minoGetShape(mQueue[i]);
	for(var j = 0; j < array_length_1d(mQueuePiece); j++) {
		var mPlace = mQueuePiece[j];
		minoDraw(hx, hy + (mPlace[1] * mQueueSize), mQueueSize, mQueue[i] + 1);	
	}*/
}
draw_set_colour(c_white);

/*
	Render game information
*/
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);
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