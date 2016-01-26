package abilities;

import com.haxepunk.HXP;
import com.haxepunk.Entity;

class Shotgun {
	public function new(o:Int, x:Float, y:Float, a:Float) {
		HXP.scene.add(new abilities.BasicShoot(o, x, y, a, 300));
		HXP.scene.add(new abilities.BasicShoot(o, x, y, a + 6, 300));
		HXP.scene.add(new abilities.BasicShoot(o, x, y, a - 6, 300));
		HXP.scene.add(new abilities.BasicShoot(o, x, y, a - 12, 300));
		HXP.scene.add(new abilities.BasicShoot(o, x, y, a + 12, 300));
	}

	public static function getCost() {
		return 10;
	}
}