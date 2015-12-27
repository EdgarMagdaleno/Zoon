package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.Engine;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import entities.AbilityManager;

class Player1 extends Entity {
	public var speed:Int;
	public var a1:Int;
	public var a2:Int;
	public var a3:Int;
	public var direction:Int;
	public var owner:Int;
	public var ability:AbilityManager;

	public function new(x:Int, y:Int, ship:Int):Void {
		super(x, y);
		type = "Player1";
		speed = 10;
		a1 = 1;
		a2 = 2;
		a3 = 3;
		direction = 1;
		owner = 1;

		abilities = new AbilityManager(x:Int, y:Int, a:Int, d:Int, o:Int);
		Input.define("right", [Key.D]);
		Input.define("left", [Key.A]);
		Input.define("up", [Key.W]);
		Input.define("down", [Key.S]);
		Input.define("a1", [Key.Y]);
		Input.define("a2", [Key.U]);
		Input.define("a3", [Key.I]);

		graphic = new Image("graphics/ships/ship" + ship + ".png");
	}

	public override function update():Void {
		if(Input.check("right")) {
			x += speed;
			direction = 1;
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

		if(Input.check("a1")) abilities.a1
		if(Input.check("a2")) new AbilityManager(Std.int(x), Std.int(y), a2, direction, owner);
		if(Input.check("a3")) new AbilityManager(Std.int(x), Std.int(y), a3, direction, owner);
	}
}