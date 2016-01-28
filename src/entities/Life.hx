package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image.createRect;
import com.haxepunk.graphics.Image;

class Life extends Entity {
	private var player:Player;
	private var rect:Image;
	public function new(x:Float, y:Float, e:Player) {
		super(x, y);
		player = e;

		rect = createRect(player.life * 3, 5, 0x00FF00);
		graphic = rect;
	}

	public override function update() {
		rect.scaleX = player.life / 100;
		super.update();
	}
}