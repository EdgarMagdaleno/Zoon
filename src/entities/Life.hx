package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image.createRect;
import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;
import com.haxepunk.HXP;

class Life extends Entity {
	private var player:Player;
	private var rect:Image;
	public function new(x:Float, y:Float, e:Player, ?reverse:Bool = false) {
		super(x, y);
		player = e;
		
		var back:Image;
		back = createRect(630 + 2, 12, 0x999999);
		HXP.scene.addGraphic(back, 0, x -1, y - 1);

		rect = createRect(Std.int((100 / player.life) * 630), 10, 0x00FF00);
		if( reverse ) {
			rect.angle = 180;
			rect.y += 11;
			rect.x -= 2;
			back.angle = 180;
			back.y += 13;

		}

		graphic = rect;
	}

	public override function update() {
		rect.scaleX = player.life / 100;
		if( rect.scaleX < 0 ) rect.scale = 0;
		super.update();
	}
}