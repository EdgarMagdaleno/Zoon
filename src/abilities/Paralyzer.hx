package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Paralyzer extends Ability {

	public function new(x:Int, y:Int, d:Int, o:Int) {
		super(x, y, d);
		speed = 10;
		direction = d;
		graphic = new Image("graphics/bullet.png");
	}

}