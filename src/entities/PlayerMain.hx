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
import com.haxepunk.masks.Circle;

class PlayerMain extends Player {
	private var shipImage:Image;

	public override function new(x:Int, y:Int, ship:Int, n:Int, s1:Int, s2:Int, s3:Int, er:Int) {
		super(x, y);
		speed = 20;
		oSpeed = speed;
		energy = 100;

		delay = 200;

		a1 = 1;
		a2 = 2;
		a3 = 6;

		setRegen(er);
		setCostList();
		setGraphic(4);
		defineInputs();
		initialize();
	}

	public function setGraphic(ship:Int) {
		centerOrigin();
		shipImage = new Image("graphics/ships/ship" + ship + ".png");
		shipImage.scale = 70 / shipImage.width;
		shipImage.centerOrigin();
		graphic = shipImage;
		mask = new Circle(40, -40, -40);
	}

	public function defineInputs() {
		Input.define("a1", [Key.Q]);
		Input.define("a2", [Key.W]);
		Input.define("a3", [Key.E]);
	}

	public function initialize() {
		type = "player";
		name = "player";
		centerOrigin();
		angle = 0;
		lastTime = 0;
		paralyzed = false;
		slowed = false;
		HXP.scene.add(new entities.EnergyLevel(20, 20, this));
	}

	public override function update() {
		angle = HXP.angle(x, y, Input.mouseX, Input.mouseY);

		if(!paralyzed) {
			shipImage.angle = angle;
			if(Input.rightMouseDown) moveTowards(Input.mouseX, Input.mouseY, speed);
			if(Input.mouseDown) action(0);
			if(Input.check("a1")) action(a1);
			if(Input.check("a2")) action(a2);
			if(Input.check("a3")) action(a3);
		}
	}
}