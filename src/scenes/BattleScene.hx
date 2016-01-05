package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Text;

class BattleScene extends ScaledScene {
	public override function begin() {
		setScale();
		add(new entities.PlayerMain(100, 100, 1, 1, 1, 2, 3, 100));
	}
}