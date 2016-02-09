package abilities;

import com.haxepunk.HXP;
import com.haxepunk.Entity;

class Avalanche {
	public function new(target:Int, x:Float, y:Float, a:Float):Void {
		HXP.scene.add(new abilities.Snowball(target, x, y, a + 45, 150));
		HXP.scene.add(new abilities.Snowball(target, x, y, a + 90, 150));
		HXP.scene.add(new abilities.Snowball(target, x, y, a + 135, 150));
		HXP.scene.add(new abilities.Snowball(target, x, y, a + 180, 150));
		HXP.scene.add(new abilities.Snowball(target, x, y, a + 225, 150));
		HXP.scene.add(new abilities.Snowball(target, x, y, a + 270, 150));
		HXP.scene.add(new abilities.Snowball(target, x, y, a + 315, 150));
		HXP.scene.add(new abilities.Snowball(target, x, y, a - 180, 150));
		HXP.scene.add(new abilities.Snowball(target, x, y, a, 150));
	}

	public static function getCost():Int {
		return 20;
	}
}