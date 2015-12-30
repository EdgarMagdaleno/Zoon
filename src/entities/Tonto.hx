package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.Engine;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class Tonto extends Entity {

	public function basic() {
		/*if(canUse(flash.Lib.getTimer(), lastTimeBasic, 200)) {
			HXP.scene.add(new abilities.BasicShoot(x, y, angle, owner));
			lastTimeBasic = flash.Lib.getTimer();
		}*/
	}

	public function hola() {
		
	}

	public function ability1(x:Float, y:Float, angle:Float) {
		//if(canUse(flash.Lib.getTimer(), lastTime1, 400)) {
			HXP.scene.add(new abilities.FireTackle(x, y, angle, owner));
			//lastTime1= flash.Lib.getTimer();
		//}
	}

	public function ability2(x:Float, y:Float) {
		HXP.scene.add(new abilities.Blizzard(x, y));
	}

	public function ability3(x:Float, y:Float, angle:Float) {
		
	}

	public function canUse(a:Float, b:Float, c:Float) {
		if(a - b > c) return true;
		else return false;
	}
}