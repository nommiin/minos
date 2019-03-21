/// @description Pops the top of the queue and shifts it forward, writes to passed array index
/// @function minoShift(queue, count)
/// @argument {array} queue - The queue of pieces
/// @argument {count} count - The amount of items in queue
/// @returns {real} - The top of the queue that was popped
var mQueue = argument[0], mCount = argument[1], mTop = mQueue[0];
for(var i = 0; i < mCount - 1; i++) {
	mQueue[@ i] = mQueue[i + 1];
}
mQueue[@ mCount - 1] = irandom(minoType.COUNT - 1);
return mTop;