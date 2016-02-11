package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.HXP;

class Explosion extends Entity {
	private var animation:Spritemap;
	private var winner:Int;
	private var e:Player;
	public override function new(winner:Int, x:Float, y:Float, e:Entity):Void {
		super(x, y);
		this.winner = winner;
		this.e = cast(e, Player);
		animation = new Spritemap("graphics/explosion.png", 128, 128);
		animation.add("core", [for(i in 0 ... 16) i], 20, false);
		animation.play("core");
		animation.centerOrigin();
		animation.scale = .70;
		graphic = animation;
	}

	public override function update():Void {
		super.update();
		Sys.sleep(.1);
		if( animation.complete ) HXP.scene = new scenes.GameOver(e);
	}
}
