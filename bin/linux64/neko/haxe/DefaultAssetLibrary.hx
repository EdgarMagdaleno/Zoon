#if !lime_hybrid


package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if neko
import neko.vm.Deque;
import neko.vm.Thread;
#elseif cpp
import cpp.vm.Deque;
import cpp.vm.Thread;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl._legacy.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	private static var loaded = 0;
	private static var loading = 0;
	private static var workerIncomingQueue = new Deque<Dynamic> ();
	private static var workerResult = new Deque<Dynamic> ();
	private static var workerThread:Thread;
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		
		
		
		
		
		
		
		
		
		
		Font.registerFont (__ASSET__font_04b_03___ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("graphics/debug/console_step.png", __ASSET__graphics_debug_console_step_png);
		type.set ("graphics/debug/console_step.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_debug.png", __ASSET__graphics_debug_console_debug_png);
		type.set ("graphics/debug/console_debug.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_visible.png", __ASSET__graphics_debug_console_visible_png);
		type.set ("graphics/debug/console_visible.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_output.png", __ASSET__graphics_debug_console_output_png);
		type.set ("graphics/debug/console_output.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_logo.png", __ASSET__graphics_debug_console_logo_png);
		type.set ("graphics/debug/console_logo.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_play.png", __ASSET__graphics_debug_console_play_png);
		type.set ("graphics/debug/console_play.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_pause.png", __ASSET__graphics_debug_console_pause_png);
		type.set ("graphics/debug/console_pause.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_hidden.png", __ASSET__graphics_debug_console_hidden_png);
		type.set ("graphics/debug/console_hidden.png", AssetType.IMAGE);
		
		className.set ("graphics/preloader/haxepunk.png", __ASSET__graphics_preloader_haxepunk_png);
		type.set ("graphics/preloader/haxepunk.png", AssetType.IMAGE);
		
		className.set ("font/04B_03__.ttf", __ASSET__font_04b_03___ttf);
		type.set ("font/04B_03__.ttf", AssetType.FONT);
		
		className.set ("font/04B_03__.ttf.png", __ASSET__font_04b_03___ttf_png);
		type.set ("font/04B_03__.ttf.png", AssetType.IMAGE);
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			if (type == BINARY || type == null || (assetType == BINARY && type == TEXT)) {
				
				return true;
				
			}
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), BitmapData);
			
		} else {
			
			return BitmapData.load (path.get (id));
			
		}
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), ByteArray);
			
		} else {
			
			return ByteArray.readFile (path.get (id));
			
		}
		
	}
	
	
	public override function getFont (id:String):Font {
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return new Font (path.get (id));
			
		}
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, true);
			
		}
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
			
		}
		
	}
	
	
	public override function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		__load (getBitmapData, id, handler);
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		__load (getBytes, id, handler);
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		__load (getFont, id, handler);
		
	}
	
	
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		__load (getMusic, id, handler);
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		__load (getSound, id, handler);
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
	}
	
	
	private static function __doWork ():Void {
		
		while (true) {
			
			var message = workerIncomingQueue.pop (true);
			
			if (message == "WORK") {
				
				var getMethod = workerIncomingQueue.pop (true);
				var id = workerIncomingQueue.pop (true);
				var handler = workerIncomingQueue.pop (true);
				
				var data = getMethod (id);
				workerResult.add ("RESULT");
				workerResult.add (data);
				workerResult.add (handler);
				
			} else if (message == "EXIT") {
				
				break;
				
			}
			
		}
		
	}
	
	
	private inline function __load<T> (getMethod:String->T, id:String, handler:T->Void):Void {
		
		workerIncomingQueue.add ("WORK");
		workerIncomingQueue.add (getMethod);
		workerIncomingQueue.add (id);
		workerIncomingQueue.add (handler);
		
		loading++;
		
	}
	
	
	public static function __poll ():Void {
		
		if (loading > loaded) {
			
			if (workerThread == null) {
				
				workerThread = Thread.create (__doWork);
				
			}
			
			var message = workerResult.pop (false);
			
			while (message == "RESULT") {
				
				loaded++;
				
				var data = workerResult.pop (true);
				var handler = workerResult.pop (true);
				
				if (handler != null) {
					
					handler (data);
					
				}
				
				message = workerResult.pop (false);
				
			}
			
		} else {
			
			if (workerThread != null) {
				
				workerIncomingQueue.add ("EXIT");
				workerThread = null;
				
			}
			
		}
		
	}
	
	
}


#if (windows || mac || linux)


