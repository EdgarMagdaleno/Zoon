package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Ease;

class Projectile extends Entity {
	private var speed:Int;
	private var angle:Float;
	private var abilityImage:Image;
	private var distance:Int = 0;
	private var distanceCap:Int;

	public override function update() {
		distance += speed;
		if(distance < distanceCap || distanceCap == 0) 
			moveAtAngle(angle, speed, true);

		if(collide("Reflector", x, y) != null) angle -= 70 + Math.random() * 40;	
	}
}