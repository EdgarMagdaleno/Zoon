package abilities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;

class AreaOfEffect extends Entity {
	private var timeSpawn:Int;
	private var abilityImage:Image;
	private var duration:Int;

	public override function update() {
		if(flash.Lib.getTimer() - timeSpawn > duration)
			HXP.scene.remove(this);
	}

	public static function que() {
		
	}
}