@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_step.png") @:keep #if display private #end class __ASSET__graphics_debug_console_step_png extends flash.display.BitmapData {}
@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_debug.png") @:keep #if display private #end class __ASSET__graphics_debug_console_debug_png extends flash.display.BitmapData {}
@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_visible.png") @:keep #if display private #end class __ASSET__graphics_debug_console_visible_png extends flash.display.BitmapData {}
@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_output.png") @:keep #if display private #end class __ASSET__graphics_debug_console_output_png extends flash.display.BitmapData {}
@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_logo.png") @:keep #if display private #end class __ASSET__graphics_debug_console_logo_png extends flash.display.BitmapData {}
@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_play.png") @:keep #if display private #end class __ASSET__graphics_debug_console_play_png extends flash.display.BitmapData {}
@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_pause.png") @:keep #if display private #end class __ASSET__graphics_debug_console_pause_png extends flash.display.BitmapData {}
@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_hidden.png") @:keep #if display private #end class __ASSET__graphics_debug_console_hidden_png extends flash.display.BitmapData {}
@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/preloader/haxepunk.png") @:keep #if display private #end class __ASSET__graphics_preloader_haxepunk_png extends flash.display.BitmapData {}
@:font("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/font/04B_03__.ttf") @:keep #if display private #end class __ASSET__font_04b_03___ttf extends flash.text.Font {}
@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/font/04B_03__.ttf.png") @:keep #if display private #end class __ASSET__font_04b_03___ttf_png extends flash.display.BitmapData {}





#else


class __ASSET__font_04b_03___ttf extends openfl.text.Font { public function new () { super (); __fontPath = "font/04B_03__.ttf"; fontName = "04b03";  }}


#end


#else


