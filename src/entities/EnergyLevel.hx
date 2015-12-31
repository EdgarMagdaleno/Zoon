package entities;

import com.haxepunk.graphics.Text;
import com.haxepunk.Entity;

class EnergyLevel extends Entity {
	private var energy:Int;

	public override function new(x:Float, y:Float) {
		super(x, y);
		energy = 0;
		graphic = new Text("Energy: " + Std.string(energy), 50, 50, {color:0x888800});
	}
}