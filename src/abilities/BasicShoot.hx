package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class BasicShoot extends Projectile {

	public override function new(x:Float, y:Float, a:Float) {
		super(x, y);
		type = "Projectile";
		name = "BasicShoot";
		cooldown = 100;
		speed = 20;
		angle = a;
	
		abilityImage = new Image("graphics/basic.png");
		abilityImage.centerOrigin();
		abilityImage.angle = a;

		graphic = abilityImage;
	}

	public static function getCost() {
		return 5;
	}
}