package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Backdrop;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.Entity;
import flash.geom.Point;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

class TitleScreen extends ScaledScene {

	private var b1:Backdrop;
	private var b2:Backdrop;
	private var background:Entity;

	private var title:Entity;
	private var titleImage:Image;

	private var createb:Entity;
	private var createImage:Image;

	private var join:Entity;
	private var joinImage:Image;

	private var exit:Entity;
	private var exitImage:Image;

	public override function begin() {
		setScale();
		setBackground();

		titleImage = new Image("graphics/entity.png");
		titleImage.scale = 80 / titleImage.height;
		titleImage.centerOrigin();

		title = new Entity(320, 80, titleImage);
		title.followCamera = true;

		createImage = new Image("graphics/create.png");
		var buttonScale = 60 / createImage.height;
		createImage.scale = buttonScale;
		createImage.centerOrigin();

		createb = new Entity(320, 170, createImage);
		createb.followCamera = true;


		joinImage = new Image("graphics/join.png");
		joinImage.scale = buttonScale;
		joinImage.centerOrigin();

		join = new Entity(320, 240, joinImage);
		join.followCamera = true;


		exitImage = new Image("graphics/exit.png");
		exitImage.scale = buttonScale;
		exitImage.centerOrigin();

		exit = new Entity(320, 310, exitImage);
		exit.followCamera = true;

		add(title);
		add(createb);
		add(join);
		add(exit);
	}

	public override function update() {
		camera.x += 2;
	}

}