/// @description Calculates the width of the given places
/// @function minoWidth(places)
/// @argument {array} places - An array containing each place
/// @returns {real} - The width of the mino
var mPlaces = argument[0], mMinimum = 0, mMaximum = 0;
for(var i = 0; i < array_length_1d(mPlaces); i++) {
	var mPlace = mPlaces[i];
	mMinimum = min(mMinimum, mPlace[0]);
	mMaximum = max(mMaximum, mPlace[0]);
}
return abs(mMaximum - mMinimum) + 1;