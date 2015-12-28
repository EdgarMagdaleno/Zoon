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
	public var angle:Float;

	public override function new(x:Int, y:Int, ship:Int, n:Int, s1:Int, s2:Int, s3:Int):Void {
		super();
		angle = 0;
		type = "P" + n;

		speed = 10;
		direction = 0;

		ability = new AbilityManager(n, s1, s2, s3);
		Input.define("forward", [Key.W]);
		Input.define("left", [Key.A]);
		Input.define("right", [Key.D]);
		Input.define("down", [Key.S]);
		Input.define("a1", [Key.Y]);
		Input.define("a2", [Key.U]);
		Input.define("a3", [Key.I]);

		
		shipImage = new Image("graphics/ships/ship" + ship + ".png");
		graphic = shipImage;
		shipImage.centerOrigin();
	}

	public override function update():Void {
		if(Input.check("forward")) {
			moveAtAngle(angle, 10, true);
		}

		if(Input.check("right")) {
			angle -= 5;
		}
		if(Input.check("left")) angle += 5;

		/*if(Input.check("a1")) 
		if(Input.check("a2")) 
		if(Input.check("a3")) */

		shipImage.angle = angle;
	}
}