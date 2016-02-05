package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.masks.Circle;
import com.haxepunk.masks.Hitbox;
import com.haxepunk.masks.Imagemask;
import flash.utils.Timer;

class ShipSelectScene extends ScaledScene {
	private var ships:Array<Image>;
	private var ships2:Array<Image>;
	private var length:Int = 6;
	private var buttonScale:Float = 0.25;

	private var lifepoints:Array<Entity>;
	private var lifepoints2:Array<Entity>;
	private var lifepoint = [5, 5];

	private var energypoints:Array<Entity>;
	private var energypoints2:Array<Entity>;
	private var energypoint = [5, 5];

	private var speedpoints:Array<Entity>;
	private var speedpoints2:Array<Entity>;
	private var speedpoint = [5, 5];

	private var point:StaticImage;
	private var nopoint:StaticImage;

	private var lifeButton:Array<Button>;
	private var energyButton:Array<Button>;
	private var speedButton:Array<Button>;
	private var shipRbutton:Array<Button>;
	private var shipLbutton:Array<Button>;
	private var lockButton:Array<Button>;

	private var shipSlider:Slider;
	private var shipSlider2:Slider;

	public override function begin() {
		setScale();
		setBackground();

		setTitle();
		getShips();
		setSliders();
		setButtons();
		setStats();

		Input.define("enter", [Key.ENTER]);
	}

	public function setTitle() {
		var red = new StaticImage("graphics/red.png");
		red.scale = 80 / red.height;
		var green = new StaticImage("graphics/green.png", 80 / red.height);

		addGraphic(red, 0, 320, 60);
		addGraphic(green, 0, 960, 60);	
	}

	public override function update() {
		camera.x += 2;

		if( lifeButton[0].isPressed() && lifepoint[0] < 10 ) lifepoint[0]++;
		if( energyButton[0].isPressed() && energypoint[0] < 10 ) energypoint[0]++;
		if( speedButton[0].isPressed() && speedpoint[0] < 10 ) speedpoint[0]++;

		if( lifeButton[0].isRightPressed() && lifepoint[0] > 0 ) lifepoint[0]--;
		if( energyButton[0].isRightPressed() && energypoint[0] > 0 ) energypoint[0]--;
		if( speedButton[0].isRightPressed() && speedpoint[0] > 0 ) speedpoint[0]--;

		if( lifeButton[1].isPressed() && lifepoint[1] < 10 ) lifepoint[1]++;
		if( energyButton[1].isPressed() && energypoint[1] < 10 ) energypoint[1]++;
		if( speedButton[1].isPressed() && speedpoint[1] < 10 ) speedpoint[1]++;

		if( lifeButton[1].isRightPressed() && lifepoint[1] > 0 ) lifepoint[1]--;
		if( energyButton[1].isRightPressed() && energypoint[1] > 0 ) energypoint[1]--;
		if( speedButton[1].isRightPressed() && speedpoint[1] > 0 ) speedpoint[1]--;
		refreshStats();

		if ( shipRbutton[0].isPressed() ) shipSlider.forward();
		if ( shipLbutton[0].isPressed() ) shipSlider.backward();

		if ( shipRbutton[1].isPressed() ) shipSlider2.forward();
		if ( shipLbutton[1].isPressed() ) shipSlider2.backward();

		if(Input.check("enter")) {
			HXP.scene = new scenes.BattleScene(shipSlider.collar.index, shipSlider2.collar.index);
		}
	}

	public function refreshStats() {
		for ( i in 0 ... 10 ) {
			if (i < lifepoint[0] ) lifepoints[i].graphic = point;
			else lifepoints[i].graphic = nopoint;

			if (i < energypoint[0] ) energypoints[i].graphic = point;
			else energypoints[i].graphic = nopoint;

			if (i < speedpoint[0] ) speedpoints[i].graphic = point;
			else speedpoints[i].graphic = nopoint;


			if (i < lifepoint[1] ) lifepoints2[i].graphic = point;
			else lifepoints2[i].graphic = nopoint;

			if (i < energypoint[1] ) energypoints2[i].graphic = point;
			else energypoints2[i].graphic = nopoint;

			if (i < speedpoint[1] ) speedpoints2[i].graphic = point;
			else speedpoints2[i].graphic = nopoint;
		}
	}

