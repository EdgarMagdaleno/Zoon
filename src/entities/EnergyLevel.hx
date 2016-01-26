package entities;

import com.haxepunk.graphics.Text;
import com.haxepunk.Entity;

class EnergyLevel extends Entity {
	private var energy:Int;
	private var player:Player;
	private var text:Text;

	public override function new(x:Float, y:Float, e:Player) {
		super(x, y);
		player = e;
		energy = player.energy;
		text = new Text("Energy: " + Std.string(energy), 2, 2, {color:0x888800});
		graphic = text;
	}

	public override function update() {
		energy = player.energy;
		text.text = "Energy: " + Std.string(energy);
	}
}