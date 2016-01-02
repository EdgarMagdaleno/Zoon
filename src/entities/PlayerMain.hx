package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.Engine;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Text;
import haxe.Timer;

class PlayerMain extends Player {
	private var shipImage:Image;
	private var speed:Int;

	public override function new(x:Int, y:Int, ship:Int, n:Int, s1:Int, s2:Int, s3:Int, er:Int) {
		super(x, y);
		speed = 10;
		energy = 100;
		delay = 200;

		a1 = s1;
		a2 = s2;
		a3 = s3;

		setRegen(er);
		setCostList();
		setGraphic(ship);
		defineInputs();
		initialize();
	}

	public function setGraphic(ship:Int) {
		shipImage = new Image("graphics/ships/ship" + ship + ".png");
		shipImage.scale = 80 / shipImage.width;
		shipImage.centerOrigin();

		setHitbox(Std.int(shipImage.scaledWidth), Std.int(shipImage.scaledHeight), 0, 0);
		graphic = shipImage;
	}

	public function setRegen(er:Int) {
		regenEnergy = new Timer(er);
		regenEnergy.run = function():Void { 
			if(energy < 100) energy += 1; 
		};	
	}

	public function defineInputs() {
		Input.define("a1", [Key.Q]);
		Input.define("a2", [Key.W]);
		Input.define("a3", [Key.E]);		
	}

	public function initialize() {
		type = "player";
		name = "player";
		angle = 0;
		lastTime = 0;
	}

	public override function update() {
		angle = HXP.angle(x, y, Input.mouseX, Input.mouseY);
		shipImage.angle = angle;

		if(Input.rightMouseDown) moveTowards(Input.mouseX, Input.mouseY, speed);
		if(Input.mouseDown) action(0);
		if(Input.check("a1")) action(1);
		if(Input.check("a2")) action(2);
		if(Input.check("a3")) action(3);
	}
}