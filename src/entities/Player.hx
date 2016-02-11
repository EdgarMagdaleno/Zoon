package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.Engine;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Text;
import com.haxepunk.masks.Circle;
import haxe.Timer;
import com.haxepunk.graphics.Particle;

class Player extends Entity {
	private var owner:Int;
	public var target:Int;
	public var energy:Int;
	public var oenergy:Int;
	public var shipImage:StaticImage;
	public var life:Int;
	public var speed:Float;
	public var oSpeed:Float;

	private var regenEnergy:Timer;
	private var delay:Int;
	private var lastTime:Int;
	private var timeNow:Int;

	private var paralyzed:Bool;
	private var timerParalyze:Timer;

	private var slowed:Bool;
	private var timerSlow:Timer;

	private var angle:Float;
	private var a1:Int;
	private var a2:Int;
	private var a3:Int;

	private var cost1:Int;
	private var cost2:Int;
	private var cost3:Int;

	public function action(n:Int) {
		timeNow = flash.Lib.getTimer();
		if(timeNow - lastTime > delay) {
			lastTime = timeNow;
			switch (n) {
				case 0: abilityBasic();
				case 1: ability1();
				case 2: ability2();
				case 3: ability3();
			}
		}
	}

	public function setGraphic(ship:Int) {
		centerOrigin();
		followCamera = true;
		shipImage = new StaticImage("graphics/ships/ship" + ship + ".png", .50);
		graphic = shipImage;
		mask = new Circle(30, -30, -30);
	}

	public function abilityBasic():Void {
		if(energy >= 4) {
			useAbility(0);
			energy -= 4;
		}	
	}

	public function ability1():Void {
		if(energy >= cost1) {
			useAbility(a1);
			energy -= cost1;
		}
	}

	public function ability2():Void {
		if(energy >= cost2) {
			useAbility(a2);
			energy -= cost2;
		}
	}

	public function ability3():Void {
		if(energy >= cost3) {
			useAbility(a3);
			energy -= cost3;
		}		
	}

	public function useAbility(n:Int) {
		switch (n) {
			case 0: HXP.scene.add(new abilities.BasicShoot(target, x, y, angle, 0));
			case 1: new abilities.Shotgun(target, x, y, angle);
			case 2: HXP.scene.add(new abilities.Reflector(x, y, angle));
			case 3: HXP.scene.add(new abilities.Paralyzer(target, x, y, this));
			case 4: HXP.scene.add(new abilities.Buster(target, x, y, angle));
			case 5: HXP.scene.add(new abilities.Snowball(target, x, y, angle));
			case 6: new abilities.Avalanche(target, x, y , angle);
			case 7: HXP.scene.add(new abilities.FireTackle(target, x, y, angle, this));
		}
	}

	public function setCostList() {
		var costs = [
			4,
			abilities.Shotgun.getCost(),
			abilities.Reflector.getCost(),
			abilities.Paralyzer.getCost(),
			abilities.Buster.getCost(),
			abilities.Snowball.getCost(),
			abilities.Avalanche.getCost(),
			abilities.FireTackle.getCost()
		];

		cost1 = costs[a1];
		cost2 = costs[a2];
		cost3 = costs[a3];
	}

	public function takeDamage(n:Int) {
		life -= n;
	}

	public function setRegen() {
		regenEnergy = new Timer(100);
		regenEnergy.run = function():Void { 
			if(energy < oenergy) energy += 1; 
		};	
	}

	public function paralyze(n:Int) {
		if ( !paralyzed ) {
			paralyzed = true;
			timerParalyze = new Timer(n);
			timerParalyze.run = function():Void { 
				paralyzed = false;
			};
		}
	}

	public function slow(n:Int, s:Float) {
		if(!slowed) {
			slowed = true;
			speed -= s;
			if(speed < 0) speed = .5;
			timerSlow = new Timer(n);
			timerSlow.run = function():Void {
				speed = oSpeed;
				slowed = false;
			};		
		}
	}

	public function speedUp(n:Int, s:Int) {
		speed += n;
		var speedUpTimer = new Timer(s);
		speedUpTimer.run = function():Void {
			speed -= n;
		};	
	}

	public override function update():Void {
		if ( life <= 0 ) {
			HXP.scene.add(new Explosion(target, x, y, HXP.scene.getInstance("player" + target)));
			HXP.scene.remove(this);
		}

		if( y + 19 > 720 ) y = 700;
		if( y - 19 < 0 ) y = 19;
		if( x - 19 < 0 ) x = 19;
		if( x + 19 > 1280 ) x = 1261;
		super.update();
	}
}