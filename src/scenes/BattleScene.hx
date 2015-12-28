package scenes;

import com.haxepunk.Scene;

class BattleScene extends ScaledScene {
	public override function begin() {
		add(new entities.Player1(20, 20, 1, 1, 1, 2, 3));
	}
}