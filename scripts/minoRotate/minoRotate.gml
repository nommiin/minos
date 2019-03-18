/// @function minoRotate( board, places, direction )
/// @argument board - A ds_map containing all minos
/// @argument places - An array containing each mino
/// @returns - The newly rotated piece
var mBoard = argument[0], mPlaces = argument[1], mPlacesRotation = undefined, mDirection = argument[0], mNormalization = minoNormalize(mPlaces);
switch (mDirection) {
	case minoDirection.RIGHT: {
		var mMatrixNew = minoTranspose(mNormalization[0]);
		minoReverse(mMatrixNew);
		ds_grid_destroy(mNormalization[0]);
		mPlacesRotation = minoDenormalize(mMatrixNew, mNormalization[1]);
		ds_grid_destroy(mMatrixNew);
	break;}
	
	case minoDirection.LEFT: {
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

return mPlacesRotation;
enum minoDirection {
	LEFT,
	RIGHT
}