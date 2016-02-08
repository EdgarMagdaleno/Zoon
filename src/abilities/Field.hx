package abilities;

import com.haxepunk.Entity;

class Field extends Entity {
	private var player:Entity;
	
	public override function update() {
		x = player.x;
		y = player.y;
	}
}