package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__font_04b_03___ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("graphics/debug/console_step.png", __ASSET__graphics_debug_console_step_png);
		type.set ("graphics/debug/console_step.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_debug.png", __ASSET__graphics_debug_console_debug_png);
		type.set ("graphics/debug/console_debug.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_visible.png", __ASSET__graphics_debug_console_visible_png);
		type.set ("graphics/debug/console_visible.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_output.png", __ASSET__graphics_debug_console_output_png);
		type.set ("graphics/debug/console_output.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_logo.png", __ASSET__graphics_debug_console_logo_png);
		type.set ("graphics/debug/console_logo.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_play.png", __ASSET__graphics_debug_console_play_png);
		type.set ("graphics/debug/console_play.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_pause.png", __ASSET__graphics_debug_console_pause_png);
		type.set ("graphics/debug/console_pause.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_hidden.png", __ASSET__graphics_debug_console_hidden_png);
		type.set ("graphics/debug/console_hidden.png", AssetType.IMAGE);
		className.set ("graphics/preloader/haxepunk.png", __ASSET__graphics_preloader_haxepunk_png);
		type.set ("graphics/preloader/haxepunk.png", AssetType.IMAGE);
		className.set ("font/04B_03__.ttf", __ASSET__font_04b_03___ttf);
		type.set ("font/04B_03__.ttf", AssetType.FONT);
		className.set ("font/04B_03__.ttf.png", __ASSET__font_04b_03___ttf_png);
		type.set ("font/04B_03__.ttf.png", AssetType.IMAGE);
		path.set ("graphics/snow.png", "graphics/snow.png");
		type.set ("graphics/snow.png", AssetType.IMAGE);
		path.set ("graphics/ybutton.png", "graphics/ybutton.png");
		type.set ("graphics/ybutton.png", AssetType.IMAGE);
		path.set ("graphics/playb.png", "graphics/playb.png");
		type.set ("graphics/playb.png", AssetType.IMAGE);
		path.set ("graphics/green.png", "graphics/green.png");
		type.set ("graphics/green.png", AssetType.IMAGE);
		path.set ("graphics/point.png", "graphics/point.png");
		type.set ("graphics/point.png", AssetType.IMAGE);
		path.set ("graphics/fireTackle.png", "graphics/fireTackle.png");
		type.set ("graphics/fireTackle.png", AssetType.IMAGE);
		path.set ("graphics/locked.png", "graphics/locked.png");
		type.set ("graphics/locked.png", AssetType.IMAGE);
		path.set ("graphics/stars2.png", "graphics/stars2.png");
		type.set ("graphics/stars2.png", AssetType.IMAGE);
		path.set ("graphics/stars1.png", "graphics/stars1.png");
		type.set ("graphics/stars1.png", AssetType.IMAGE);
		path.set ("graphics/entity.png", "graphics/entity.png");
		type.set ("graphics/entity.png", AssetType.IMAGE);
		path.set ("graphics/basica.png", "graphics/basica.png");
		type.set ("graphics/basica.png", AssetType.IMAGE);
		path.set ("graphics/life.png", "graphics/life.png");
		type.set ("graphics/life.png", AssetType.IMAGE);
		path.set ("graphics/energy.png", "graphics/energy.png");
		type.set ("graphics/energy.png", AssetType.IMAGE);
		path.set ("graphics/winner.png", "graphics/winner.png");
		type.set ("graphics/winner.png", AssetType.IMAGE);
		path.set ("graphics/playl.png", "graphics/playl.png");
		type.set ("graphics/playl.png", AssetType.IMAGE);
		path.set ("graphics/exit.png", "graphics/exit.png");
		type.set ("graphics/exit.png", AssetType.IMAGE);
		path.set ("graphics/icons/paralyzer.png", "graphics/icons/paralyzer.png");
		type.set ("graphics/icons/paralyzer.png", AssetType.IMAGE);
		path.set ("graphics/icons/reflector.png", "graphics/icons/reflector.png");
		type.set ("graphics/icons/reflector.png", AssetType.IMAGE);
		path.set ("graphics/icons/avalanche.png", "graphics/icons/avalanche.png");
		type.set ("graphics/icons/avalanche.png", AssetType.IMAGE);
		path.set ("graphics/icons/buster.png", "graphics/icons/buster.png");
		type.set ("graphics/icons/buster.png", AssetType.IMAGE);
		path.set ("graphics/icons/snowball.png", "graphics/icons/snowball.png");
		type.set ("graphics/icons/snowball.png", AssetType.IMAGE);
		path.set ("graphics/icons/shotgun.png", "graphics/icons/shotgun.png");
		type.set ("graphics/icons/shotgun.png", AssetType.IMAGE);
		path.set ("graphics/icons/firetackle.png", "graphics/icons/firetackle.png");
		type.set ("graphics/icons/firetackle.png", AssetType.IMAGE);
		path.set ("graphics/Paralyzer.png", "graphics/Paralyzer.png");
		type.set ("graphics/Paralyzer.png", AssetType.IMAGE);
		path.set ("graphics/shipL.png", "graphics/shipL.png");
		type.set ("graphics/shipL.png", AssetType.IMAGE);
		path.set ("graphics/bbutton.png", "graphics/bbutton.png");
		type.set ("graphics/bbutton.png", AssetType.IMAGE);
		path.set ("graphics/ships/ship1.png", "graphics/ships/ship1.png");
		type.set ("graphics/ships/ship1.png", AssetType.IMAGE);
		path.set ("graphics/ships/ship6.png", "graphics/ships/ship6.png");
		type.set ("graphics/ships/ship6.png", AssetType.IMAGE);
		path.set ("graphics/ships/ship3.png", "graphics/ships/ship3.png");
		type.set ("graphics/ships/ship3.png", AssetType.IMAGE);
		path.set ("graphics/ships/ship4.png", "graphics/ships/ship4.png");
		type.set ("graphics/ships/ship4.png", AssetType.IMAGE);
		path.set ("graphics/ships/ship2.png", "graphics/ships/ship2.png");
		type.set ("graphics/ships/ship2.png", AssetType.IMAGE);
		path.set ("graphics/ships/ship5.png", "graphics/ships/ship5.png");
		type.set ("graphics/ships/ship5.png", AssetType.IMAGE);
		path.set ("graphics/buster.png", "graphics/buster.png");
		type.set ("graphics/buster.png", AssetType.IMAGE);
		path.set ("graphics/basicb.png", "graphics/basicb.png");
		type.set ("graphics/basicb.png", AssetType.IMAGE);
		path.set ("graphics/basic.png", "graphics/basic.png");
		type.set ("graphics/basic.png", AssetType.IMAGE);
		path.set ("graphics/selector.png", "graphics/selector.png");
		type.set ("graphics/selector.png", AssetType.IMAGE);
		path.set ("graphics/lock.png", "graphics/lock.png");
		type.set ("graphics/lock.png", AssetType.IMAGE);
		path.set ("graphics/lockS.png", "graphics/lockS.png");
		type.set ("graphics/lockS.png", AssetType.IMAGE);
		path.set ("graphics/snowball.png", "graphics/snowball.png");
		type.set ("graphics/snowball.png", AssetType.IMAGE);
		path.set ("graphics/create.png", "graphics/create.png");
		type.set ("graphics/create.png", AssetType.IMAGE);
		path.set ("graphics/shipR.png", "graphics/shipR.png");
		type.set ("graphics/shipR.png", AssetType.IMAGE);
		path.set ("graphics/basicMask.png", "graphics/basicMask.png");
		type.set ("graphics/basicMask.png", AssetType.IMAGE);
		path.set ("graphics/explosion.png", "graphics/explosion.png");
		type.set ("graphics/explosion.png", AssetType.IMAGE);
		path.set ("graphics/join.png", "graphics/join.png");
		type.set ("graphics/join.png", AssetType.IMAGE);
		path.set ("graphics/speed.png", "graphics/speed.png");
		type.set ("graphics/speed.png", AssetType.IMAGE);
		path.set ("graphics/nopoint.png", "graphics/nopoint.png");
		type.set ("graphics/nopoint.png", AssetType.IMAGE);
		path.set ("graphics/xbutton.png", "graphics/xbutton.png");
		type.set ("graphics/xbutton.png", AssetType.IMAGE);
		path.set ("graphics/red.png", "graphics/red.png");
		type.set ("graphics/red.png", AssetType.IMAGE);
		path.set ("graphics/back.png", "graphics/back.png");
		type.set ("graphics/back.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "graphics/debug/console_step.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_debug.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_visible.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_output.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_logo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_play.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_pause.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_hidden.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/preloader/haxepunk.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "font/04B_03__.ttf";
		className.set (id, __ASSET__font_04b_03___ttf);
		
		type.set (id, AssetType.FONT);
		id = "font/04B_03__.ttf.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/snow.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/ybutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/playb.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/green.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/point.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/fireTackle.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/locked.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/stars2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/stars1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/entity.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/basica.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/life.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/energy.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/winner.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/playl.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/exit.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/icons/paralyzer.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/icons/reflector.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/icons/avalanche.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/icons/buster.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/icons/snowball.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/icons/shotgun.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/icons/firetackle.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/Paralyzer.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/shipL.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/bbutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/ships/ship1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/ships/ship6.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/ships/ship3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/ships/ship4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/ships/ship2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/ships/ship5.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/buster.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/basicb.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/basic.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/selector.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/lock.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/lockS.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/snowball.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/create.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/shipR.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/basicMask.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/explosion.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/join.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/speed.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/nopoint.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/xbutton.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/red.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "graphics/back.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("graphics/debug/console_step.png", __ASSET__graphics_debug_console_step_png);
		type.set ("graphics/debug/console_step.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_debug.png", __ASSET__graphics_debug_console_debug_png);
		type.set ("graphics/debug/console_debug.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_visible.png", __ASSET__graphics_debug_console_visible_png);
		type.set ("graphics/debug/console_visible.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_output.png", __ASSET__graphics_debug_console_output_png);
		type.set ("graphics/debug/console_output.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_logo.png", __ASSET__graphics_debug_console_logo_png);
		type.set ("graphics/debug/console_logo.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_play.png", __ASSET__graphics_debug_console_play_png);
		type.set ("graphics/debug/console_play.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_pause.png", __ASSET__graphics_debug_console_pause_png);
		type.set ("graphics/debug/console_pause.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_hidden.png", __ASSET__graphics_debug_console_hidden_png);
		type.set ("graphics/debug/console_hidden.png", AssetType.IMAGE);
		
		className.set ("graphics/preloader/haxepunk.png", __ASSET__graphics_preloader_haxepunk_png);
		type.set ("graphics/preloader/haxepunk.png", AssetType.IMAGE);
		
		className.set ("font/04B_03__.ttf", __ASSET__font_04b_03___ttf);
		type.set ("font/04B_03__.ttf", AssetType.FONT);
		
		className.set ("font/04B_03__.ttf.png", __ASSET__font_04b_03___ttf_png);
		type.set ("font/04B_03__.ttf.png", AssetType.IMAGE);
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_step_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_debug_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_visible_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_output_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_play_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_pause_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_hidden_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_preloader_haxepunk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__font_04b_03___ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__font_04b_03___ttf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }



















































