package entities;

import com.haxepunk.graphics.Text;
import com.haxepunk.Entity;

class EnergyLevel extends Entity {
	private var energy:Int;
	private var player:PlayerMain;
	private var text:Text;

	public override function new(x:Float, y:Float, e:PlayerMain) {
		super(x, y);
		player = e;
		energy = player.energy;
		text = new Text("Energy: " + Std.string(energy), 50, 50, {color:0x888800});
		graphic = text;
	}

	public override function update() {
		energy = player.energy;
		text.text = "Energy: " + Std.string(energy);
	}
}