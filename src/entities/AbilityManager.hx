package entities;

import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.Engine;

class AbilityManager {
	private var owner:Int;
	private var a1:Int;
	private var a2:Int;
	private var a3:Int;

	private var cd1:Int;

	private var lastTimeBasic:Int;
	private var lastTime1:Int;
	private var lastTime2:Int;
	private var lastTime3:Int;

	public function new(o:Int, s1:Int, s2:Int, s3:Int) {
		owner = o;
		a1 = s1;
		a2 = s2;
		a3 = s3;

		lastTimeBasic = 0;
		lastTime1 = 0;
		lastTime2 = 0;
		lastTime3 = 0;
	}

	public function basic(x:Float, y:Float, angle:Float) {
		if(canUse(flash.Lib.getTimer(), lastTimeBasic, 200)) {
			HXP.scene.add(new abilities.BasicShoot(x, y, angle, owner));
			lastTimeBasic = flash.Lib.getTimer();
		}
	}

	public function ability1(x:Float, y:Float, angle:Float) {
		if(canUse(flash.Lib.getTimer(), lastTime1, 400)) {
			HXP.scene.add(new abilities.FireTackle(x, y, angle, owner));
			lastTime1= flash.Lib.getTimer();
		}
	}

	public function ability2(x:Float, y:Float, angle:Float) {

	}

	public function ability3(x:Float, y:Float, angle:Float) {
		
	}

	public function canUse(a:Float, b:Float, c:Float) {
		if(a - b > c) return true;
		else return false;
	}

	public function getCooldown(n:Int) {
		if(n == 1) return 100;
		else if(n == 2) return 200;
		else if(n == 3) return 300;
		return 0;
	}

}