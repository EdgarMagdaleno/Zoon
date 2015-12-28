package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.Entity;
import flash.geom.Point;
import com.haxepunk.graphics.Image;

class TitleScreen extends ScaledScene {

	private var b1:Backdrop;
	private var b2:Backdrop;
	private var background:Entity;

	private var title:Entity;
	private var titleImage:Image;

	private var play:Entity;
	private var playImage:Image;

	private var quit:Entity;
	private var quitImage:Image;

	public override function begin() {
		HXP.stage.color = 0x0000000;

		b1 = new Backdrop("graphics/stars1.png", true);
		b1.scrollX = 0.4;
		b1.scrollY = 0.4;

		b2 = new Backdrop("graphics/stars2.png", true);
		b2.scrollX = 0.6;
		b2.scrollY = 0.6;

		background = new Entity(0, 0, new Graphiclist([b1, b2]));
		background.followCamera = true;

		titleImage = new Image("graphics/entity.png");
		titleImage.scale = 560 / titleImage.width;
		titleImage.centerOrigin();

		title = new Entity(320, 80, titleImage);
		title.followCamera = true;

		play = new Entity();

		add(background);
		add(title);
	}

	public override function update() {
		camera.x += 2;
	}

}