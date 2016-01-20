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
	private var p1index:Int;
	private var p2index:Int;
	private var ships:Array<Image>;
	private var ships2:Array<Image>;
	private var length:Int = 6;
	private var buttonScale:Float = 0.125;

	private var lifepoints:Array<Entity>;
	private var lifepoint:Int = 5;

	private var energypoints:Array<Entity>;
	private var energypoint:Int = 3;

	private var speedpoints:Array<Entity>;
	private var speedpoint:Int = 0;

	private var point:StaticImage;
	private var nopoint:StaticImage;

	private var lifeButton:Button;
	private var energyButton:Button;
	private var speedButton:Button;
	private var shipRbutton:Button;
	private var shipLbutton:Button;
	private var lockButton:Button;

	private var lifeButton2:Button;
	private var energyButton2:Button;
	private var speedButton2:Button;
	private var shipRbutton2:Button;
	private var shipLbutton2:Button;
	private var lockButton2:Button;

	private var shipSlider:Slider;
	private var shipSlider2:Slider;

	public override function begin() {
		setScale();
		setBackground();
		p1index = 0;

		setTitle();
		getShips();
		setSliders();
		setButtons();
		setStats();
	}

	public function setTitle() {
		var red = new StaticImage("graphics/red.png");
		red.scale = 40 / red.height;
		var green = new StaticImage("graphics/green.png", 40 / red.height);

		addGraphic(red, 0, 160, 30);
		addGraphic(green, 0, 480, 30);	
	}

	public override function update() {
		camera.x += 2;

		if( lifeButton.isPressed() ) lifepoint++;
		if( energyButton.isPressed() ) energypoint++;
		if( speedButton.isPressed() ) speedpoint++;

		if( lifeButton.isRightPressed() ) lifepoint--;
		if( energyButton.isRightPressed() ) energypoint--;
		if( speedButton.isRightPressed() ) speedpoint--;
		refreshStats();

		if ( shipRbutton.isPressed() ) shipSlider.forward();
		if ( shipLbutton.isPressed() ) shipSlider.backward();
	}

	public function refreshStats() {
		for ( i in 0 ... 10 )
			if (i < lifepoint ) lifepoints[i].graphic = point;
			else lifepoints[i].graphic = nopoint;

		for ( i in 0 ... 10 )
			if (i < energypoint ) energypoints[i].graphic = point;
			else energypoints[i].graphic = nopoint;

		for ( i in 0 ... 10 )
			if (i < speedpoint ) speedpoints[i].graphic = point;
			else speedpoints[i].graphic = nopoint;
	}

	public function setSliders() {
		shipSlider = new Slider(160, 80, ships, .25);
		shipSlider2 = new Slider(480, 80, ships2, .25);
	}

	public function setButtons() {
		shipRbutton = new Button(200, 120, new StaticImage("graphics/shipR.png", buttonScale));
		shipRbutton2 = new Button(200 + 320, 120, new StaticImage("graphics/shipR.png", buttonScale));
		add(shipRbutton);
		add(shipRbutton2);

		shipLbutton = new Button(120, 120, new StaticImage("graphics/shipL.png", buttonScale));
		shipLbutton2 = new Button(120 + 320, 120, new StaticImage("graphics/shipL.png", buttonScale));
		add(shipLbutton);
		add(shipLbutton2);

		lockButton = new Button(160, 120, new StaticImage("graphics/lock.png", buttonScale));
		lockButton2 = new Button(160 + 320, 120, new StaticImage("graphics/lock.png", buttonScale));
		add(lockButton);
		add(lockButton2);

		lifeButton = new Button(50, 150, new StaticImage("graphics/life.png", buttonScale));
		lifeButton2 = new Button(50 + 320, 150, new StaticImage("graphics/life.png", buttonScale));
		add(lifeButton);
		add(lifeButton2);

		energyButton = new Button(50, 180, new StaticImage("graphics/energy.png", buttonScale));
		energyButton2 = new Button(50 + 320, 180, new StaticImage("graphics/energy.png", buttonScale));
		add(energyButton);
		add(energyButton2);

		speedButton = new Button(50, 210, new StaticImage("graphics/speed.png", buttonScale));
		speedButton2 = new Button(50 + 320, 210, new StaticImage("graphics/speed.png", buttonScale));
		add(speedButton);
		add(speedButton2);
	}

	public function setStats() {
		point = new StaticImage("graphics/point.png", buttonScale);
		nopoint = new StaticImage("graphics/nopoint.png", buttonScale);
		lifepoints = new Array<Entity>();
		energypoints = new Array<Entity>();
		speedpoints = new Array<Entity>();

		for ( i in 0 ... 10) {
			if ( i < lifepoint ) lifepoints.push(new Entity(80 + (i * 12), 150, point));
			else lifepoints.push(new Entity(80 + (i * 12), 150, nopoint));
			add(lifepoints[i]);
		}

		for ( i in 0 ... 10) {
			if ( i < energypoint ) energypoints.push(new Entity(80 + (i * 12), 180, point));
			else energypoints.push(new Entity(80 + (i * 12), 180, nopoint));
			add(energypoints[i]);
		}

		for ( i in 0 ... 10) {
			if ( i < speedpoint ) speedpoints.push(new Entity(80 + (i * 12), 210, point));
			else speedpoints.push(new Entity(80 + (i * 12), 210, nopoint));
			add(speedpoints[i]);
		}
	}

	public function getShips() {
		ships = new Array<Image>();
		ships2 = new Array<Image>();
		for ( i in 0 ... length ) {
			ships.push(new StaticImage("graphics/ships/ship" + (i + 1) + ".png"));
			ships2.push(new StaticImage("graphics/ships/ship" + (i + 1) + ".png"));
		}
	}
}