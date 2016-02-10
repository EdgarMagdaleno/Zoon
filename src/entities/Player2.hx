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
import com.haxepunk.utils.Joystick;

class Player2 extends Player {

	private var gamepad:Joystick;
	private var xspeed:Float;
	private var yspeed:Float;
	private var dist:Float;

	public override function new(x:Int, y:Int, ship:Int, s1:Int, s2:Int, s3:Int, life:Int, speed:Int, energy:Int) {
		super(x, y);
		owner = 2;
		target = 1;
		life = 100;
		speed = 10;
		oSpeed = speed;
		energy = 100;
		delay = 200;

		a1 = 1;
		a2 = 4;
		a3 = 6;

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
		gamepad = Input.joystick(1);
		xspeed = 0;
		yspeed = 0;

		HXP.scene.add(new entities.Life(1275, 5, this, true));
		HXP.scene.add(new entities.EnergyLevel(1275, 16, this, true));
	}

	public override function update() {
		handleMovement();
		angle = HXP.angle(0, 0, xspeed, yspeed);
		shipImage.angle = angle;
		dist = HXP.distance(0, 0, xspeed, yspeed);
		moveAtAngle(angle, speed * dist);
		if(!paralyzed) {
			if(Input.joystick(1).check(XBOX_GAMEPAD.A_BUTTON)) action(0);
			if(Input.joystick(1).check(XBOX_GAMEPAD.X_BUTTON)) action(1);
			if(Input.joystick(1).check(XBOX_GAMEPAD.Y_BUTTON)) action(2);
			if(Input.joystick(1).check(XBOX_GAMEPAD.B_BUTTON)) {
				action(3);
		}
	}

		shipImage.angle = angle;
		super.update();
	}

	public function handleMovement():Void {
		if ( gamepad.getAxis( XBOX_GAMEPAD.LEFT_ANALOGUE_X ) != 0 )
			xspeed = gamepad.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X);
		else xspeed *= .5;

		if ( gamepad.getAxis( XBOX_GAMEPAD.LEFT_ANALOGUE_Y ) != 0 )
			yspeed = gamepad.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y);
		else yspeed *= .5;
	}
}
