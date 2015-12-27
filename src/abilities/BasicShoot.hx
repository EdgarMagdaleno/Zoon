package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class BasicShoot extends Ability {
	public var cooldown:Int = 200;

	public function new(x:Int, y:Int, d:Int, o:Int) {
		super(x, y, d);
		speed = 5;
		direction = d;
		graphic = new Image("graphics/bullet.png");
	}

}