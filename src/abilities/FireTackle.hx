package abilities;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Circle;

class FireTackle extends Projectile {
	private var player:Entity;

	public override function new(target:Int, x:Float, y:Float, a:Float, e:Entity) {
		super(x, y);
		speed = 30;
		player = e;
		this.target = target;

		damage = 22;
		slow = true;
		slowDur = 3;
		slowStr = 3;
		angle = a;

		abilityImage = new Image("graphics/fireTackle.png");
		abilityImage.centerOrigin();
		abilityImage.angle = a;

		mask = new Circle(22, -22, -22);
		graphic = abilityImage;
	}

	public override function update():Void {
		super.update();
		moveAtAngle(angle, speed);
		player.x = x;
		player.y = y;
		if( outOfBounds() ) HXP.scene.remove(this);
	}

	public static function getCost():Int {
		return 20;
	}
}