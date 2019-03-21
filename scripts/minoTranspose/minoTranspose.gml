/// @description Creates a new matrix and transpositions the input matrix inside of it
/// @function minoTranspose(matrix)
/// @argument {ds_grid} matrix - A matrix containing each mino position
/// @returns {ds_grid} - The transposed matrix
var mMatrix = argument[0], mMatrixNew = ds_grid_create(max(ds_grid_width(mMatrix), ds_grid_height(mMatrix)), max(ds_grid_width(mMatrix), ds_grid_height(mMatrix)));
for(var yy = 0; yy < ds_grid_width(mMatrix); yy++) {
    for(var xx = ds_grid_height(mMatrix) - 1; xx > -1; xx--) {
        mMatrixNew[# xx, yy] = mMatrix[# yy, xx];
    }
}
return mMatrixNew;