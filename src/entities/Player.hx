package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.Engine;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Text;

class Player extends Entity {
	public var energy:Int;

	private var angle:Float;
	private var a1:Int;
	private var a2:Int;
	private var a3:Int;

	private var cost1:Int;
	private var cost2:Int;
	private var cost3:Int;

	public function abilityBasic() {

	}

	public function ability1() {
		if(canUse(cost1, energy)) {
			useAbility(a1);
			energy -= cost1;
		}
	}

	public function ability2() {

	}

	public function ability3() {

	}

	public function useAbility(n:Int) {
		switch (n) {
			case 0: HXP.scene.add(new abilities.BasicShoot(Input.mouseX, Input.mouseY, angle));
			case 1: HXP.scene.add(new abilities.Blizzard(Input.mouseX, Input.mouseY));
		}
	}

	public function canUse(a:Int, b:Int) {
		if(b < a) return false;
		else return true;
	}

	public function setCostList() {
		var costs = [
			abilities.BasicShoot.getCost(),
			abilities.Blizzard.getCost()
		];

		cost1 = costs[a1];
		cost2 = costs[a2];
		cost3 = costs[a3];
	}
}