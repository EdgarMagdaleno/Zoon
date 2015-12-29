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
	private var shipImage:Image;
	private var speed:Int;
	private var direction:Int;
	private var ability:AbilityManager;
	private var angle:Float;

	public override function new(x:Int, y:Int, ship:Int, n:Int, s1:Int, s2:Int, s3:Int):Void {
		super(x, y);
		angle = 0;
		type = "player";
		set_name("hola");
		speed = 10;
		direction = 0;

		ability = new AbilityManager(n, s1, s2, s3);
		Input.define("forward", [Key.W]);
		Input.define("left", [Key.A]);
		Input.define("right", [Key.D]);
		Input.define("down", [Key.S]);
		Input.define("a1", [Key.Q]);
		Input.define("a2", [Key.W]);
		Input.define("a3", [Key.E]);


		shipImage = new Image("graphics/ships/ship" + ship + ".png");
		shipImage.scale = 80 / shipImage.width;
		shipImage.centerOrigin();

		setHitbox(Std.int(shipImage.scaledWidth), Std.int(shipImage.scaledHeight));
		graphic = shipImage;
	}

	public override function update():Void {
		angle = HXP.angle(x, y, Input.mouseX, Input.mouseY);
		shipImage.angle = angle;

		if(Input.check("forward")) moveTowards(Input.mouseX, Input.mouseY, speed);
		if(Input.check("right")) moveAtAngle(angle + 90, speed);
		if(Input.check("left")) moveAtAngle(angle - 90, speed);
		if(Input.mouseDown) ability.basic(x, y, angle);
		if(Input.check("a1")) ability.ability1(x, y, angle);
		if(Input.check("a2")) ability.ability2(x, y, angle);
		if(Input.check("a3")) ability.ability3(x, y, angle);
	}
}