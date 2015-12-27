package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Slower extends Ability {

	public function new(x:Int, y:Int, d:Int, o:Int) {
		super(x, y, d);
		speed = 20;
		direction = d;

		graphic = new Image("graphics/bullet.png");
	}
}