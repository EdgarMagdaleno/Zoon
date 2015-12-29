package abilities;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class FireTackle extends Ability {
	private var currentScene:Scene;
	private var player:Entity;

	public override function new(x:Float, y:Float, a:Float, o:Int) {
		super(x, y);
		speed = 30;

		currentScene = HXP.scene;
		player = HXP.scene.getInstance("hola");

		cooldown = 200;
		angle = a;

		abilityImage = new Image("graphics/fireTackle.png");
		abilityImage.centerOrigin();
		abilityImage.angle = a;

		graphic = abilityImage;
	}

	public override function update():Void {
		moveAtAngle(angle, speed);
		player.x = x;
		player.y = y;
	}
}