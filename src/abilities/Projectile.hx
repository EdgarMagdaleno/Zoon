package abilities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Ease;

class Projectile extends Entity {
	private var target:Int;
	private var speed:Int;
	private var angle:Float;
	private var abilityImage:Image;
	private var distance:Int = 0;
	private var distanceCap:Int = 0;
	private var damage:Int;

	private var slow:Bool = false;
	private var slowDur:Int;
	private var slowStr:Float;

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

		doDamage(slow, paralyze);
	}

	public function doDamage(slow:Bool, paralyze:Bool) {
		var e:Entity = collide("player" + target, x, y);
		if(e != null) {
			var p:entities.Player = cast(e, entities.Player);
			p.takeDamage(damage);
			scene.remove(this);
			if(slow) p.slow(slowDur, slowStr);
			if(paralyze) p.paralyze(paralyzeDur);
		}
	}

	public function outOfBounds():Bool {
		if( x < 20 || x > 1300 || y < 20 || y > 740) return true;
		return false;
	}
}
