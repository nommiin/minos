/// @description Takes the places and rotates them inside the board based off the direction
/// @function minoRotate(board, places, direction)
/// @argument {ds_grid} board - A ds_grid containing all minos
/// @argument {array} places - An array containing each mino
/// @argument {real} direction - The direction in which to rotate the piece
/// @returns {array} - The newly rotated piece places
var mBoard = argument[0], mPlaces = argument[1], mPlacesRotation = undefined, mDirection = argument[2], mNormalization = minoNormalize(mPlaces);
switch (mDirection) {
	case minoDirection.LEFT: {
		var mMatrixNew = minoTranspose(mNormalization[0]);
		minoReverse(mMatrixNew);
		ds_grid_destroy(mNormalization[0]);
		mPlacesRotation = minoDenormalize(mMatrixNew, mNormalization[1]);
		ds_grid_destroy(mMatrixNew);
	break;}
	
	case minoDirection.RIGHT: {
		minoReverse(mNormalization[0]);
		var mMatrixNew = minoTranspose(mNormalization[0]);
		ds_grid_destroy(mNormalization[0]);
		mPlacesRotation = minoDenormalize(mMatrixNew, mNormalization[1]);
		ds_grid_destroy(mMatrixNew);
	break;}
}

// HACK: Shift mino positions if outside of board
var mOffset = 0;
for(var i = 0; i < array_length_1d(mPlacesRotation); i++) {
	var mPlace = mPlacesRotation[i];
	if (mPlace[0] >= ds_grid_width(mBoard)) {
		mOffset = max(mOffset, mPlace[0]);
	}
}

if (mOffset != 0) {
	for(var i = 0; i < array_length_1d(mPlacesRotation); i++) {
		var mPlace = mPlacesRotation[i];
		mPlace[@ 0] -= abs(mOffset - ds_grid_width(mBoard)) + 1;
	}
}

//Play the rotation sound
audio_play_sound(sRotate,10,false);

return mPlacesRotation;
enum minoDirection {
	LEFT,
	RIGHT
}