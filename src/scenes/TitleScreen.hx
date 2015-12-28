package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.Entity;
import flash.geom.Point;
import com.haxepunk.graphics.Image;

class TitleScreen extends Scene {
	private var space:Image;
	private var b0:Backdrop;
	private var b1:Backdrop;
	private var b2:Backdrop;

	public override function begin() {
		HXP.stage.color = 0x0000000;

		b1 = new Backdrop("graphics/stars1.png", true, true);
		b1.scrollX = 0.4;
		b1.scrollY = 0.4;

		b2 = new Backdrop("graphics/stars2.png", true, true);
		b2.scrollX = 0.55;
		b2.scrollY = 0.55;

		var background:Entity = new Entity(0, 0, new Graphiclist([b1, b2]));
		add(background);
	}
}