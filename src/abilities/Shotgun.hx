package abilities;

import com.haxepunk.HXP;
import com.haxepunk.Entity;

class Shotgun {
	public function new(x:Float, y:Float, a:Float) {
		HXP.scene.add(new abilities.BasicShoot(x, y, a, 300));
		HXP.scene.add(new abilities.BasicShoot(x, y, a + 6, 300));
		HXP.scene.add(new abilities.BasicShoot(x, y, a - 6, 300));
		HXP.scene.add(new abilities.BasicShoot(x, y, a - 12, 300));
		HXP.scene.add(new abilities.BasicShoot(x, y, a + 12, 300));
	}

	public static function getCost() {
		return 10;
	}
}