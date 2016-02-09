package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image.createRect;
import com.haxepunk.graphics.Image;

class Life extends Entity {
	private var player:Player;
	private var rect:Image;
	public function new(x:Float, y:Float, e:Player, ?reverse:Bool = false) {
		super(x, y);
		player = e;
		
		rect = createRect(Std.int(player.life * 6.7), 10, 0x00FF00);
		if( reverse ) {
			rect.angle = 180;
			rect.y += 10;
		}
		graphic = rect;
	}

	public override function update() {
		rect.scaleX = player.life / 100;
		super.update();
	}
}