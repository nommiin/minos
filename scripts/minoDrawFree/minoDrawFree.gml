/// @function minoDrawFree( x, y, size, type )
/// @argument x - The horizontal position
/// @argument y - The vertical position
/// @argument size - The size of the mino
/// @argument type - The type of mino
var mPlace = [argument[0], argument[1]], mSize = argument[2], mType = argument[3];
draw_set_colour(c_black);
draw_rectangle(mPlace[0], mPlace[1], (mPlace[0] + mSize) - 1, (mPlace[1] + mSize) - 1, false);
var mColour = global.minoColours[mType - 1];
draw_rectangle_colour(mPlace[0] + 1, mPlace[1] + 1, ((mPlace[0] + mSize) - 1) - 1, ((mPlace[1] + mSize) - 1) - 1, mColour, mColour, merge_colour(mColour, c_white, 0.5), merge_colour(mColour, c_white, 0.5), false);