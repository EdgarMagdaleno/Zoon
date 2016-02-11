package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.Entity;

class BattleScene extends ScaledScene {

	private var s1:Int;
	private var s2:Int;
	private var l1:Int;
	private var l2:Int;
	private var e1:Int;
	private var e2:Int;
	private var sp1:Int;
	private var sp2:Int;
	private var a1:Int;
	private var a2:Int;
	private var a3:Int;
	private var a12:Int;
	private var a22:Int;
	private var a32:Int;
	public function new(s1:Int, s2:Int, l1:Int, l2:Int, e1:Int, e2:Int, sp1:Int, sp2:Int, a1:Int, a12:Int, a2:Int, a22:Int, a3:Int, a32:Int) {
		super();
		this.s1 = s1;
		this.s2 = s2;
		this.l1 = l1;
		this.l2 = l2;
		this.e1 = e1;
		this.e2 = e2;
		this.sp1 = sp1;
		this.sp2 = sp2;
		this.a1 = a1;
		this.a2 = a2;
		this.a3 = a3;
		this.a12 = a12;
		this.a22 = a22;
		this.a32 = a32;
	}

	public override function begin() {
		setScale();
		setBackground();

		add(new entities.Player1(100, 100, s1 + 1, a1, a2, a3, l1, e1, sp1));
		add(new entities.Player2(200, 200, s2 + 1, a12, a22, a32, l2, e2, sp2));
	}

	public override function update() {
		super.update();
	}
}
