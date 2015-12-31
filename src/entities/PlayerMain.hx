package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.Engine;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Text;

class PlayerMain extends Player {
	private var shipImage:Image;
	private var speed:Int;

	public override function new(x:Int, y:Int, ship:Int, n:Int, s1:Int, s2:Int, s3:Int) {
		super(x, y);
		type = "player";
		name = "player";
		speed = 10;
		angle = 0;
		energy = 100;

		a1 = s1;
		a2 = s2;
		a3 = s3;
		setCostList();

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

		setHitbox(Std.int(shipImage.scaledWidth), Std.int(shipImage.scaledHeight), 0, 0);
		graphic = shipImage;
	}

	public override function update() {
		angle = HXP.angle(x, y, Input.mouseX, Input.mouseY);
		shipImage.angle = angle;
		if(Input.check("forward")) moveTowards(Input.mouseX, Input.mouseY, speed);
		if(Input.check("right")) moveAtAngle(angle + 90, speed);
		if(Input.check("left")) moveAtAngle(angle - 90, speed);

		if(Input.mouseDown) {}
		if(Input.check("a1")) ability1();
		if(Input.check("a2")) ability2();
		if(Input.check("a3")) ability3();

	}
}