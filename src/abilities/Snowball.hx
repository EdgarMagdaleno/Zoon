package abilities;

import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;

class Snowball extends Projectile {
	public override function new(x:Float, y:Float, a:Float) {
		super(x, y);
		speed = 27;
		angle = a;
		distanceCap = 0;
		damage = 5;
		slow = true;
		slowDur = 500;
		slowStr = 5;

		abilityImage = new Image("graphics/snowball.png");
		abilityImage.centerOrigin();
		abilityImage.angle = a;

		graphic = abilityImage;
	}

	public override function update() {
		super.update();
	}
}