// Debug
if (keyboard_check_pressed(vk_escape) == true) { 
	game_end();
}

// Logic
if (mCheck == true) {
	var mClears = 0;
	for(var yy = 0; yy < ds_grid_height(mBoard); yy++) {
		var mClear = true;
		for(var xx = 0; xx < ds_grid_width(mBoard); xx++) {
			if (mBoard[# xx, yy] == 0) {
				mClear = false;
				break;
			}
		}
		
		if (mClear == true) {
			mClears++;
			// clear row
			for(var xx = 0; xx < ds_grid_width(mBoard); xx++) {
				mBoard[# xx, yy] = 0;
				for(var _yy = yy - 1; _yy > 1; _yy--) {
					mBoard[# xx, _yy + 1] = mBoard[# xx, _yy];
					mBoard[# xx, _yy] = 0;
				}
			}
			mDirty = true;
		}
	}
	
	if (mClears > 0) {
		mLines += mClears;
		mScore += 100;
		switch (mClears) {
			case 2: mScore += 200; break;
			case 3: mScore += 400; break;
			case 4: mScore += 700; break;
		}
	}
	
	mCheck = false;	
} else if (mCreate == true) {//keyboard_check_pressed(vk_enter) == true) {
	mType = irandom(minoType.COUNT - 1);
	mPlaces = minoCreate(mBoard, mType, global.minoOffset[mType, 0], global.minoOffset[mType, 1]);
	mCreate = false;
	mCheck = true;
	mDirty = true;
}

// Movement
if /* Move Left */ (keyboard_check(ord("A")) == true) {
	if (mHold[0]++ < 1 || (mHold[0] > (mHoldTime * 3) && mHold[0] % mHoldTime == mHoldTime - 1)) {
		if (minoFree(mBoard, mPlaces, -1, 0) == true) {
			mPlaces = minoMove(mBoard, mPlaces, -1, 0);
			mDirty = true;
		}
	}
} /* Move Right */ else if (keyboard_check(ord("D")) == true) {
	if (mHold[1]++ < 1 || (mHold[1] > (mHoldTime * 3) && mHold[1] % mHoldTime == mHoldTime - 1)) {
		if (minoFree(mBoard, mPlaces, 1, 0) == true) {
			mPlaces = minoMove(mBoard, mPlaces, 1, 0);	
			mDirty = true;
		}
	}
} /* Soft Drop */ else if (keyboard_check(ord("S")) == true) {
	if (mHold[2]++ < 1 || mHold[2] % mHoldTime == mHoldTime - 1) {
		if (minoFree(mBoard, mPlaces, 0, 1) == true) {
			mPlaces = minoMove(mBoard, mPlaces, 0, 1);	
			mDirty = true;
			mTick = 0;
			mScore++;
		}
	}
}

if (keyboard_check_released(ord("A")) == true) mHold[0] = 0;
if (keyboard_check_released(ord("D")) == true) mHold[1] = 0;
if (keyboard_check_released(ord("S")) == true) mHold[2] = 0;

// Rotate
if (keyboard_check_pressed(ord("W")) == true) {
	var mPlacesPrevious = []; array_copy(mPlacesPrevious, 0, mPlaces, 0, array_length_1d(mPlaces));
	mPlaces = minoRotate(mBoard, mPlaces, minoDirection.LEFT);
	
	
	for(var i = 0; i < array_length_1d(mPlaces); i++) {
		var mPlace = mPlaces[i];
		mOffset[0] = max(mOffset[0], mPlace[0]);
		mOffset[1] = max(mOffset[1], mPlace[1]);
		mBoard[# mPlace[0], mPlace[1]] = 0;
	}
		
	for(var i = 0; i < array_length_1d(mPlaces); i++) {
		var mPlace = mPlaces[i];
		mBoard[# mPlace[0], mPlace[1]] = mType + 1;
	}
	//mPlaces = minoMove(mBoard, mPlaces, mOffset[0], mOffset[1]);
	mDirty = true;
}

// Hard Drop
if (keyboard_check_pressed(vk_space) == true) {
	var mCount = 0;
	while (minoFree(mBoard, mPlaces, 0, 1) == true) {
		minoMove(mBoard, mPlaces, 0, 1);
		mCount++;
	}
	mScore += mCount * 2;
	mCreate = true;
	mTick = 0;
}

// Game
if (keyboard_check_pressed(vk_enter) == true) {
	mPaused = !mPaused;	
}

/*
if (keyboard_check_pressed(vk_) == true) {
	show_debug_message("Count=" + string(array_length_1d(mPlaces)));
	for(var i = 0; i < array_length_1d(mPlaces); i++) {
		var mPlace = mPlaces[i];
		show_debug_message(mPlace);
	}
}*/

// Game
if (mPaused == false && (mTick++ % mTimer) == mTimer - 1) {
	if (minoFree(mBoard, mPlaces, 0, 1) == true) {
		mPlaces = minoMove(mBoard, mPlaces, 0, 1);
		mDirty = true;
	} else {
		mCreate = true;
	}
}

/*
	move start
	copy mino data at current position
	store current position in previous position
	set mino data at current position + 1@y
	
	
	clearing logic:
	- loop through all previous
	- if previous != current, delete
	
	
	
*/

// Render
if (surface_exists(mSurface) == false) {
	mSurface = surface_create(ds_grid_width(mBoard) * mSize, ds_grid_height(mBoard) * mSize);
	mDirty = true;
}

if (mDirty == true) {
	surface_set_target(mSurface);
	draw_clear_alpha(c_white, 0);
	// Render minos
	for(var yy = 0; yy < ds_grid_height(mBoard); yy++) {
		for(var xx = 0; xx < ds_grid_width(mBoard); xx++) {
			/*draw_set_colour(c_black);
			draw_rectangle(xx * mSize, yy * mSize, (xx * mSize) + mSize, (yy * mSize) + mSize, false);
			draw_set_colour(c_white);
			draw_rectangle((xx * mSize) + 1, (yy * mSize) + 1, (xx * mSize) + mSize - 1, (yy * mSize) + mSize - 1, false);*/
		
			if (mBoard[# xx, yy] != 0) {
				draw_set_colour(c_black);//global.minoColours[mBoard[# xx, yy] - 1]);
				draw_rectangle(xx * mSize, yy * mSize, ((xx * mSize) + mSize) - 1, ((yy * mSize) + mSize) - 1, false);
				var mColour = global.minoColours[mBoard[# xx, yy] - 1];
				draw_rectangle_colour((xx * mSize) + 1, (yy * mSize) + 1, (((xx * mSize) + mSize) - 1) - 1, (((yy * mSize) + mSize) - 1) - 1, mColour, mColour, merge_colour(mColour, c_white, 0.5), merge_colour(mColour, c_white, 0.5),
				false);
			}
		}
	}
	// Render ghost
	var mOffset = 0;
	do {
		mOffset++;
	} until (minoFree(mBoard, mPlaces, 0, mOffset) == false);
	mOffset--;
	draw_set_alpha(0.5);
	for(var i = 0; i < array_length_1d(mPlaces); i++) {
		var mPlace = mPlaces[i];
		draw_set_colour(c_black);//global.minoColours[mBoard[# xx, yy] - 1]);
		draw_rectangle(mPlace[0] * mSize, (mPlace[1] + mOffset) * mSize, ((mPlace[0] * mSize) + mSize) - 1, (((mPlace[1] + mOffset) * mSize) + mSize) - 1, false);
		var mColour = global.minoColours[mType];
		draw_rectangle_colour((mPlace[0] * mSize) + 1, ((mPlace[1] + mOffset) * mSize) + 1, (((mPlace[0] * mSize) + mSize) - 1) - 1, ((((mPlace[1] + mOffset) * mSize) + mSize) - 1) - 1, mColour, mColour, merge_colour(mColour, c_white, 0.5), merge_colour(mColour, c_white, 0.5), false)
		
	}
	draw_set_colour(c_white);
	draw_set_alpha(1);
	surface_reset_target();
	mDirty = false;
}
	
	/*
if (mTick > 60) {
	for(var i = 0; i < array_length_1d(mPlaces); i++) {
		var mPlace = mPlaces[i];
		draw_set_colour(c_green);
		draw_circle((mPlace[0] * mSize) + mSize / 2, ((mPlace[1] * mSize) + mSize / 2) + 1, 2, false);
		draw_set_colour(c_white);
	}
	
	/*
	for(var i = 0; i < array_length_1d(mPlacesPrevious); i++) {
		var mPlace = mPlacesPrevious[i];
		draw_set_colour(mPlace == 0 ? c_orange : c_blue);
		draw_circle((mPlace[0] * mSize) + mSize / 2, ((mPlace[1] * mSize) + mSize / 2) - 1, 2, false);
		draw_set_colour(c_white);
	}
	*/

mDirty = false;
//}