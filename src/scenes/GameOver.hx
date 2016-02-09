package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;

class GameOver extends ScaledScene {
	public function new(target:Int):Void {
		super();
	}

	public override function begin():Void {
		setBackground();
		trace(HXP.screen.width);
		addGraphic(new StaticImage("graphics/winner.png"), 0, 640, 50);
	}
}
