/// @description Calculates the height of the given places
/// @function minoHeight(places)
/// @argument {array} places - An array containing each place
/// @returns {real} - The height of the mino
var mPlaces = argument[0], mMinimum = 0, mMaximum = 0;
for(var i = 0; i < array_length_1d(mPlaces); i++) {
	var mPlace = mPlaces[i];
	mMinimum = min(mMinimum, mPlace[1]);
	mMaximum = max(mMaximum, mPlace[1]);
}
return abs(mMaximum - mMinimum) + 1;