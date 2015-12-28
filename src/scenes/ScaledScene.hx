package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;

class ScaledScene extends Scene {
	public function new() {
		super();
		HXP.screen.scaleX = HXP.screen.width / 640;
		HXP.screen.scaleY = HXP.screen.height / 360;
	}
}