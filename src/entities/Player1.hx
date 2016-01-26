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
		speed = 5;
		oSpeed = speed;
		energy = 100;
		delay = 200;

		a1 = 1;
		a2 = 1;
		a3 = 1;

		setCostList();
		setGraphic(s1);
		initialize();
	}

	public function initialize() {
		type = "player1";
		name = "player1";
		centerOrigin();
		angle = 0;
		lastTime = 0;
		paralyzed = false;
		slowed = false;
		HXP.scene.add(new entities.EnergyLevel(5, 5, this));
	}

	public override function update() {
		if(Input.check("w")) this.moveAtAngle(90, speed);
		if(Input.check("s")) this.moveAtAngle(270, speed);
		if(Input.check("a")) this.moveAtAngle(180, speed);
		if(Input.check("d")) this.moveAtAngle(0, speed);

		if(!paralyzed) {
			if(Input.check("a1")) action(0);
			if(Input.check("a2")) action(0);
			if(Input.check("a3")) action(0);
		}
	}
}