/// @function minoCreate( board, piece, x, y )
/// @argument board - A ds_map containing all minos
/// @argument piece - The piece to create
/// @argument x - The horizontal position of the piece
/// @argument y - The vertical position of the piece
/// @returns - The places of the newly create piece
var mBoard = argument[0], mPlaces = minoGetShape(argument[1]), mHorizontal = argument[2], mVertical = argument[3];
for(var i = 0; i < array_length_1d(mPlaces); i++) {
	var mPlace = mPlaces[i];
	mPlace[@ 0] += mHorizontal;
	mPlace[@ 1] += mVertical;
	mBoard[# mPlace[0], mPlace[1]] = argument[1] + 1;
}
return mPlaces;
enum minoType {
	I,
	O,
	T,
	S,
	Z,
	J,
	L,
	COUNT
}