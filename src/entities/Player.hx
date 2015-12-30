package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.Engine;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class Player extends Entity {
	private var angle:Float;
	private var a1:Int;
	private var a2:Int;
	private var a3:Int;

	private var lastTime1:Int;
	private var lastTime2:Int;
	private var lastTime3:Int;

	private var cooldowns:List<Int>;

	public function ability1() {
		if(canUse(flash.Lib.getTimer(), lastTime1, 100)) {
			useAbility(a1);
			lastTime1 = flash.Lib.getTimer();
		}
	}

	public function ability2() {
		if(canUse(flash.Lib.getTimer(), lastTime2, 200)) {
			useAbility(a2);
			lastTime2 = flash.Lib.getTimer();
		}
	}

	public function ability3() {
		if(canUse(flash.Lib.getTimer(), lastTime3, 300)) {
			useAbility(a3);
			lastTime3 = flash.Lib.getTimer();
		}
	}

	public function useAbility(n:Int) {
		switch (n) {
			case 0: HXP.scene.add(new abilities.BasicShoot(x, y, angle));
			case 1: HXP.scene.add(new abilities.Blizzard(Input.mouseX, Input.mouseY));
		}
	}

	public function canUse(a:Float, b:Float, c:Float) {
		if(a - b > c) return true;
		else return false;
	}

	public function setCooldownList() {

	}
}