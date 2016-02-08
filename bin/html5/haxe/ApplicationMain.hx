#if !macro


@:access(lime.app.Application)
@:access(lime.Assets)
@:access(openfl.display.Stage)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new openfl.display.Application ();
		app.create (config);
		
		var display = new NMEPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		app.setPreloader (preloader);
		preloader.onComplete.add (init);
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("graphics/preloader/haxepunk.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_debug.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_output.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_play.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_visible.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_logo.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_hidden.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_step.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_pause.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("04b03");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("font/04B_03__.ttf.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/life.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/snow.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/basica.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/lock.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/basicb.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/fireTackle.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/playl.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/basic.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/stars1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/buster.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/join.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/exit.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/snowball.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/red.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/speed.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/lockS.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/create.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/shipR.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/ships/ship6.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/ships/ship1.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/ships/ship4.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/ships/ship2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/ships/ship3.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/ships/ship5.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/point.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/stars2.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/Paralyzer.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/shipL.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/energy.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/playb.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/basicMask.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/nopoint.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/entity.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/green.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("graphics/back.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		
		if (total == 0) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			build: "1822",
			company: "Edgar Magdaleno",
			file: "Main",
			fps: 60,
			name: "Zoon",
			orientation: "",
			packageName: "com.edgarmagdaleno.zoon",
			version: "1.0.0",
			windows: [
				
				{
					antialiasing: 0,
					background: 3355443,
					borderless: false,
					depthBuffer: false,
					display: 0,
					fullscreen: true,
					hardware: false,
					height: 720,
					parameters: "{}",
					resizable: false,
					stencilBuffer: true,
					title: "Zoon",
					vsync: false,
					width: 1280,
					x: null,
					y: null
				},
			]
			
		};
		
		#if hxtelemetry
		var telemetry = new hxtelemetry.HxTelemetry.Config ();
		telemetry.allocations = true;
		telemetry.host = "localhost";
		telemetry.app_name = config.name;
		Reflect.setField (config, "telemetry", telemetry);
		#end
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 1280, 720, "333333");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		#if !flash
		if (openfl.Lib.current.stage.window.fullscreen) {
			
			openfl.Lib.current.stage.dispatchEvent (new openfl.events.FullScreenEvent (openfl.events.FullScreenEvent.FULL_SCREEN, false, false, true, true));
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		#end
		
	}
	
	
	#if neko
	@:noCompletion @:dox(hide) public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
