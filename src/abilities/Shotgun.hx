package abilities;

import com.haxepunk.HXP;
import com.haxepunk.Entity;

class Shotgun {
	public function new(x:Float, y:Float, a:Float) {
		HXP.scene.add(new abilities.BasicShoot(x, y, a));
		HXP.scene.add(new abilities.BasicShoot(x, y, a + 10));
		HXP.scene.add(new abilities.BasicShoot(x, y, a - 10));
		HXP.scene.add(new abilities.BasicShoot(x, y, a - 20));
		HXP.scene.add(new abilities.BasicShoot(x, y, a + 20));
	}

	public static function getCost() {
		return 10;
	}
}