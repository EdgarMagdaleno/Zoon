package ;

import com.haxepunk.graphics.Image;
import com.haxepunk.Graphic.ImageType;

class StaticImage extends Image {
	public function new(?source:ImageType, ?scale:Float = 1) {
		super(source);
		scrollX = 0;
		this.scale = scale;
		centerOrigin();
	}
}