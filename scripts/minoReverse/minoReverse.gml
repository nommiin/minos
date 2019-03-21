/// @description Reverses each row inside of the given matrix, changing the given matrix
/// @function minoReverse(matrix)
/// @argument {ds_grid} matrix - A matrix containing each mino position
/// @returns {ds_grid} - The reversed matrix
var mMatrix = argument[0];
for(var yy = 0; yy < ds_grid_height(mMatrix); yy++) {
    for(var xx = 0, _xx = ds_grid_width(mMatrix) - 1; xx < _xx; xx++) {
        var mCopy = mMatrix[# xx, yy];
        mMatrix[# xx, yy] = mMatrix[# _xx, yy];
        mMatrix[# _xx--, yy] = mCopy;
    }
}
return mMatrix;