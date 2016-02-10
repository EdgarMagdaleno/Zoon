package entities;

import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image.createRect;
import com.haxepunk.graphics.Image;

class EnergyLevel extends Entity {
	private var player:Player;
	private var rect:Image;

	public override function new(x:Float, y:Float, e:Player, ?reverse:Bool= false) {
		super(x, y);
		player = e;

		var back:Image;
		back = createRect(500 + 2, 8, 0xCCCCCC);
		HXP.scene.addGraphic(back, 1, x - 1, y - 1);

		rect = createRect(Std.int((100 / player.energy) * 500), 6, 0xFFFF00);
		if( reverse ) {
			rect.angle = 180;
			rect.y += 7;
			rect.x -= 2;
			back.angle = 180;
			back.y += 9;
		}
		graphic = rect;
	}

	public override function update() {
		rect.scaleX = player.energy / 100;
		if( rect.scaleX < 0 ) rect.scale = 0;
		super.update();
	}
}
