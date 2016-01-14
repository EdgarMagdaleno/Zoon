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

class Player extends Entity {
	public var energy:Int;
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

	public function abilityBasic() {
		if(energy >= 5) {
			useAbility(0);
			energy -= 5;
		}	
	}

	public function ability1() {
		if(energy >= cost1) {
			useAbility(a1);
			energy -= cost1;
		}
	}

	public function ability2() {
		if(energy >= cost2) {
			useAbility(a2);
			energy -= cost2;
		}
	}

	public function ability3() {
		if(energy >= cost3) {
			useAbility(a3);
			energy -= cost3;
		}		
	}

	public function useAbility(n:Int) {
		switch (n) {
			case 0: HXP.scene.add(new abilities.BasicShoot(x, y, angle, 0));
			case 1: HXP.scene.add(new abilities.Blizzard(Input.mouseX, Input.mouseY));
			case 2: new abilities.Shotgun(x, y, angle);
			case 3: HXP.scene.add(new abilities.Reflector(x, y, angle));
			case 4: HXP.scene.add(new abilities.Paralyzer(x, y, this));
			case 5: HXP.scene.add(new abilities.Buster(x, y, angle));
			case 6: HXP.scene.add(new abilities.Snowball(x, y, angle));
		}
	}

	public function setCostList() {
		var costs = [
			abilities.BasicShoot.getCost(),
			abilities.Blizzard.getCost(),
			abilities.Shotgun.getCost(),
			abilities.Reflector.getCost(),
			0,
			0,
			0
		];

		cost1 = costs[a1];
		cost2 = costs[a2];
		cost3 = costs[a3];
	}

	public function takeDamage(n:Int) {
		life -= n;
	}

	public function setRegen(er:Int) {
		regenEnergy = new Timer(er);
		regenEnergy.run = function():Void { 
			if(energy < 100) energy += 1; 
		};	
	}

	public function paralyze(n:Int) {
		paralyzed = true;
		timerParalyze = new Timer(n);
		timerParalyze.run = function():Void { 
			paralyzed = false;
		};	
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

	public function inmune() {
		life = 100;
	}

	public function heal(n:Int) {
		life += 100 - life;
	}
}