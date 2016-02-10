package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class BattleScene extends ScaledScene {

	private var s1:Int;
	private var s2:Int;
	private var scene:ScaledScene;

	public function new(s1:Int, s2:Int, scene:ScaledScene) {
		super();
		defineInputs();
		this.s1 = s1;
		this.s2 = s2;
	}

	public override function begin() {
		setScale();
		setBackground();
		add(new entities.Player1(100, 100, s1 + 1, 1, 1, 1, 100, 100, 10));
		add(new entities.Player2(200, 200, s2 + 1, 1, 1, 1, 100, 100, 10));
	}

	public override function update() {
		super.update();
	}

	public function defineInputs() {
		Input.define("a1", [Key.Y]);
		Input.define("a2", [Key.U]);
		Input.define("a3", [Key.I]);
		Input.define("w", [Key.W]);
		Input.define("a", [Key.A]);
		Input.define("s", [Key.S]);
		Input.define("d", [Key.D]);

		Input.define("a 1", [Key.NUMPAD_1]);
		Input.define("a 2", [Key.NUMPAD_2]);
		Input.define("a 3", [Key.NUMPAD_3]);
		Input.define("up", [Key.UP]);
		Input.define("left", [Key.LEFT]);
		Input.define("down", [Key.DOWN]);
		Input.define("right", [Key.RIGHT]);
	}
}
