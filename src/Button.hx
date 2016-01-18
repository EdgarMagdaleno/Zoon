package ;

import com.haxepunk.Entity;
import com.haxepunk.utils.Input;
import com.haxepunk.graphics.Image;

class Button extends Entity {
	private var image:Image;

	public override function new(x:Float, y:Float, i:Image) {
		super(x, y);
		image = i;
		setHitbox(Std.int(image.scaledWidth), Std.int(image.scaledHeight), 0, 0);
		centerOrigin();
		graphic = image;
	}

	public function isPressed():Bool {
		if (distanceToRect(Input.mouseX, Input.mouseY, .1, .1) == 0) return true;
		return false;
	}
}