draw_rectangle_colour(32, 32, 32 + surface_get_width(mSurface), 32 + surface_get_height(mSurface), c_white, c_white, c_white, c_white, false);
draw_surface_ext(mSurface, 32 + 2, 32 + 2, 1, 1, 0, c_black, 0.5);
draw_surface(mSurface, 32, 32);

draw_text(2, 2, string(mPlaces))
//draw_text_color(2, 2, "Score: " + string(mScore) + "\nLines: " + string(mLines), c_black, c_black, c_black, c_black, 1);
//draw_text(4, 4, "mTick = " + string(mTick) + "\nmPaused = " + string(mPaused));
/*for(var yy = 0; yy < ds_grid_height(mBoard); yy++) {
	for(var xx = 0; xx < ds_grid_width(mBoard); xx++) {
		draw_line(	
	}
}*/