/// @description Creates a piece and stores it's data in the board then returns it's places
/// @function minoCreate(board, piece, x, y)
/// @argument {ds_grid} board - A grid containing all minos
/// @argument {real} piece - The piece index to create
/// @argument {real} x - The horizontal position of the piece
/// @argument {real} y - The vertical position of the piece
/// @returns {array} - The places of the newly create piece
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