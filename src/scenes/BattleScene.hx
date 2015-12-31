package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Text;

class BattleScene extends ScaledScene {
	private var player:entities.PlayerMain;
	private var energy:Text;

	public override function begin() {
		setScale();
		player = new entities.PlayerMain(100, 100, 1, 1, 1, 2, 3);
		energy = new Text("Energy: ", 20, 20, 100, 50, {color:0x888800});
		add(player);
		addGraphic(energy);
	}

	public override function update() {
		loadHUD();
		super.update();
	}

	public function loadHUD() {
		energy.text = ("Energy: " + player.energy);
	}
}