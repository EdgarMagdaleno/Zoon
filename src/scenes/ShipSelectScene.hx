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
	private var length:Int = 6;
	private var buttonScale:Float;

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

	private var shipSlider:Slider;

	public override function begin() {
		setScale();
		setBackground();
		p1index = 0;

		setTitle();
		getShips();
		setSlider();
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

	public function setSlider() {
		shipSlider = new Slider(160, 80, ships, .25);
	}

	public function setButtons() {
		var shipR:Image = new Image("graphics/shipR.png");
		buttonScale = shipR.scale = 22 / shipR.height;
		shipR.centerOrigin();
		shipR.scale = buttonScale;
		shipR.scrollX = 0;

		var shipL:Image = new Image("graphics/shipL.png");
		shipL.centerOrigin();
		shipL.scale = buttonScale;
		shipL.scrollX = 0;

		var lock:Image = new Image("graphics/lock.png");
		lock.centerOrigin();
		lock.scale = buttonScale;
		lock.scrollX = 0;

		shipRbutton = new Button(200, 120, shipR);
		add(shipRbutton);

		shipLbutton = new Button(120, 120, shipL);
		add(shipLbutton);

		lockButton = new Button(160, 120, lock);
		add(lockButton);
	}

	public function setStats() {
		var life = new StaticImage("graphics/life.png", buttonScale);
		var energy = new StaticImage("graphics/energy.png", buttonScale);
		var speed = new StaticImage("graphics/speed.png", buttonScale);
		point = new StaticImage("graphics/point.png", buttonScale);
		nopoint = new StaticImage("graphics/nopoint.png", buttonScale);

		lifepoints = new Array<Entity>();
		energypoints = new Array<Entity>();
		speedpoints = new Array<Entity>();

		for ( i in 0 ... 10) {
			if ( i < lifepoint ) lifepoints[i] = new Entity(80 + (i * 12), 150, point);
			else lifepoints[i] = new Entity(80 + (i * 12), 150, nopoint);
			add(lifepoints[i]);
		}

		for ( i in 0 ... 10) {
			if ( i < energypoint ) energypoints[i] = new Entity(80 + (i * 12), 180, point);
			else energypoints[i] = new Entity(80 + (i * 12), 180, nopoint);
			add(energypoints[i]);
		}

		for ( i in 0 ... 10) {
			if ( i < speedpoint ) speedpoints[i] = new Entity(80 + (i * 12), 210, point);
			else speedpoints[i] = new Entity(80 + (i * 12), 210, nopoint);
			add(speedpoints[i]);
		}

		lifeButton = new Button(50, 150, life);
		add(lifeButton);

		energyButton = new Button(50, 180, energy);
		add(energyButton);

		speedButton = new Button(50, 210, speed);
		add(speedButton);
	}

	public function getShips() {
		ships = new Array<Image>();
		var tmp:Image;
		for ( i in 0 ... length ) {
			tmp = new Image("graphics/ships/ship" + (i + 1) + ".png");
			tmp.centerOrigin();
			tmp.scrollX = 0;
			ships.push(tmp);
		}
	}
}