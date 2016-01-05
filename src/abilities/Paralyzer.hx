package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;

class Paralyzer extends Field {
	private var sprites:Spritemap;

	public function new(x:Float, y:Float, e:Entity) {
		super(x, y);
		player = e;

		sprites = new Spritemap("graphics/Paralyzer.png", 130, 124);
		sprites.centerOrigin();
		sprites.scale = 180 / sprites.width;
		sprites.add("body", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 40, false);
		sprites.play("body");

		graphic = sprites;
	}

	public override function update() {
		if(sprites.complete) scene.remove(this);
		super.update();
	}

}