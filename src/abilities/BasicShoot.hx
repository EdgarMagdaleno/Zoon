package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class BasicShoot extends Projectile {

	public override function new(x:Float, y:Float, a:Float) {
		super(x, y);
		type = "Projectile";
		name = "BasicShoot";
		speed = 20;
		angle = a;
		distanceCap = 0;
	
		abilityImage = new Image("graphics/basic.png");
		abilityImage.centerOrigin();
		
		abilityImage.angle = a;
		setHitboxTo(abilityImage);
		graphic = abilityImage;
	}

	public static function getCost() {
		return 5;
	}
}