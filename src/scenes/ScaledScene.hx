package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Graphiclist;

class ScaledScene extends Scene {
	public function setScale() {

	}

	public function setBackground() {
		var b1:Backdrop;
		var b2:Backdrop;
		var background:Entity;

		HXP.stage.color = 0x0000000;

		b1 = new Backdrop("graphics/stars1.png", true);
		b1.scrollX = 0.4;
		b1.scale = 1.2;

		b2 = new Backdrop("graphics/stars2.png", true);
		b2.scrollX = 0.6;
		b2.scale = 1.2;

		background = new Entity(0, 0, new Graphiclist([b1, b2]));
		background.followCamera = true;
		add(background);
	}
}