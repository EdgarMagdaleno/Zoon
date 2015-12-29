package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;

class ScaledScene extends Scene{
	public inline function setScale() {
		HXP.screen.scaleX = HXP.screen.width / 640;
		HXP.screen.scaleY = HXP.screen.height / 360;
	}
}