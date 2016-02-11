package scenes;

import com.haxepunk.HXP;
import com.haxepunk.Scene;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Image.createRect;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Graphiclist;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.masks.Circle;
import com.haxepunk.masks.Hitbox;
import com.haxepunk.masks.Imagemask;
import flash.utils.Timer;
import flash.geom.Point;
import com.haxepunk.utils.Joystick;
import com.haxepunk.utils.Draw;
import com.haxepunk.graphics.Text;

class ShipSelectScene extends ScaledScene {
	private var selector:Entity;
	private var selector2:Entity;
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

	private var points:Colar<Point>;
	private var points2:Colar<Point>;

	private var gamepad:Joystick;
	private var gamepad2:Joystick;
	private var pressedF:Bool = false;
	private var pressedB:Bool = false;
	private var pressedF2:Bool = false;
	private var pressedB2:Bool = false;

	private var pat:Int = 4;
	private var pat2:Int = 4;

	private var abilities1:Array<Icon> = new Array<Icon>();
	private var xe:Entity = new Entity(-50, -50, new StaticImage("graphics/xbutton.png", .20));
	private var ye:Entity = new Entity(-50, -50, new StaticImage("graphics/ybutton.png", .20));
	private var be:Entity = new Entity(-50, -50, new StaticImage("graphics/bbutton.png", .20));

	private var abilities2:Array<Icon> = new Array<Icon>();
	private var xe2:Entity = new Entity(-50, -50, new StaticImage("graphics/xbutton.png", .20));
	private var ye2:Entity = new Entity(-50, -50, new StaticImage("graphics/ybutton.png", .20));
	private var be2:Entity = new Entity(-50, -50, new StaticImage("graphics/bbutton.png", .20));


	private var a1:Int = 0;
	private var a2:Int = 0;
	private var a3:Int = 0;

	private var a12:Int = 0;
	private var a22:Int = 0;
	private var a32:Int = 0;

	private var p1ready:Bool = false;
	private var p2ready:Bool = false;

	private var starte:Entity = new Entity(600, 360, new StaticImage("graphics/playb.png", .30));
	private var locks:StaticImage;
	private var playb:StaticImage;
	private var playl:StaticImage;
	private var lock:StaticImage;
	private var locked:StaticImage;
	
	private var p1locked:Bool = false;
	private var p2locked:Bool = false;

	private var pointEnt:Entity;
	private var pointEnt2:Entity;
	private var text1:Text;
	private var text2:Text;
	public override function begin() {
		setScale();
		setBackground();

		setTitle();
		getShips();
		setSliders();
		setButtons();
		setStats();

		gamepad = Input.joystick(0);
		gamepad2 = Input.joystick(1);
		Input.define("enter", [Key.ENTER]);
		add(starte);

		pointEnt = new Entity(50, 320);
		pointEnt.followCamera = true;
		text1 = new Text(Std.string(pat), 0, 0);
		text1.size = 90;
		pointEnt.graphic = text1;
		add(pointEnt);

		pointEnt2 = new Entity(50+ 640 + 410, 320);
		pointEnt2.followCamera = true;
		text2 = new Text(Std.string(pat2), 0, 0);
		text2.size = 90;
		pointEnt2.graphic = text2;
		add(pointEnt2);
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
		text1.text = Std.string(pat);
		text2.text = Std.string(pat2);
		if(gamepad.pressed(XBOX_GAMEPAD.A_BUTTON)) {
			if( lifeButton[0].isPressed() && lifepoint[0] < 10 && pat > 0) {
				lifepoint[0]++;
				pat--; }
			if( energyButton[0].isPressed() && energypoint[0] < 10 && pat > 0) {
				energypoint[0]++;
				pat--; }
			if( speedButton[0].isPressed() && speedpoint[0] < 10 && pat > 0) {
				speedpoint[0]++;
				pat--; }
			if ( shipRbutton[0].isPressed() ) shipSlider.forward();
			if ( shipLbutton[0].isPressed() ) shipSlider.backward();

			if(lockButton[0].isPressed()) {
				p1locked = true;
				remove(selector);
			}
		}

		if(gamepad.pressed(XBOX_GAMEPAD.B_BUTTON)) {
			if( lifeButton[0].isPressed() && lifepoint[0] > 1 ) {
				lifepoint[0]--;
				pat++; }
			if( energyButton[0].isPressed() && energypoint[0] > 1 ) {
				energypoint[0]--;
				pat++; }
			if( speedButton[0].isPressed() && speedpoint[0] > 1 ) {
				speedpoint[0]--;
				pat++; }
		}

		if(gamepad2.pressed(XBOX_GAMEPAD.A_BUTTON)) {
			if( lifeButton[1].isPressed() && lifepoint[1] < 10 && pat2 > 0) {
				lifepoint[1]++;
				pat2--; }
			if( energyButton[1].isPressed() && energypoint[1] < 10&& pat2 > 0 ) {
				energypoint[1]++;
				pat2--; }
			if( speedButton[1].isPressed() && speedpoint[1] < 10&& pat2 > 0 ) {
				speedpoint[1]++;
				pat2--; }

			if ( shipRbutton[1].isPressed() ) shipSlider2.forward();
			if ( shipLbutton[1].isPressed() ) shipSlider2.backward();

			if(lockButton[1].isPressed()) {
				p2locked = true;
				remove(selector2);
			}
		}

		if(gamepad2.pressed(XBOX_GAMEPAD.B_BUTTON)) {
			if( lifeButton[1].isPressed() && lifepoint[1] >1 ) {
				lifepoint[1]--;
				pat2++; }
			if( energyButton[1].isPressed() && energypoint[1] > 1 ) {
				energypoint[1]--;
				pat2++; }
			if( speedButton[1].isPressed() && speedpoint[1] > 1 ) {
				speedpoint[1]--;
				pat2++; }
		}

		refreshStats();
		checkInput();
		checkLock();
		checkDone();
	}

