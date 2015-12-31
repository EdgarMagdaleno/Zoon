package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Blizzard extends AreaOfEffect {

	public override function new(x:Float, y:Float) {
		super(x, y);
		duration = 700;
		timeSpawn = flash.Lib.getTimer();

		abilityImage = new Image("graphics/snow.png");
		abilityImage.centerOrigin();
		graphic = abilityImage;
	}

	public static function getCost() {
		return 70;
	}
}