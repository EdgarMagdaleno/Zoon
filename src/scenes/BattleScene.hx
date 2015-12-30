package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;

class BattleScene extends ScaledScene {
	public override function begin() {
		setScale();
		hola();
		add(new entities.PlayerMain(100, 100, 1, 1, 1, 2, 3));
	}
}