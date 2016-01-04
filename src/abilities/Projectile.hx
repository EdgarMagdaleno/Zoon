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
	private var damage:Int;

	public override function update() {
		distance += speed;
		if(distance < distanceCap || distanceCap == 0) 
			moveAtAngle(angle, speed, false);

		if(collide("Reflector", x, y) != null) {
			angle += 170 + Math.random() * 40;
			abilityImage.angle = angle;
			moveAtAngle(angle, speed, false);
		}

		var e:Entity = collide("Player", x, y);
		if(e != null) {
			var p:entities.PlayerMain = cast(e, entities.PlayerMain);
			p.takeDamage(damage);
		}
	}
}