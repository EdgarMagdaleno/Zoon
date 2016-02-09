package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image.createRect;
import com.haxepunk.graphics.Image;

class EnergyLevel extends Entity {
	private var player:Player;
	private var rect:Image;

	public override function new(x:Float, y:Float, e:Player, ?reverse:Bool= false) {
		super(x, y);
		player = e;
		
		rect = createRect(Std.int(player.energy * 5), 6, 0xFFFF00);
		if( reverse ) {
			rect.angle = 180;
			rect.y += 6;
		}
		graphic = rect;
	}

	public override function update() {
		rect.scaleX = player.energy / 100;
		super.update();
	}
}