	public function setSliders() {
		shipSlider = new Slider(320, 160, ships, .5);
		shipSlider2 = new Slider(320 + 640, 160, ships2, .5);
	}

	public function setButtons() {
		lifeButton = new Array<Button>();
		energyButton = new Array<Button>();
		speedButton = new Array<Button>();
		shipRbutton = new Array<Button>();
		shipLbutton = new Array<Button>();
		lockButton = new Array<Button>();

		shipRbutton.push(new Button(400, 240, new StaticImage("graphics/shipR.png", buttonScale)));
		shipRbutton.push(new Button(400 + 640, 240, new StaticImage("graphics/shipR.png", buttonScale)));
		add(shipRbutton[0]);
		add(shipRbutton[1]);

		shipLbutton.push(new Button(240, 240, new StaticImage("graphics/shipL.png", buttonScale)));
		shipLbutton.push(new Button(240 + 640, 240, new StaticImage("graphics/shipL.png", buttonScale)));
		add(shipLbutton[0]);
		add(shipLbutton[1]);

		lockButton.push(new Button(320, 240, new StaticImage("graphics/lock.png", buttonScale)));
		lockButton.push(new Button(320 + 640, 240, new StaticImage("graphics/lock.png", buttonScale)));
		add(lockButton[0]);
		add(lockButton[1]);

		lifeButton.push(new Button(150, 300, new StaticImage("graphics/life.png", buttonScale)));
		lifeButton.push(new Button(150+ 640, 300, new StaticImage("graphics/life.png", buttonScale)));
		add(lifeButton[0]);
		add(lifeButton[1]);

		energyButton.push(new Button(150, 360, new StaticImage("graphics/energy.png", buttonScale)));
		energyButton.push(new Button(150 + 640, 360, new StaticImage("graphics/energy.png", buttonScale)));
		add(energyButton[0]);
		add(energyButton[1]);

		speedButton.push(new Button(150, 420, new StaticImage("graphics/speed.png", buttonScale)));
		speedButton.push(new Button(150 + 640, 420, new StaticImage("graphics/speed.png", buttonScale)));
		add(speedButton[0]);
		add(speedButton[1]);
	}

	public function setStats() {
		point = new StaticImage("graphics/point.png", buttonScale);
		nopoint = new StaticImage("graphics/nopoint.png", buttonScale);
		lifepoints = new Array<Entity>(); 
		lifepoints2 = new Array<Entity>();

		energypoints = new Array<Entity>();
		energypoints2 = new Array<Entity>();

		speedpoints = new Array<Entity>();
		speedpoints2 = new Array<Entity>();

		for ( i in 0 ... 10 ) {
			if (i < 5 ) {
				lifepoints.push(new Entity(214 + (i * 24), 300, point));
				lifepoints2.push(new Entity(214 + (i * 24) + 640, 300, point));
			} else {
				lifepoints.push(new Entity(214 + (i * 24), 300, nopoint));
				lifepoints2.push(new Entity(214 + (i * 24) + 640, 300, nopoint));
			}
			add(lifepoints[i]);
			add(lifepoints2[i]);

			if (i < 5 ) {
				energypoints.push(new Entity(214 + (i * 24), 360, point));
				energypoints2.push(new Entity(214 + (i * 24) + 640, 360, point));
			} else {
				energypoints.push(new Entity(214 + (i * 24), 360, nopoint));
				energypoints2.push(new Entity(214 + (i * 24) + 640, 360, nopoint));
			}
			add(energypoints[i]);
			add(energypoints2[i]);
		
			if (i < 5 ) {
				speedpoints.push(new Entity(214 + (i * 24), 420, point));
				speedpoints2.push(new Entity(214 + (i * 24) + 640, 420, point));
			} else {
				speedpoints.push(new Entity(214 + (i * 24), 420, nopoint));
				speedpoints2.push(new Entity(214 + (i * 24) + 640, 420, nopoint));
			}
			add(speedpoints[i]);
			add(speedpoints2[i]);
		}
	}

	public function getShips() {
		ships = [for( i in 0 ... length ) new StaticImage("graphics/ships/ship" + (i + 1) + ".png")];
		ships2 = [for( i in 0 ... length ) new StaticImage("graphics/ships/ship" + (i + 1) + ".png")];
	}
}