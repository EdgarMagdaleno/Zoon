package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.Engine;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.graphics.Text;
import haxe.Timer;
import com.haxepunk.masks.Circle;

class Player1 extends Player {

	public override function new(x:Int, y:Int, ship:Int, s1:Int, s2:Int, s3:Int) {
		super(x, y);
		target = 2;
		life = 100;
		speed = 5;
		oSpeed = speed;
		energy = 100;
		delay = 200;

		a1 = 1;
		a2 = 1;
		a3 = 1;

		setRegen();
		setCostList();
		setGraphic(s1);
		initialize();
	}

	public function initialize() {
		type = "player1";
		name = "player1";
		angle = 0;
		lastTime = 0;
		paralyzed = false;
		slowed = false;

		HXP.scene.add(new entities.Life(5, 5, this));
		HXP.scene.add(new entities.EnergyLevel(5, 15, this));
	}

	public override function update() {
		if(Input.check("w")) {
			moveAtAngle(90, speed);
			angle = 90;
		}

		if(Input.check("s")) {
			moveAtAngle(270, speed);
			angle = 270;
		}

		if(Input.check("a")) {
			moveAtAngle(180, speed);
			angle = 180;
		}

		if(Input.check("d")) {
			moveAtAngle(0, speed);
			angle = 0;
		}

		if(!paralyzed) {
			if(Input.check("a1")) action(0);
			if(Input.check("a2")) action(0);
			if(Input.check("a3")) action(0);
		}

		shipImage.angle = angle;
		super.update();
	}
}