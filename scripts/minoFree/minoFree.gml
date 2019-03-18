/// @function minoFree( board, places, x, y )
/// @argument board - A ds_map containing all minos
/// @argument places - An array containing all minos to move
/// @argument x - The horizontal position to check
/// @argument y - The vertical position to check
var mBoard = argument[0], mPlaces = argument[1], mHorizontal = argument[2], mVertical = argument[3];
for(var i = 0; i < array_length_1d(mPlaces); i++) {
	var mPlace = mPlaces[i];
	if (mPlace[0] + mHorizontal < 0 || mPlace[0] + mHorizontal > ds_grid_width(mBoard) - 1) return false;
	if (mPlace[1] + mVertical < 0 || mPlace[1] + mVertical > ds_grid_height(mBoard) - 1) return false;
	if (mBoard[# mPlace[0] + mHorizontal, mPlace[1] + mVertical] != 0) {
		var mSelf = false;
		for(var j = 0; j < array_length_1d(mPlaces); j++) {
			var mCheck = mPlaces[j];
			if (mPlace[0] + mHorizontal == mCheck[0] && mPlace[1] + mVertical == mCheck[1]) {
				mSelf =  true;
				break;
			}
		}
		if (mSelf == false) return false;
	}
}
return true;