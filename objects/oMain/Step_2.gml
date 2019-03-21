/*
	Debug controls
*/
if (keyboard_check_pressed(vk_escape) == true) {
	game_end();
} else if (keyboard_check_pressed(vk_backspace) == true) {
	game_restart();	
}

/*
	Capture all input inside of array
	NOTE: Will be used later for replays
*/
mInput[0] = keyboard_check_pressed(ord("W"));
mInput[1] = keyboard_check(ord("A"));
mInput[2] = keyboard_check(ord("D"));
mInput[3] = keyboard_check(ord("S"));
mInput[4] = keyboard_check_released(ord("A"));
mInput[5] = keyboard_check_released(ord("D"));
mInput[6] = keyboard_check_released(ord("S"));
mInput[7] = keyboard_check_pressed(vk_space);
mInput[8] = keyboard_check_pressed(ord("C"));
	
/*
	Line clearing and piece creation
*/
if (mCheck == true) {
	// Loop through each column then check each row for any clear places
	var mClears = 0;
	for(var yy = 0; yy < ds_grid_height(mBoard); yy++) {
		var mClear = true;
		for(var xx = 0; xx < ds_grid_width(mBoard); xx++) {
			// If places are clear, set clear to false and break out of loop
			if (mBoard[# xx, yy] == 0) {
				mClear = false;
				break;
			}
		}
		
		// If row is cleared, increase clear counter and clear row of piece data
		if (mClear == true) {
			mClears++;
			for(var xx = 0; xx < ds_grid_width(mBoard); xx++) {
				mBoard[# xx, yy] = 0;
				// Shift all rows above current row downward
				for(var _yy = yy - 1; _yy > 1; _yy--) {
					mBoard[# xx, _yy + 1] = mBoard[# xx, _yy];
					mBoard[# xx, _yy] = 0;
				}
			}
			mDirty = true;
		}
	}
	
	// Set the line counter and score based on how many lines were cleared
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
} else if (mCreate == true) {
	// Create mino and check for any clears
	mPlaces = minoCreate(mBoard, mType, global.minoOffset[mType, 0], global.minoOffset[mType, 1]);
	mCreate = false;
	mCheck = true;
	mDirty = true;
}

/*
	Piece rotation
*/
if (mPaused == false && mInput[0] == true) {
	// Rotate places and store rotation
	var mPlacesTest = minoRotate(mBoard, mPlaces, minoDirection.RIGHT), mRotate = true;
	for(var i = 0; i < array_length_1d(mPlacesTest); i++) {
		// Check each place for rotation and see place is free
		var mPlace = mPlacesTest[i], mSafe = true;
		if (mBoard[# mPlace[0], mPlace[1]] != 0) {
			// If place is not free, check to see if the place is not equal to the existing piece places
			mSafe = false;	
			for(var j = 0; j < array_length_1d(mPlaces); j++) {
				var mPlaceTest = mPlaces[j];
				if (mPlace[0] == mPlaceTest[0] && mPlace[1] == mPlaceTest[1]) {
					mSafe = true;	
					break;
				}
			}
			// Place is not free so cancel rotation and break out of loop
			if (mSafe == false) {
				mRotate = false;
				break;
			}
			
		}
	}
	
	// Rotation is possible, apply rotation
	if (mRotate == true) {
		// Clear all piece data from current places
		for(var i = 0; i < array_length_1d(mPlaces); i++) {
			var mPlace = mPlaces[i];
			mBoard[# mPlace[0], mPlace[1]] = 0;
		}
		// Set places to newly calculated rotation
		mPlaces = mPlacesTest;
		// Set piece data to new places
		for(var i = 0; i < array_length_1d(mPlaces); i++) {
			var mPlace = mPlaces[i];
			mBoard[# mPlace[0], mPlace[1]] = mType + 1;
		}
		mDirty = true;
	}
}

/*
	Directional input
*/
if (mPaused == false) {
	if (mInput[1] == true) {
		// Check hold timer and move left if place is free
		if (mHold[0]++ < 1 || (mHold[0] > (mHoldTime * 3) && mHold[0] % mHoldTime == mHoldTime - 1)) {
			if (minoFree(mBoard, mPlaces, -1, 0) == true) {
				mPlaces = minoMove(mBoard, mPlaces, -1, 0);
				mDirty = true;
			}
		}
	} else if (mInput[2] == true) {
		// Check hold timer and move right if place is free
		if (mHold[1]++ < 1 || (mHold[1] > (mHoldTime * 3) && mHold[1] % mHoldTime == mHoldTime - 1)) {
			if (minoFree(mBoard, mPlaces, 1, 0) == true) {
				mPlaces = minoMove(mBoard, mPlaces, 1, 0);	
				mDirty = true;
			}
		}
	} else if (mInput[3] == true) {
		// Check hold timer and move down + increase score if place is free
		if (mHold[2]++ < 1 || mHold[2] % mHoldTime == mHoldTime - 1) {
			if (minoFree(mBoard, mPlaces, 0, 1) == true) {
				mPlaces = minoMove(mBoard, mPlaces, 0, 1);	
				mDirty = true;
				mTick = 0;
				mScore++;
			}
		}
	}
}

// Reset hold timers for all directional inputs
if (mInput[4] == true) mHold[0] = 0;
if (mInput[5] == true) mHold[1] = 0;
if (mInput[6] == true) mHold[2] = 0;

/*
	Hard dropping
*/
if (mPaused == false && mInput[7] == true) {
	// Move piece downward until it cannot move
	var mCount = 0;
	while (minoFree(mBoard, mPlaces, 0, 1) == true) {
		minoMove(mBoard, mPlaces, 0, 1);
		mCount++;
	}
	// Create mino, set score, reset tick, and allow for holding again
	mScore += mCount * 2;
	mCreate = true;
	mType = irandom(minoType.COUNT - 1);
	mTick = 0;
	mHeldAllowed = true;
}

/*
	Hold Mechanic
*/
if (mPaused == false && mInput[8] == true) {
	// Clear existing piece
	for(var i = 0; i < array_length_1d(mPlaces); i++) {
		var mPlace = mPlaces[i];
		ds_grid_set(mBoard, mPlace[0], mPlace[1], 0);	
	}
	// Copy the type to held
	var mCopy = irandom(minoType.COUNT - 1);
	if (mHeld != -1) {
		mCopy = mHeld;
	}
	mHeld = mType;
	mType = mCopy;
	mCreate = true;
	mHeldAllowed = false;
}

/*
	Main game loop
*/
if (mPaused == false && (mTick++ % mTimer) == mTimer - 1) {
	// Check if downward movement is free
	if (minoFree(mBoard, mPlaces, 0, 1) == true) {
		// Move mino downward if possible
		mPlaces = minoMove(mBoard, mPlaces, 0, 1);
		mDirty = true;
	} else {
		// Create mino and allow for holding if disabled
		mCreate = true;
		mHeldAllowed = true;
		mType = irandom(minoType.COUNT - 1);
	}
}

/*
	Pausing
*/
if (keyboard_check_pressed(vk_enter) == true) {
	mPaused = !mPaused;	
}

/*
	Game rendering
*/
if (surface_exists(mSurface) == false) {
	mSurface = surface_create(ds_grid_width(mBoard) * mSize, ds_grid_height(mBoard) * mSize);
	mDirty = true;
}

if (mDirty == true) {
	// Get piece (shape) for currently held piece
	mHeldPiece = minoGetShape(mHeld);
	surface_set_target(mSurface);
	draw_clear_alpha(c_white, 0);
	
	// Get the "most free" position and render ghost at it
	var mOffset = 0;
	do {
		mOffset++;
	} until (minoFree(mBoard, mPlaces, 0, mOffset) == false);
	draw_set_alpha(0.5);
	for(var i = 0; i < array_length_1d(mPlaces); i++) {
		var mPlace = mPlaces[i];
		minoDrawGrid(mPlace[0], mPlace[1] + (mOffset - 1), mSize, mType + 1);
	}
	draw_set_alpha(1);
	
	// Loop through board data and render minos at each position
	for(var yy = 0; yy < ds_grid_height(mBoard); yy++) {
		for(var xx = 0; xx < ds_grid_width(mBoard); xx++) {
			if (mBoard[# xx, yy] != 0) {
				minoDrawGrid(xx, yy, mSize, mBoard[# xx, yy]);
			}
		}
	}
	
	surface_reset_target();
	mDirty = false;
	
}