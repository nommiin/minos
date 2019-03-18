/// @function minoNormalize( places )
/// @argument places - An array containing each mino
/// @returns - The normalized minos as a ds_grid
var mPlaces = argument[0], mSize = [minoWidth(mPlaces), minoHeight(mPlaces)], mBounds = [mSize[0], mSize[1]];
// Calculate bounds
for(var i = 0; i < array_length_1d(mPlaces); i++) {
	var mPlace = mPlaces[i];
	mBounds[0] = min(mBounds[0], mPlace[0]);
	mBounds[1] = min(mBounds[1], mPlace[1]);
}

var mMatrix = ds_grid_create(mSize[0] - mBounds[0], mSize[1] - mBounds[1]);
for(var i = 0; i < array_length_1d(mPlaces); i++) {
    var mPlace = mPlaces[i];
    mMatrix[# mPlace[0] - mBounds[0], mPlace[1] - mBounds[1]] = 1;
}
return [mMatrix, mBounds];