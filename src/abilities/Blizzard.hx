package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Blizzard extends AreaOfEffect {
	private var player:entities.Player;
	private var e:Entity;

	public override function new(x:Float, y:Float) {
		super(x, y);
		duration = 700;
		timeSpawn = flash.Lib.getTimer();

		abilityImage = new Image("graphics/snow.png");
		abilityImage.centerOrigin();
		graphic = abilityImage;
	}

	public override function update() {
		super.update();

		e = collide("player", x, y);
		if(e != null) {
			player = cast(e, entities.Player);
			player.slow(1000, 12);
		}
	}

	public static function getCost() {
		return 70;
	}
}