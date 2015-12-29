package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class BasicShoot extends Ability {

	public override function new(x:Float, y:Float, a:Float, o:Int) {
		super(x, y);
		cooldown = 100;
		speed = 20;
		angle = a;

		abilityImage = new Image("graphics/basic.png");
		abilityImage.centerOrigin();
		abilityImage.angle = a;

		graphic = abilityImage;
	}
}