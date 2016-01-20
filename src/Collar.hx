package ;

class Collar {
	private var array = new Array();
	public var index:Int;

	public function new(a):Void {
		array = a;
		index = 0;
	}

	public function get() {
		return array[index];
	}

	public function getAtIndex(index:Int) {
		if ( index < 0 || index >= array.length ) throw("Index out of bounds.");
		return array[index];
	}

	public function set(n):Void {
		array[index] = n;
	}

	public function setIndex(n:Int) {
		if ( n < 0 || n >= array.length ) throw("Index out of bounds.");
		index = n;
	}

	public function nextIndex(?steps:Int) {
		if ( steps == null ) steps = 1;
		if ( steps > array.length ) steps %= array.length;
		if ( index + steps > array.length - 1 ) index += steps - array.length;
		else index += steps;
	}

	public function previousIndex(?steps:Int) {
		if ( steps == null ) steps = 1;
		if ( steps > array.length ) steps %= array.length;
		if ( index - steps < 0 ) index = array.length - steps;
		else index -= steps;
	}

	public function next(?steps:Int, ?moveIndex:Bool) {
		var n;

		if ( steps == null ) steps = 1;
		if ( steps > array.length ) steps %= array.length;
		if ( index + steps > array.length - 1 ) n = array[index + steps - array.length];
		else n = array[index + steps];

		if ( moveIndex ) nextIndex(steps);
		return n;
	}

	public function previous(?steps:Int, ?moveIndex:Bool) {
		var n;

		if ( steps == null ) steps = 1;
		if ( index - steps < 0 ) n = array[array.length - steps];
		else n = array[index - steps];

		if ( moveIndex ) previousIndex(steps);
		return n;
	}

	public function push(n) {
		array.push(n);
	}
}