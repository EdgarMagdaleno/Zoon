package scenes;

import com.haxepunk.Entity;

class Icon extends Entity {
	public var button:Int;
	public override function new(x:Float, y:Float, image:StaticImage):Void {
		super(x, y);
		graphic = image;
	}

	public override function update():Void {
		super.update();
	}

	public function isSelected(e:Entity):Bool {
		if(distanceFrom(e) == 0) return true;
		return false;
	}
}