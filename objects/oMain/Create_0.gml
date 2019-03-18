// Graphics
mSurface = -1;
mDirty = true;

// Logic
mBoard = ds_grid_create(10, 20);
mSize = 8;
mTick = 0;

// Game
mType = 0;
mPaused = false;
mCheck = false;
mCreate = true;
mPlaces = [];
mTimer = 30;
mScore = 0;
mLines = 0;
mLevel = 1;

mHold[0] = 0;
mHold[1] = 0;
mHold[2] = 0;
mHoldTime = 3;

// Minos
global.minoColours[minoType.L] = make_color_rgb(255, 144, 0);
global.minoColours[minoType.J] = make_color_rgb(0, 85, 160);
global.minoColours[minoType.Z] = make_color_rgb(255, 0, 14);
global.minoColours[minoType.S] = make_color_rgb(0, 194, 72);
global.minoColours[minoType.T] = make_color_rgb(160, 0, 140);
global.minoColours[minoType.O] = make_color_rgb(253, 230, 0);
global.minoColours[minoType.I] = make_color_rgb(0, 173, 229);
global.minoOffset[minoType.L, 0] = 3; global.minoOffset[minoType.L, 1] = 0;
global.minoOffset[minoType.J, 0] = 3; global.minoOffset[minoType.J, 1] = 0;
global.minoOffset[minoType.Z, 0] = 3; global.minoOffset[minoType.Z, 1] = 0;
global.minoOffset[minoType.S, 0] = 3; global.minoOffset[minoType.S, 1] = 0;
global.minoOffset[minoType.T, 0] = 3; global.minoOffset[minoType.T, 1] = 0;
global.minoOffset[minoType.O, 0] = 4; global.minoOffset[minoType.O, 1] = 0;
global.minoOffset[minoType.I, 0] = 3; global.minoOffset[minoType.I, 1] = 0;

/*
enum minoType {
	I,
	O,
	T,
	S,
	Z,
	J,
	L,
	COUNT
}
*/

// Debug
mMoves = [];
mCleared = false;

// Window
window_set_size(room_width * 3, room_height * 3);
window_set_position(display_get_width() / 2 - room_width * 3 / 2, display_get_height() / 2 - room_height * 3 / 2);