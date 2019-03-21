/// @description Creates a matrix based off the given places and normalizes it's position in world space
/// @function minoNormalize(places)
/// @argument {array} places - An array containing each mino
/// @returns {ds_grid, array} - The normalized minos as a ds_grid and offset in world space
var mPlaces = argument[0], mSize = [minoWidth(mPlaces), minoHeight(mPlaces)], mBounds = [mSize[0], mSize[1]];
// Calculates the offset of the minos in world space
for(var i = 0; i < array_length_1d(mPlaces); i++) {
	var mPlace = mPlaces[i];
	mBounds[0] = min(mBounds[0], mPlace[0]);
	mBounds[1] = min(mBounds[1], mPlace[1]);
}

// Create a matrix and store mino positions in it, offset by previously calculated offset
var mMatrix = ds_grid_create(mSize[0] - mBounds[0], mSize[1] - mBounds[1]);
for(var i = 0; i < array_length_1d(mPlaces); i++) {
    var mPlace = mPlaces[i];
    mMatrix[# mPlace[0] - mBounds[0], mPlace[1] - mBounds[1]] = 1;
}
return [mMatrix, mBounds];