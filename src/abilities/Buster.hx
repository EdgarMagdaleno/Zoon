package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.masks.Circle;

class Buster extends Projectile {
	private var sprites:Spritemap;

	public override function new(target:Int, x:Float, y:Float, a:Float) {
		super(x, y);
		this.target = target;
		centerOrigin();
		type = "Projectile";
		name = "Buster";
		damage = 15;
		speed = 19;
		angle = a;
		distanceCap = 0;

		sprites = new Spritemap("graphics/buster.png", 46, 46);
		sprites.centerOrigin();
		sprites.angle = a;
		sprites.scale = 50 / sprites.width;
		sprites.add("start", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 20, false);
		sprites.add("body", [14, 15, 16, 17, 18], 20, true);
		sprites.play("start");

		mask = new Circle(20, -20, -20);
		graphic = sprites;
	}

	public override function update() {
		super.update();
		if(sprites.currentAnim == "start" && sprites.index == 12) sprites.play("body");
	}

	public static function getCost():Int {
		return 12;
	}
}