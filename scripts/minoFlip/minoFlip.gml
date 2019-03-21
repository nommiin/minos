/// @description Flips each column inside of the given matrix, changing the given matrix
/// @function minoFlip(matrix)
/// @argument {ds_grid} matrix - A matrix containing each mino position
/// @returns {ds_grid} - The flipped matrix
var mMatrix = argument[0];
for(var xx = 0; xx < ds_grid_width(mMatrix); xx++) {
	for(var yy = 0, _yy = ds_grid_height(mMatrix) - 1; yy < _yy; yy++) {
		var mCopy = mMatrix[# xx, yy];
		mMatrix[# xx, yy] = mMatrix[# xx, _yy];
		mMatrix[# xx, _yy--] = mCopy;
	}
}
return mMatrix;