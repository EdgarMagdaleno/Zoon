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

class ShipSelectScene extends ScaledScene {
	private var p1index:Int;
	private var p2index:Int;
	private var ships = [];
	private var length:Int = 6;
	private var slider:Graphiclist;
	private var sliders = [];
	private var buttonScale:Float;

	private var lifepoints = [];
	private var lifepoint:Int = 5;

	private var energypoints = [];
	private var energypoint:Int = 3;

	private var speedpoints = [];
	private var speedpoint:Int = 0;

	private var point:Image;
	private var nopoint:Image;

	private var elife:Entity;
	private var eenergy:Entity;
	private var espeed:Entity;

	private var pointer:Entity;

	public override function begin() {
		setScale();
		setBackground();
		p1index = 0;
		p2index = 0;

		initPointer();
		initSlider();

		getShips();
		setSlider();
		setButtons();
		setStats();

		var red:Image = new Image("graphics/red.png");
		red.scale = 40 / red.height;
		red.scrollX = 0;
		red.centerOrigin();

		var green:Image = new Image("graphics/green.png");
		green.scale = 40 / red.height;
		green.scrollX = 0;
		green.centerOrigin();

		addGraphic(red, 0, 160, 30);
		addGraphic(green, 0, 480, 30);
		Input.define("next", [Key.RIGHT]);
		Input.define("back", [Key.LEFT]);
	}

	public override function update() {
		camera.x += 2;
		pointer.x = Input.mouseX;
		pointer.y = Input.mouseY;

		if( Input.pressed("back") ) {
			p1index++;
			if(p1index == length) p1index = 0;
			setSlider();
		}

		if( Input.pressed("next") ) {
			p1index--;
			if(p1index < 0) p1index = length - 1;
			setSlider();
		}

		if( Input.mousePressed ) {
			if( pointer.distanceFrom(elife, true) == 0 ) lifepoint++;
			if( pointer.distanceFrom(eenergy, true) == 0 ) energypoint++;
			if( pointer.distanceFrom(espeed, true) == 0 ) speedpoint++;
			refreshStats();
		}

		if( Input.rightMousePressed ) {
			if( pointer.distanceFrom(elife, true) == 0 ) lifepoint--;
			if( pointer.distanceFrom(eenergy, true) == 0 ) energypoint--;
			if( pointer.distanceFrom(espeed, true) == 0 ) speedpoint--;
			refreshStats();		
		}
	}

	public function initPointer() {
		pointer = new Entity(Input.mouseX, Input.mouseY, new Circle(1, 0, 0));
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

	public function initSlider() {
		slider = new Graphiclist();
		var tmp:Entity;

		sliders[0] = new Entity(80, 80);
		sliders[1] = new Entity(110, 80);
		sliders[2] = new Entity(160, 80);
		sliders[3] = new Entity(210, 80);
		sliders[4] = new Entity(240, 80);

		for (i in 0 ... sliders.length ) 
			add(sliders[i]);
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

		add(new Entity(200, 120, shipR));
		add(new Entity(120, 120, shipL));
		add(new Entity(160, 120, lock));
	}

	public function setStats() {
		var life:Image = new Image("graphics/life.png");
		life.centerOrigin();
		life.scrollX = 0;
		life.scale = buttonScale;

		var energy:Image = new Image("graphics/energy.png");
		energy.centerOrigin();
		energy.scrollX = 0;
		energy.scale = buttonScale;

		var speed:Image = new Image("graphics/speed.png");
		speed.centerOrigin();
		speed.scrollX = 0;
		speed.scale = buttonScale;

		point = new Image("graphics/point.png");
		point.centerOrigin();
		point.scrollX = 0;
		point.scale = buttonScale;

		nopoint = new Image("graphics/nopoint.png");
		nopoint.centerOrigin();
		nopoint.scrollX = 0;
		nopoint.scale = buttonScale;

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

		elife = new Entity(50, 150, life, new Hitbox(38, 22, -19, -11));
		add(elife);

		eenergy = new Entity(50, 180, energy, new Hitbox(38, 22, -19, -11));
		add(eenergy);

		espeed = new Entity(50, 210, speed, new Hitbox(38, 22, -19, -11));
		add(espeed);
	}

	public function setSlider() {
		slider.removeAll();

		ships[p1index].scale = 50 / ships[p1index].height;

		if(p1index >= 2 && p1index < length - 2) {

			ships[p1index + 1].scale = 35 / ships[p1index + 1].height;
			ships[p1index + 2].scale = 20 / ships[p1index + 2].height;
			ships[p1index - 1].scale = 35 / ships[p1index - 1].height;
			ships[p1index - 2].scale = 20 / ships[p1index - 2].height;

			slider.add(ships[p1index - 2]);
			slider.add(ships[p1index - 1]);
			slider.add(ships[p1index]);
			slider.add(ships[p1index + 1]);
			slider.add(ships[p1index + 2]);

		} else if (p1index == 1) {

			ships[p1index + 1].scale = 35 / ships[p1index].height;
			ships[p1index + 2].scale = 20 / ships[p1index].height;
			ships[0].scale = 35 / ships[0].height;
			ships[length - 1].scale = 20 / ships[length - 1].height;

			slider.add(ships[length - 1]);
			slider.add(ships[0]);
			slider.add(ships[p1index]);
			slider.add(ships[p1index + 1]);
			slider.add(ships[p1index + 2]);

		}else if (p1index == 0){

			ships[p1index + 1].scale = 35 / ships[p1index + 1].height;
			ships[p1index + 2].scale = 20 / ships[p1index + 2].height;
			ships[length - 1].scale = 35 / ships[length - 1].height;
			ships[length - 2].scale = 20 / ships[length - 2].height;

			slider.add(ships[length - 2]);
			slider.add(ships[length - 1]);
			slider.add(ships[p1index]);
			slider.add(ships[p1index + 1]);
			slider.add(ships[p1index + 2]);

		} else if (p1index == length - 2) {

			ships[length - 1].scale = 35 / ships[length - 1].height;
			ships[0].scale = 20 / ships[0].height;
			ships[p1index - 1].scale = 35 / ships[p1index - 1].height;
			ships[p1index - 2].scale = 20 / ships[p1index - 2].height;	

			slider.add(ships[p1index - 2]);
			slider.add(ships[p1index - 1]);
			slider.add(ships[p1index]);
			slider.add(ships[length - 1]);
			slider.add(ships[0]);

		} else if (p1index == length - 1) {

			ships[0].scale = 35 / ships[0].height;
			ships[1].scale = 20 / ships[1].height;
			ships[p1index - 1].scale = 35 / ships[p1index - 1].height;
			ships[p1index - 2].scale = 20 / ships[p1index - 2].height;

			slider.add(ships[p1index - 2]);
			slider.add(ships[p1index - 1]);
			slider.add(ships[p1index]);
			slider.add(ships[0]);
			slider.add(ships[1]);
		}

		for (i in 0 ... sliders.length )
			sliders[i].graphic = slider.get(i);
	}

	public function getShips() {
		var tmp:Image;
		for ( i in 0 ... length ) {
			tmp = new Image("graphics/ships/ship" + (i + 1) + ".png");
			tmp.centerOrigin();
			tmp.scrollX = 0;
			ships[i] = tmp;
		}
	}
}