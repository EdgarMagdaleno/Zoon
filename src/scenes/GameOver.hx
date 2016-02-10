package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;

class GameOver extends ScaledScene {
	private var winner:Int;
	public function new(winner:Int):Void {
		super();
		this.winner = winner;
	}

	public override function begin():Void {
		setBackground();

		addGraphic(new StaticImage("graphics/winner.png"), 0, 640, 50);
	}

	public override function update():Void {
		super.update();
		camera.x += 2;
	}
}
