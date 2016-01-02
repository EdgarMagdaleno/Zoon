package abilities;

import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Image.createRect;

class Reflector extends Projectile {

	public override function new(x:Float, y:Float, a:Float) {
		super(x, y);
		distanceCap = 200;
		distance = 0;
		angle = a;
		speed = 20;

		abilityImage = createRect(30, 100, 0xFFFFFF);
		abilityImage.centerOrigin();
		abilityImage.angle = angle;

		graphic = abilityImage;
	}

	public static function getCost() {
		return 10;
	}
}