package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class BattleScene extends ScaledScene {

	private var s1:Int;
	private var s2:Int;

	public function new(s1:Int, s2:Int) {
		super();
		defineInputs();
		this.s1 = s1;
		this.s2 = s2;
	}

	public override function begin() {
		setScale();
		setBackground();
		add(new entities.Player1(100, 100, 1, 1, 1, 1));
		add(new entities.Player2(200, 200, 2, 1, 1, 1));
	}

	public override function update() {
		camera.x += 2;
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