package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Ability extends Entity {
	private var speed:Int;
	private var angle:Float;
	private var abilityImage:Image;
	private var cooldown:Int;

	public override function update() {
		moveAtAngle(angle, speed);	
	}
}