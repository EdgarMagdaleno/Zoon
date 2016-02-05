package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Circle;

class BasicShoot extends Projectile {

	public override function new(t:Int, x:Float, y:Float, a:Float, d:Int) {
		super(x, y);
		target = t;
		damage = 3;
		centerOrigin();
		type = "Projectile";
		name = "BasicShoot";
		speed = 30;
		angle = a;
		distanceCap = d;

		abilityImage = new Image("graphics/basic.png");
		abilityImage.centerOrigin();
		abilityImage.angle = a;
		abilityImage.scale = .70;
		graphic = abilityImage;
	
		mask = new Circle(5, -5, -5);
	}

	public override function update() {
		super.update();
	}

	public static function getCost() {
		return 5;
	}
}