package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Pixelmask;
import com.haxepunk.masks.Circle;
import com.haxepunk.masks.Imagemask;

class BasicShoot extends Projectile {

	public override function new(x:Float, y:Float, a:Float) {
		super(x, y);
		centerOrigin();
		type = "Projectile";
		name = "BasicShoot";
		speed = 20;
		angle = a;
		distanceCap = 0;

		abilityImage = new Image("graphics/basic.png");
		abilityImage.centerOrigin();
		abilityImage.angle = a;
		graphic = abilityImage;
		
		mask = new Circle(5, -5, -5);
	}

	public static function getCost() {
		return 5;
	}
}