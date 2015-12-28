package entities;

import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.HXP;

class AbilityManager {
	public var owner:Int;
	public var a1:Int;
	public var a2:Int;
	public var a3:Int;

	public function new(o:Int, s1:Int, s2:Int, s3:Int):Void {
		owner = o;
		a1 = s1;
		a2 = s2;
		a3 = s3;
	}

	public function getAbility() {

	}
}	