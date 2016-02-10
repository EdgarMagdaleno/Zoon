package abilities;

import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.masks.Circle;

class Snowball extends Projectile {
	public override function new(target:Int, x:Float, y:Float, a:Float, ?d:Int = 0) {
		super(x, y);
		type = "Projectile";
		name = "Snowball";
		this.target = target;
		speed = 27;
		angle = a;
		distanceCap = d;
		damage = 7;
		slow = true;
		slowDur = 2300;
		slowStr = 9;

		abilityImage = new Image("graphics/snowball.png");
		abilityImage.centerOrigin();
		abilityImage.angle = a;

		mask =  new Circle(20, -20, -20);
		graphic = abilityImage;
	}

	public override function update() {
		super.update();
	}

	public static function getCost():Int {
		return 7;
	}
}