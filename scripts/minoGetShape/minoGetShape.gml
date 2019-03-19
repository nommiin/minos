/// @function minoGetShape( piece )
var mPlaces = [];
switch (argument[0]) {
	case minoType.I: {
		for(var i = 0; i < 4; i++) {
			mPlaces[i] = [i, 0];	
		}
		break;	
	}
	
	case minoType.O: {
		for(var i = 0; i < 4; i++) {
			mPlaces[i] = [(i div 2), (i mod 2)];
		}
	break;}
	
	case minoType.T: {
		for(var i = 0; i < 3; i++) {
			mPlaces[i] = [i, 1];
		}
		mPlaces[i] = [1, 0];
	break;}
	
	case minoType.S: {
		for(var i = 0; i < 2; i++) mPlaces[i] = [i + 1, 0];
		for(var j = 0; j < 2; j++) mPlaces[i + j] = [j, 1];
	break;}
	
	case minoType.Z: {
		for(var i = 0; i < 2; i++) mPlaces[i] = [i, 0];
		for(var j = 0; j < 2; j++) mPlaces[i + j] = [(1 + j), 1];
	break;}
	
	case minoType.J: {
		for(var i = 0; i < 3; i++) mPlaces[i] = [i, 1];
		mPlaces[i] = [0, 0];
	break;}
	
	case minoType.L: {
		for(var i = 0; i < 3; i++) mPlaces[i] = [i, 1];
		mPlaces[i] = [2, 0];
	break;}
}
return mPlaces;