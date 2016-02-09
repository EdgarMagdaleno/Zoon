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

class Player2 extends Player {

	public override function new(x:Int, y:Int, ship:Int, s1:Int, s2:Int, s3:Int) {
		super(x, y);
		target = 1;
		life = 100;
		speed = 10;
		oSpeed = speed;
		energy = 100;
		delay = 200;

		a1 = 1;
		a2 = 4;
		a3 = 1;

		setRegen();
		setCostList();
		setGraphic(ship);
		initialize();
	}

	public function initialize() {
		type = "player2";
		name = "player2";
		angle = 0;
		lastTime = 0;
		paralyzed = false;
		slowed = false;
		HXP.scene.add(new entities.Life(1350, 5, this, true));
		HXP.scene.add(new entities.EnergyLevel(1350, 16, this, true));
	}

	public override function update() {
		if(!paralyzed) {
			if(Input.check("up")) {
				moveAtAngle(90, speed);
				angle = 90;
			}

			if(Input.check("down")) {
				moveAtAngle(270, speed);
				angle = 270;
			}

			if(Input.check("left")) {
				moveAtAngle(180, speed);
				angle = 180;
			}

			if(Input.check("right")) {
				moveAtAngle(0, speed);
				angle = 0;
			}
		
			if(Input.check("a 1")) action(0);
			if(Input.check("a 2")) action(0);
			if(Input.check("a 3")) action(0);
		}

		shipImage.angle = angle;
		super.update();
	}
}