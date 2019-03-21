/// @description Takes normalized matrix and transforms it and store it inside of array
/// @function minoDenormalize(matrix, bounds)
/// @argument {ds_grid} matrix - A matrix containing each mino position
/// @argument {array} bounds - An array with the offsets for each mino
/// @returns {array} - The denormalized minos in an array
var mMatrix = argument[0], mBounds = argument[1], mPlaces = [];
for(var yy = 0; yy < ds_grid_height(mMatrix); yy++) {
    for(var xx = 0; xx < ds_grid_width(mMatrix); xx++) {
        if (mMatrix[# xx, yy] != 0) {
            mPlaces[array_length_1d(mPlaces)] = [xx + mBounds[0], yy + mBounds[1]];
        }
    }
}
return mPlaces;