#elseif html5










@:keep #if display private #end class __ASSET__font_04b_03___ttf extends lime.text.Font { public function new () { super (); name = "04b03"; } } 




















































#else



#if (windows || mac || linux || cpp)


@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_step.png") #if display private #end class __ASSET__graphics_debug_console_step_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_debug.png") #if display private #end class __ASSET__graphics_debug_console_debug_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_visible.png") #if display private #end class __ASSET__graphics_debug_console_visible_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_output.png") #if display private #end class __ASSET__graphics_debug_console_output_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_logo.png") #if display private #end class __ASSET__graphics_debug_console_logo_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_play.png") #if display private #end class __ASSET__graphics_debug_console_play_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_pause.png") #if display private #end class __ASSET__graphics_debug_console_pause_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_hidden.png") #if display private #end class __ASSET__graphics_debug_console_hidden_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/preloader/haxepunk.png") #if display private #end class __ASSET__graphics_preloader_haxepunk_png extends lime.graphics.Image {}
@:font("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/font/04B_03__.ttf") #if display private #end class __ASSET__font_04b_03___ttf extends lime.text.Font {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/font/04B_03__.ttf.png") #if display private #end class __ASSET__font_04b_03___ttf_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__font_04b_03___ttf extends openfl.text.Font { public function new () { var font = new __ASSET__font_04b_03___ttf (); src = font.src; name = font.name; super (); }}

#end

#end


#end