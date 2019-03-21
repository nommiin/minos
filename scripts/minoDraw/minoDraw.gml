/// @description Draws a mino based on the size and type at the given position
/// @function minoDrawFree( x, y, size, type )
/// @argument {real} x - The horizontal position to draw at
/// @argument {real} y - The vertical position to draw at
/// @argument {real} size - The size of the mino
/// @argument {real} type - The type of mino
var mPlace = [argument[0], argument[1]], mSize = argument[2], mType = argument[3];
draw_set_colour(c_black);
draw_rectangle(mPlace[0], mPlace[1], (mPlace[0] + mSize) - 1, (mPlace[1] + mSize) - 1, false);
var mColour = global.minoColours[mType - 1];
draw_rectangle_colour(mPlace[0] + 1, mPlace[1] + 1, ((mPlace[0] + mSize) - 1) - 1, ((mPlace[1] + mSize) - 1) - 1, mColour, mColour, merge_colour(mColour, c_white, 0.5), merge_colour(mColour, c_white, 0.5), false);