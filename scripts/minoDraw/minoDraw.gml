/// @function minoDraw( x, y, size, type )
/// @argument x - The horizontal position
/// @argument y - The vertical position
/// @argument size - The size of the mino
/// @argument type - The type of mino
minoDrawFree(argument[0] * argument[2], argument[1] * argument[2], argument[2], argument[3]);
/*
var mPlace = [argument[0], argument[1]], mSize = argument[2], mType = argument[3];
draw_set_colour(c_black);
draw_rectangle(mPlace[0] * mSize, mPlace[1] * mSize, ((mPlace[0] * mSize) + mSize) - 1, ((mPlace[1] * mSize) + mSize) - 1, false);
var mColour = global.minoColours[mType - 1];
draw_rectangle_colour((mPlace[0] * mSize) + 1, (mPlace[1] * mSize) + 1, (((mPlace[0] * mSize) + mSize) - 1) - 1, (((mPlace[1] * mSize) + mSize) - 1) - 1, mColour, merge_colour(mColour, c_white, 0.5), mColour, merge_colour(mColour, c_white, 0.5), false);