	public function checkLock():Void {
		if(shipSlider.collar.index != shipSlider2.collar.index && a1 != 0 && a2 != 0 && a3 != 0 && pat == 0) {
			lockButton[0].graphic = new StaticImage("graphics/lock.png", buttonScale);
			p1ready = true;
		} else {
			lockButton[0].graphic = new StaticImage("graphics/lockS.png", buttonScale);
			p1ready = false;
		}

		if(shipSlider.collar.index != shipSlider2.collar.index && a12 != 0 && a22 != 0 && a32 != 0 && pat2 == 0) {
			lockButton[1].graphic = new StaticImage("graphics/lock.png", buttonScale);
			p2ready = true;
		} else {
			lockButton[1].graphic = new StaticImage("graphics/lockS.png", buttonScale);
			p2ready = false;
		}

		if(p1locked) lockButton[0].graphic = locked;
		if(p2locked) lockButton[1].graphic = locked;
	}

	public function checkInput():Void {
		if ( (gamepad.check(XBOX_GAMEPAD.START_BUTTON) || 
			gamepad2.check(XBOX_GAMEPAD.START_BUTTON))
			&& done() ) 
		HXP.scene = new scenes.BattleScene(shipSlider.collar.index, shipSlider2.collar.index, lifepoint[0],
			lifepoint[1], energypoint[0], energypoint[1], speedpoint[0], speedpoint[1],
			a1, a12, a2, a22, a3, a32);

		if( gamepad.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) == 1  ||
			gamepad.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) == 1) {
			if(!pressedF) points.next(true);
			pressedF = true;
		} else pressedF = false;

		if( gamepad.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) == -1  ||
			gamepad.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) == -1) {
			if(!pressedB) points.previous(true);
			pressedB = true;
		} else pressedB = false;

		if( gamepad2.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) == 1  ||
			gamepad2.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) == 1) {
			if(!pressedF2) points2.next(true);
			pressedF2 = true;
		} else pressedF2 = false;

		if( gamepad2.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_X) == -1  ||
			gamepad2.getAxis(XBOX_GAMEPAD.LEFT_ANALOGUE_Y) == -1) {
			if(!pressedB2) points2.previous(true);
			pressedB2 = true;
		} else pressedB2 = false;

		if(gamepad.pressed(XBOX_GAMEPAD.X_BUTTON)) {
			for(i in 0 ... abilities1.length)
				if(abilities1[i].isSelected(selector)) {
					if(a2 != i + 1 && a3 != i + 1) {
						a1 = i + 1;
						xe.x = abilities1[i].x - 20;
						xe.y =  abilities1[i].y - 20;
					}
				}
		}

		if(gamepad.pressed(XBOX_GAMEPAD.Y_BUTTON)) {
			for(i in 0 ... abilities1.length)
				if(abilities1[i].isSelected(selector)) {
					if(a3 != i + 1 && a1 != i + 1) {
						a2 = i + 1;
						ye.x = abilities1[i].x - 20;
						ye.y =  abilities1[i].y - 20;
					}
				}
		}

		if(gamepad.pressed(XBOX_GAMEPAD.B_BUTTON)) {
			for(i in 0 ... abilities1.length)
				if(abilities1[i].isSelected(selector)) {
					if(a2 != i + 1 && a1 != i + 1) {
						a3 = i + 1;
						be.x = abilities1[i].x - 20;
						be.y =  abilities1[i].y - 20;
					}
				}
		}

		if(gamepad2.pressed(XBOX_GAMEPAD.X_BUTTON)) {
			for(i in 0 ... abilities2.length)
				if(abilities2[i].isSelected(selector2)) {
					if(a22 != i + 1 && a32 != i + 1) {
						a12 = i + 1;
						xe2.x = abilities2[i].x - 20;
						xe2.y =  abilities2[i].y - 20;
					}
				}
		}

		if(gamepad2.pressed(XBOX_GAMEPAD.Y_BUTTON)) {
			for(i in 0 ... abilities2.length)
				if(abilities2[i].isSelected(selector2)) {
					if(a32 != i + 1 && a12 != i + 1) {
						a22 = i + 1;
						ye2.x = abilities2[i].x - 20;
						ye2.y =  abilities2[i].y - 20;
					}
				}
		}

		if(gamepad2.pressed(XBOX_GAMEPAD.B_BUTTON)) {
			for(i in 0 ... abilities2.length)
				if(abilities2[i].isSelected(selector2)) {
					if(a22 != i + 1 && a12 != i + 1) {
						a32 = i + 1;
						be2.x = abilities2[i].x - 20;
						be2.y =  abilities2[i].y - 20;
					}
				}
		}

		selector.x = points.get().x;
		selector.y = points.get().y;
		selector2.x = points2.get().x;
		selector2.y = points2.get().y;
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
		setAbilities();
		selector = new Entity(0, 0);
		selector2 = new Entity(0,0);
		points = new Colar<Point>();
		points2 = new Colar<Point>();
		lifeButton = new Array<Button>();
		energyButton = new Array<Button>();
		speedButton = new Array<Button>();
		shipRbutton = new Array<Button>();
		shipLbutton = new Array<Button>();
		lockButton = new Array<Button>();

		shipRbutton.push(new Button(365, 240, new StaticImage("graphics/shipR.png", buttonScale), selector ));
		shipRbutton.push(new Button(365 + 640, 240, new StaticImage("graphics/shipR.png", buttonScale), selector2 ));
		add(shipRbutton[0]);
		add(shipRbutton[1]);

		shipLbutton.push(new Button(275, 240, new StaticImage("graphics/shipL.png", buttonScale), selector ));
		shipLbutton.push(new Button(275 + 640, 240, new StaticImage("graphics/shipL.png", buttonScale), selector2 ));
		add(shipLbutton[0]);
		add(shipLbutton[1]);

		lockButton.push(new Button(320, 650, new StaticImage("graphics/lockS.png", buttonScale), selector ));
		lockButton.push(new Button(320 + 640, 650, new StaticImage("graphics/lockS.png", buttonScale), selector2 ));
		add(lockButton[0]);
		add(lockButton[1]);

		lifeButton.push(new Button(150, 300, new StaticImage("graphics/life.png", buttonScale), selector ));
		lifeButton.push(new Button(150+ 640, 300, new StaticImage("graphics/life.png", buttonScale), selector2 ));
		add(lifeButton[0]);
		add(lifeButton[1]);

		energyButton.push(new Button(150, 360, new StaticImage("graphics/energy.png", buttonScale), selector ));
		energyButton.push(new Button(150 + 640, 360, new StaticImage("graphics/energy.png", buttonScale), selector2 ));
		add(energyButton[0]);
		add(energyButton[1]);

		speedButton.push(new Button(150, 420, new StaticImage("graphics/speed.png", buttonScale), selector ));
		speedButton.push(new Button(150 + 640, 420, new StaticImage("graphics/speed.png", buttonScale), selector2 ));
		add(speedButton[0]);
		add(speedButton[1]);

		points.push(new Point(shipLbutton[0].x, shipLbutton[0].y));
		points.push(new Point(shipRbutton[0].x, shipRbutton[0].y));
		points.push(new Point(lifeButton[0].x, lifeButton[0].y));
		points.push(new Point(energyButton[0].x, energyButton[0].y));
		points.push(new Point(speedButton[0].x, speedButton[0].y));
		for(object in abilities1) points.push(new Point(object.x, object.y));
		points.push(new Point(lockButton[0].x, lockButton[0].y));
		selector.x = points.get().x;
		selector.y = points.get().y;
		selector.graphic = new StaticImage("graphics/selector.png", .90);
		add(selector);

		points2.push(new Point(shipLbutton[1].x, shipLbutton[1].y));
		points2.push(new Point(shipRbutton[1].x, shipRbutton[1].y));
		points2.push(new Point(lifeButton[1].x, lifeButton[1].y));
		points2.push(new Point(energyButton[1].x, energyButton[1].y));
		points2.push(new Point(speedButton[1].x, speedButton[1].y));
		for(object in abilities2) points2.push(new Point(object.x, object.y));
		points2.push(new Point(lockButton[1].x, lockButton[1].y));
		selector2.x = points2.get().x;
		selector2.y = points2.get().y;
		selector2.graphic = new StaticImage("graphics/selector.png", .90);
		add(selector2);

		locks = new StaticImage("graphics/lockS.png", buttonScale);
		lock = new StaticImage("graphics/lock.png", buttonScale);
		playl = new StaticImage("graphics/playl.png", buttonScale);
		playb= new StaticImage("graphics/playb.png", buttonScale);
		locked = new StaticImage("graphics/locked.png", buttonScale);
	}

	public function setAbilities():Void {
		abilities1.push(new Icon(70, 530, new StaticImage("graphics/icons/shotgun.png", .70)));
		abilities1.push(new Icon(140, 530, new StaticImage("graphics/icons/reflector.png", .70)));
		abilities1.push(new Icon(210, 530, new StaticImage("graphics/icons/paralyzer.png", .70)));
		abilities1.push(new Icon(280, 530, new StaticImage("graphics/icons/buster.png", .70)));
		abilities1.push(new Icon(350, 530, new StaticImage("graphics/icons/snowball.png", .70)));
		abilities1.push(new Icon(420, 530, new StaticImage("graphics/icons/avalanche.png", .70)));
		abilities1.push(new Icon(490, 530, new StaticImage("graphics/icons/firetackle.png", .70)));
		for(object in abilities1) add(object);

		abilities2.push(new Icon(70 + 640, 530, new StaticImage("graphics/icons/shotgun.png", .70)));
		abilities2.push(new Icon(140 + 640, 530, new StaticImage("graphics/icons/reflector.png", .70)));
		abilities2.push(new Icon(210 + 640, 530, new StaticImage("graphics/icons/paralyzer.png", .70)));
		abilities2.push(new Icon(280 + 640, 530, new StaticImage("graphics/icons/buster.png", .70)));
		abilities2.push(new Icon(350 + 640, 530, new StaticImage("graphics/icons/snowball.png", .70)));
		abilities2.push(new Icon(420 + 640, 530, new StaticImage("graphics/icons/avalanche.png", .70)));
		abilities2.push(new Icon(490 + 640, 530, new StaticImage("graphics/icons/firetackle.png", .70)));
		for(object in abilities2) add(object);

		add(xe);
		add(ye);
		add(be);
		add(xe2);
		add(ye2);
		add(be2);
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

	public function done():Bool {
		if(p1locked && p2locked) return true;
		return false;
	}

	public function checkDone():Void {
		if(!done()) starte.graphic = playl;
		else starte.graphic = playb;
	}
}