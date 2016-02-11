package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;

class GameOver extends ScaledScene {
	private var winner:entities.Player;
	public function new(winner:entities.Player):Void {
		super();
		this.winner = winner;
	}

	public override function begin():Void {
		setBackground();
		addGraphic(new StaticImage("graphics/winner.png"), 0, 640, 50);
		var image:StaticImage = winner.shipImage;
		image.scale = 2.5;
		image.angle = 0;
		addGraphic(image, 0, 640, 360);
		var text:Text = new Text("Press Start to continue", 0 , 0);
		text.size = 40;
		text.scrollX = 0;
		addGraphic(text, 0, 380, 630);
	}

	public override function update():Void {
		super.update();
		camera.x += 2;
	}
}
