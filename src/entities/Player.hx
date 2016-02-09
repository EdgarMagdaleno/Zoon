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

class Player extends Entity {
	private var owner:Int;
	public var target:Int;
	public var energy:Int;
	private var shipImage:Image;
	public var life:Int;
	public var speed:Int;
	public var oSpeed:Int;

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
		mask = new Circle(20, -20, -20);
	}

	public function abilityBasic():Void {
		if(energy >= 5) {
			useAbility(0);
			energy -= 5;
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
		}
	}

	public function setCostList() {
		var costs = [
			5,
			abilities.Shotgun.getCost(),
			abilities.Reflector.getCost(),
			abilities.Paralyzer.getCost(),
			abilities.Buster.getCost(),
			abilities.Snowball.getCost(),
			abilities.Avalanche.getCost()
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
			if(energy < 100) energy += 1; 
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

	public function slow(n:Int, s:Int) {
		if(!slowed) {
			slowed = true;
			speed -= s;
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
			HXP.scene.add(new Explosion(x, y));
			HXP.scene.remove(this);
		}
	}
}