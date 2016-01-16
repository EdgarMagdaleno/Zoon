package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;

class ShipSelectScene extends ScaledScene {
	private var ships:Map<Int, Image>;
	public override function begin() {
		setScale();
		setBackground();
		getShips();

		var red:Image = new Image("graphics/red.png");
		red.scale = 40 / red.height;
		red.scrollX = 0;
		red.centerOrigin();

		var green:Image = new Image("graphics/green.png");
		green.scale = 40 / red.height;
		green.scrollX = 0;
		green.centerOrigin();

		addGraphic(red, 0, 160, 30);
		addGraphic(green, 0, 480, 30);
		addGraphic(ships[6], 0, 100, 100);
	}

	public override function update() {
		camera.x += 2;
	}

	public function getShips() {
		var length = 6;
		var tmp:Image;
		ships = [
			for ( i in 1 ... (length + 1) ) {
				i => new Image("graphics/ships/ship" + i + ".png");
			}
		];
	}
}