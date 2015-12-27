package abilities;

import com.haxepunk.Entity;

class Ability extends Entity {
	private var speed:Int;
	private var direction:Int;
	
	public function new(x:Int, y:Int, dir:Int) {
		super(x, y);
		direction = dir;
	}

	public override function update():Void {
		if(direction == 1) x += speed;
		else if(direction == 2) x -= speed;
		else if(direction == 3) y -= speed;
		else if(direction == 4) y += speed;
	}
}