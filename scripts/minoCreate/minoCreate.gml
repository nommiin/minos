/// @function minoCreate( board, piece, x, y )
/// @argument board - A ds_map containing all minos
/// @argument piece - The piece to create
/// @argument x - The horizontal position of the piece
/// @argument y - The vertical position of the piece
/// @returns - The places of the newly create piece
var mBoard = argument[0], mPiece = argument[1], mHorizontal = argument[2], mVertical = argument[3], mPlaces = [];
switch (mPiece) {
	case minoType.I: {
		for(var i = 0; i < 4; i++) {
			mPlaces[i] = [mHorizontal + i, mVertical];	
		}
		break;	
	}
	
	case minoType.O: {
		for(var i = 0; i < 4; i++) {
			mPlaces[i] = [mHorizontal + (i div 2), mVertical + (i mod 2)];
		}
	break;}
	
	case minoType.T: {
		for(var i = 0; i < 3; i++) {
			mPlaces[i] = [mHorizontal + i, mVertical + 1];
		}
		mPlaces[i] = [mHorizontal + 1, mVertical];
	break;}
	
	case minoType.S: {
		for(var i = 0; i < 2; i++) mPlaces[i] = [mHorizontal + (1 + i), mVertical];
		for(var j = 0; j < 2; j++) mPlaces[i + j] = [mHorizontal + j, mVertical + 1];
	break;}
	
	case minoType.Z: {
		for(var i = 0; i < 2; i++) mPlaces[i] = [mHorizontal + i, mVertical];
		for(var j = 0; j < 2; j++) mPlaces[i + j] = [mHorizontal + (1 + j), mVertical + 1];
	break;}
	
	case minoType.J: {
		for(var i = 0; i < 3; i++) mPlaces[i] = [mHorizontal + i, mVertical + 1];
		mPlaces[i] = [mHorizontal, mVertical];
	break;}
	
	case minoType.L: {
		for(var i = 0; i < 3; i++) mPlaces[i] = [mHorizontal + i, mVertical + 1];
		mPlaces[i] = [mHorizontal + 2, mVertical];
	break;}
}

for(var i = 0; i < array_length_1d(mPlaces); i++) {
	var mPlace = mPlaces[i];
	mBoard[# mPlace[0], mPlace[1]] = mPiece + 1;
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