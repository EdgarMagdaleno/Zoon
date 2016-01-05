package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;

class Buster extends Projectile {
	private var sprites:Spritemap;

	public override function new(x:Float, y:Float, a:Float) {
		super(x, y);
		centerOrigin();
		type = "Projectile";
		name = "Buster";

		speed = 25;
		angle = a;
		distanceCap = 0;

		sprites = new Spritemap("graphics/buster.png", 46, 46);
		sprites.centerOrigin();
		sprites.angle = a;
		sprites.scale = 90 / sprites.width;
		sprites.add("start", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], 20, false);
		sprites.add("body", [13, 14, 15, 16, 17, 18], 10, true);
		sprites.play("start");
		graphic = sprites;
	}

	public override function update() {
		super.update();
		if(sprites.currentAnim == "start" && sprites.index == 12) sprites.play("body");
	}
}