package ;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;
import com.haxepunk.HXP;
import flash.geom.Point;
import Collar;

class Slider extends Entity {
	private var images:Array<Image>;
	private var entities:Array<Entity>;
	private var scale:Float;
	public var index:Int;
	private var origin:Point;
	private var collar:Collar;

	public function new(x:Float, y:Float, arr:Array<Image>, ?scale:Float = 1) {
		super(x, y);
		origin = new Point(x, y);
		images = arr;
		this.scale = scale;

		index = 0;
		setUp();
	}

	public function setUp() {
		for ( i in 0 ... images.length ) {
			images[i].centerOrigin();
			images[i].scale = scale;
		}

		collar = new Collar(this.images);
		entities = new Array<Entity>();

		var tmp:Image;

		tmp = collar.previous();
		tmp.alpha = .5;
		tmp.scale = scale * .66;
		entities.push(new Entity(x - collar.get().scaledWidth - 10, y, tmp));

		tmp = collar.previous(2);
		tmp.alpha = .2;
		tmp.scale = scale * .5;
		entities.push(new Entity(x - collar.get().scaledWidth - 10 - collar.previous().scaledWidth - 10, y, tmp));

		entities.push(new Entity(x, y, collar.get()));

		tmp = collar.next();
		tmp.alpha = .5;
		tmp.scale = scale * .66;
		entities.push(new Entity(x + collar.get().scaledWidth + 10, y, tmp));

		tmp = collar.next(2);
		tmp.alpha = .2;
		tmp.scale = scale * .5;
		entities.push(new Entity(x + collar.get().scaledWidth + 10 + collar.next().scaledWidth + 10, y, tmp));

		HXP.scene.add(entities[0]);
		HXP.scene.add(entities[1]);	
		HXP.scene.add(entities[2]);
		HXP.scene.add(entities[3]);
		HXP.scene.add(entities[4]);
	}

	public function forward() {
		collar.nextIndex();
		refresh();
	}

	public function backward() {
		collar.previousIndex();
		refresh();
	}

	public function refresh() {
		var tmp:Image;

		tmp = collar.previous();
		tmp.alpha = .5;
		tmp.scale = scale * .66;
		entities[0].graphic = tmp;

		tmp = collar.previous(2);
		tmp.alpha = .2;
		tmp.scale = scale * .5;
		entities[1].graphic = tmp;

		tmp = collar.get();
		tmp.alpha = 1;
		tmp.scale = scale;
		entities[2].graphic = collar.get();

		tmp = collar.next();
		tmp.alpha = .5;
		tmp.scale = scale * .66;
		entities[3].graphic = tmp;

		tmp = collar.next(2);
		tmp.alpha = .2;
		tmp.scale = scale * .5;
		entities[4].graphic	= tmp;		
	}
}