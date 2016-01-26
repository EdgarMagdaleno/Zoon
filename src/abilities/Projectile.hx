package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Ease;

class Projectile extends Entity {
	private var owner:Int;
	private var speed:Int;
	private var angle:Float;
	private var abilityImage:Image;
	private var distance:Int = 0;
	private var distanceCap:Int;
	private var damage:Int;

	private var slow:Bool = false;
	private var slowDur:Int;
	private var slowStr:Int;

	private var paralyze:Bool = false;
	private var paralyzeDur:Int;

	public override function update() {
		distance += speed;
		if(distance < distanceCap || distanceCap == 0) 
			moveAtAngle(angle, speed, false);
		else scene.remove(this);
		
		if(collide("Reflector", x, y) != null) {
			angle += 170 + Math.random() * 40;
			abilityImage.angle = angle;
			moveAtAngle(angle, speed, false);
		}

		//doDamage(slow, paralyze);
	}

	public function doDamage(slow:Bool, paralyze:Bool) {
		var e:Entity = collide("player" + owner, x, y);
		if(e != null) {
			var p:entities.Player = cast(e, entities.Player);
			p.takeDamage(damage);
			if(slow) p.slow(slowDur, slowStr);
			if(paralyze) p.paralyze(paralyzeDur);
		}	
	}
}