package entities;

import entities.AbilityManager;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.Engine;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class Player1 extends Entity {
	public var shipImage:Image;
	public var speed:Int;
	public var direction:Int;
	public var ability:AbilityManager;
	private var angle;

	public override function new(x:Int, y:Int, ship:Int, n:Int, s1:Int, s2:Int, s3:Int):Void {
		super();
		type = "P" + n;

		speed = 10;
		direction = 0;

		ability = new AbilityManager(n, s1, s2, s3);
		Input.define("right", [Key.D]);
		Input.define("left", [Key.A]);
		Input.define("up", [Key.W]);
		Input.define("down", [Key.S]);
		Input.define("a1", [Key.Y]);
		Input.define("a2", [Key.U]);
		Input.define("a3", [Key.I]);

		
		shipImage = new Image("graphics/ships/ship" + ship + ".png");
		shipImage.centerOrigin();
		graphic = shipImage;
	}

	public override function update():Void {
		if(Input.check("right")) {
			this.moveAtAngle(angle:Float, amount:Float, ?solidType:Null<com.haxepunk.SolidType>, ?sweep:Bool)
			shipImage.angle += 1;
		}

		if(Input.check("left")) {
			x -= speed;
			direction = 2;
		}

		if(Input.check("up")) {
			y -= speed;
			direction = 3;
		}

		if(Input.check("down")) {
			y += speed;
			direction = 4;
		}

		/*if(Input.check("a1")) 
		if(Input.check("a2")) 
		if(Input.check("a3")) */
	}
}