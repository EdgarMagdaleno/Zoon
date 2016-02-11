package ;

import com.haxepunk.Entity;
import com.haxepunk.utils.Input;
import com.haxepunk.graphics.Image;

class Button extends Entity {
	private var image:Image;
	private var e:Entity;

	public override function new(x:Float, y:Float, i:Image, e:Entity) {
		super(x, y);
		this.e = e;
		image = i;
		setHitbox(Std.int(image.scaledWidth), Std.int(image.scaledHeight), 0, 0);
		centerOrigin();
		graphic = image;
	}

	public function isPressed():Bool {
		if ( distanceFrom(e) == 0) return true;
		return false;
	}
}