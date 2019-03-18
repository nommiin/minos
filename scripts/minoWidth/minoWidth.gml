/// @function minoWidth( places )
/// @argument places - An array containing each mino
/// @returns - The width of the mino
var mPlaces = argument[0], mMinimum = 0, mMaximum = 0;
for(var i = 0; i < array_length_1d(mPlaces); i++) {
	var mPlace = mPlaces[i];
	mMinimum = min(mMinimum, mPlace[0]);
	mMaximum = max(mMaximum, mPlace[0]);
}
return abs(mMaximum - mMinimum) + 1;