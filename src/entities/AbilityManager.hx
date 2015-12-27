package entities;

import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.HXP;

class AbilityManager {
	private var timeNow:Int;
	private var a1CD:Int = abilities.BasicShoot.cooldown;
	/*private var a2CD:Int;
	private var a3CD:Int;*/

	private var a1LastTime:Int;*/

	public function new(x:Int, y:Int, a:Int, d:Int, o:Int):Void {
		var timeNow:Int = flash.Lib.getTimer();
		if(a == 1) HXP.scene.add(new abilities.BasicShoot(Std.int(x), Std.int(y), d, o));
		else if(a == 2) HXP.scene.add(new abilities.Slower(Std.int(x), Std.int(y), d, o));
		else if(a == 3) HXP.scene.add(new abilities.Paralyzer(Std.int(x), Std.int(y), d, o));
	}

	public function canUse(a:Int, b:Int, c:Int) {
		if(a > b) return true;
		else return false;
	}

	public function a1(x:Int, y:Int) {

	}
}