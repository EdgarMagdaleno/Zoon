package abilities;

import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Polygon;

class Reflector extends Projectile {
	public override function new(x:Float, y:Float, a:Float) {
		super(x, y);
		distanceCap = 200;
		angle = a;
		speed = 20;
		type = "Reflector";

		abilityImage = Image.createRect(30, 100, 0xFFFFFF);
		abilityImage.angle = angle;
		abilityImage.centerOrigin();
		mask = Polygon.createFromArray([-15, -50, 15, -50, 15, 50, -15, 50]);
		cast(mask, Polygon).angle = angle;

		graphic = abilityImage;
	}

	public static function getCost() {
		return 10;
	}
}