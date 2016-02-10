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
import com.haxepunk.utils.Joystick;

class Player1 extends Player {

	private var gamepad:Joystick;
	private var xspeed:Float;
	private var yspeed:Float;
	private var dist:Float;

	public override function new(x:Int, y:Int, ship:Int, s1:Int, s2:Int, s3:Int) {
		super(x, y);
		owner = 1;
		target = 2;
		life = 180;
		speed = 7;
		oSpeed = speed;
		energy = 100;
		delay = 200;

		a1 = 1;
		a2 = 6;
		a3 = 7;

		setRegen();
		setCostList();
		setGraphic(ship);
		initialize();
	}

	public function initialize() {
		type = "player1";
		name = "player1";
		angle = 0;
		lastTime = 0;
		paralyzed = false;
		slowed = false;
		gamepad = Input.joystick(0);
		xspeed = 0;
		yspeed = 0;

		HXP.scene.add(new entities.Life(5, 6, this));
		HXP.scene.add(new entities.EnergyLevel(5, 17, this));
	}

	public override function update() {
		super.update();
		handleMovement();
		angle = HXP.angle(0, 0, xspeed, yspeed);
		shipImage.angle = angle;
		dist = HXP.distance(0, 0, xspeed, yspeed);
		moveAtAngle(angle, speed * dist);

		if(!paralyzed) {
			if(Input.joystick(0).check(XBOX_GAMEPAD.A_BUTTON)) action(0);
			if(Input.joystick(0).check(XBOX_GAMEPAD.X_BUTTON)) action(1);
			if(Input.joystick(0).check(XBOX_GAMEPAD.Y_BUTTON)) action(2);
			if(Input.joystick(0).check(XBOX_GAMEPAD.B_BUTTON)) {
				action(3);
			}
		}
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
