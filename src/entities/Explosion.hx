package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.HXP;

class Explosion extends Entity {
	var animation:Spritemap;

	public override function new(x:Float, y:Float):Void {
		super(x, y);
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
		if(!animation.active) HXP.scene.remove(this);
	}
}