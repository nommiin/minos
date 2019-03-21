/// @description Moves pieces and data in the board then returns the new places of the moved piece
/// @function minoMove(board, places, x, y)
/// @argument {ds_grid} board - A ds_grid containing all minos
/// @argument {array} places - An array containing the minos to move
/// @argument {real} x - The amount of places to move horizontally
/// @argument {real} y - The amount of places to move vertically
/// @returns {array} - The newly updated places
var mBoard = argument[0], mPlaces = argument[1], mPlacesPrevious = [], mHorizontal = argument[2], mVertical = argument[3];
for(var i = 0; i < array_length_1d(mPlaces); i++) {
	var mPlace = mPlaces[i], mCopy = mBoard[# mPlace[0], mPlace[1]];
	mPlacesPrevious[i] = [mPlace[0], mPlace[1]];
	mBoard[# mPlace[0] + mHorizontal, mPlace[1] + mVertical] = mCopy;
	mPlace[@ 0] += mHorizontal;
	mPlace[@ 1] += mVertical;
}
for(var i = 0; i < array_length_1d(mPlacesPrevious); i++) {
	var mPlacePrevious = mPlacesPrevious[i], mMove = true;
	for(var j = 0; j < array_length_1d(mPlaces); j++) {
		var mPlace = mPlaces[j];
		if (mPlacePrevious[0] == mPlace[0] && mPlacePrevious[1] == mPlace[1]) {
			mMove = false;
			break;
		}
	}
	if (mMove == true) mBoard[# mPlacePrevious[0], mPlacePrevious[1]] = 0;
}
return mPlaces;
/*
for(var i = 0; i < array_length_1d(mPlaces); i++) {
		var mPlace = mPlaces[i], mCopy = mBoard[# mPlace[0], mPlace[1]];
		mPlacesPrevious[i] = [mPlace[0], mPlace[1]];
		mBoard[# mPlace[0], ++mPlace[@ 1]] = mCopy;
	}
	
	for(var i = 0; i < array_length_1d(mPlacesPrevious); i++) {
		var mPlacePrevious = mPlacesPrevious[i], mPlaced = true;
		for(var j = 0; j < array_length_1d(mPlaces); j++) {
			var mPlace = mPlaces[j];
			if (mPlacePrevious[0] == mPlace[0] && mPlacePrevious[1] == mPlace[1]) {
				mPlaced = false;
				break;
			}
		}
		if (mPlaced == true) mBoard[# mPlacePrevious[0], mPlacePrevious[1]] = 0;
	}
	mPlacesPrevious = [];
*/