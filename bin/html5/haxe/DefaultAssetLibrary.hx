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
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
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
		
		className.set ("graphics/preloader/haxepunk.png", __ASSET__graphics_preloader_haxepunk_png);
		type.set ("graphics/preloader/haxepunk.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_debug.png", __ASSET__graphics_debug_console_debug_png);
		type.set ("graphics/debug/console_debug.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_output.png", __ASSET__graphics_debug_console_output_png);
		type.set ("graphics/debug/console_output.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_play.png", __ASSET__graphics_debug_console_play_png);
		type.set ("graphics/debug/console_play.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_visible.png", __ASSET__graphics_debug_console_visible_png);
		type.set ("graphics/debug/console_visible.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_logo.png", __ASSET__graphics_debug_console_logo_png);
		type.set ("graphics/debug/console_logo.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_hidden.png", __ASSET__graphics_debug_console_hidden_png);
		type.set ("graphics/debug/console_hidden.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_step.png", __ASSET__graphics_debug_console_step_png);
		type.set ("graphics/debug/console_step.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_pause.png", __ASSET__graphics_debug_console_pause_png);
		type.set ("graphics/debug/console_pause.png", AssetType.IMAGE);
		className.set ("font/04B_03__.ttf", __ASSET__font_04b_03___ttf);
		type.set ("font/04B_03__.ttf", AssetType.FONT);
		className.set ("font/04B_03__.ttf.png", __ASSET__font_04b_03___ttf_png);
		type.set ("font/04B_03__.ttf.png", AssetType.IMAGE);
		className.set ("graphics/life.png", __ASSET__graphics_life_png);
		type.set ("graphics/life.png", AssetType.IMAGE);
		className.set ("graphics/winner.png", __ASSET__graphics_winner_png);
		type.set ("graphics/winner.png", AssetType.IMAGE);
		className.set ("graphics/snow.png", __ASSET__graphics_snow_png);
		type.set ("graphics/snow.png", AssetType.IMAGE);
		className.set ("graphics/basica.png", __ASSET__graphics_basica_png);
		type.set ("graphics/basica.png", AssetType.IMAGE);
		className.set ("graphics/lock.png", __ASSET__graphics_lock_png);
		type.set ("graphics/lock.png", AssetType.IMAGE);
		className.set ("graphics/basicb.png", __ASSET__graphics_basicb_png);
		type.set ("graphics/basicb.png", AssetType.IMAGE);
		className.set ("graphics/fireTackle.png", __ASSET__graphics_firetackle_png);
		type.set ("graphics/fireTackle.png", AssetType.IMAGE);
		className.set ("graphics/playl.png", __ASSET__graphics_playl_png);
		type.set ("graphics/playl.png", AssetType.IMAGE);
		className.set ("graphics/basic.png", __ASSET__graphics_basic_png);
		type.set ("graphics/basic.png", AssetType.IMAGE);
		className.set ("graphics/stars1.png", __ASSET__graphics_stars1_png);
		type.set ("graphics/stars1.png", AssetType.IMAGE);
		className.set ("graphics/buster.png", __ASSET__graphics_buster_png);
		type.set ("graphics/buster.png", AssetType.IMAGE);
		className.set ("graphics/join.png", __ASSET__graphics_join_png);
		type.set ("graphics/join.png", AssetType.IMAGE);
		className.set ("graphics/exit.png", __ASSET__graphics_exit_png);
		type.set ("graphics/exit.png", AssetType.IMAGE);
		className.set ("graphics/snowball.png", __ASSET__graphics_snowball_png);
		type.set ("graphics/snowball.png", AssetType.IMAGE);
		className.set ("graphics/explosion.png", __ASSET__graphics_explosion_png);
		type.set ("graphics/explosion.png", AssetType.IMAGE);
		className.set ("graphics/red.png", __ASSET__graphics_red_png);
		type.set ("graphics/red.png", AssetType.IMAGE);
		className.set ("graphics/bbutton.png", __ASSET__graphics_bbutton_png);
		type.set ("graphics/bbutton.png", AssetType.IMAGE);
		className.set ("graphics/speed.png", __ASSET__graphics_speed_png);
		type.set ("graphics/speed.png", AssetType.IMAGE);
		className.set ("graphics/lockS.png", __ASSET__graphics_locks_png);
		type.set ("graphics/lockS.png", AssetType.IMAGE);
		className.set ("graphics/create.png", __ASSET__graphics_create_png);
		type.set ("graphics/create.png", AssetType.IMAGE);
		className.set ("graphics/shipR.png", __ASSET__graphics_shipr_png);
		type.set ("graphics/shipR.png", AssetType.IMAGE);
		className.set ("graphics/ships/ship6.png", __ASSET__graphics_ships_ship6_png);
		type.set ("graphics/ships/ship6.png", AssetType.IMAGE);
		className.set ("graphics/ships/ship1.png", __ASSET__graphics_ships_ship1_png);
		type.set ("graphics/ships/ship1.png", AssetType.IMAGE);
		className.set ("graphics/ships/ship4.png", __ASSET__graphics_ships_ship4_png);
		type.set ("graphics/ships/ship4.png", AssetType.IMAGE);
		className.set ("graphics/ships/ship2.png", __ASSET__graphics_ships_ship2_png);
		type.set ("graphics/ships/ship2.png", AssetType.IMAGE);
		className.set ("graphics/ships/ship3.png", __ASSET__graphics_ships_ship3_png);
		type.set ("graphics/ships/ship3.png", AssetType.IMAGE);
		className.set ("graphics/ships/ship5.png", __ASSET__graphics_ships_ship5_png);
		type.set ("graphics/ships/ship5.png", AssetType.IMAGE);
		className.set ("graphics/point.png", __ASSET__graphics_point_png);
		type.set ("graphics/point.png", AssetType.IMAGE);
		className.set ("graphics/stars2.png", __ASSET__graphics_stars2_png);
		type.set ("graphics/stars2.png", AssetType.IMAGE);
		className.set ("graphics/Paralyzer.png", __ASSET__graphics_paralyzer_png);
		type.set ("graphics/Paralyzer.png", AssetType.IMAGE);
		className.set ("graphics/shipL.png", __ASSET__graphics_shipl_png);
		type.set ("graphics/shipL.png", AssetType.IMAGE);
		className.set ("graphics/energy.png", __ASSET__graphics_energy_png);
		type.set ("graphics/energy.png", AssetType.IMAGE);
		className.set ("graphics/xbutton.png", __ASSET__graphics_xbutton_png);
		type.set ("graphics/xbutton.png", AssetType.IMAGE);
		className.set ("graphics/playb.png", __ASSET__graphics_playb_png);
		type.set ("graphics/playb.png", AssetType.IMAGE);
		className.set ("graphics/basicMask.png", __ASSET__graphics_basicmask_png);
		type.set ("graphics/basicMask.png", AssetType.IMAGE);
		className.set ("graphics/nopoint.png", __ASSET__graphics_nopoint_png);
		type.set ("graphics/nopoint.png", AssetType.IMAGE);
		className.set ("graphics/ybutton.png", __ASSET__graphics_ybutton_png);
		type.set ("graphics/ybutton.png", AssetType.IMAGE);
		className.set ("graphics/entity.png", __ASSET__graphics_entity_png);
		type.set ("graphics/entity.png", AssetType.IMAGE);
		className.set ("graphics/green.png", __ASSET__graphics_green_png);
		type.set ("graphics/green.png", AssetType.IMAGE);
		className.set ("graphics/back.png", __ASSET__graphics_back_png);
		type.set ("graphics/back.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "graphics/preloader/haxepunk.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_debug.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_output.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_play.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_visible.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_logo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_hidden.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_step.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_pause.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "font/04B_03__.ttf";
		className.set (id, __ASSET__font_04b_03___ttf);
		
		type.set (id, AssetType.FONT);
		id = "font/04B_03__.ttf.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/life.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/winner.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/snow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/basica.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/lock.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/basicb.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/fireTackle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/playl.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/basic.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/stars1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/buster.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/join.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/exit.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/snowball.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/explosion.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/red.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/bbutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/speed.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/lockS.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/create.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/shipR.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/ships/ship6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/ships/ship1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/ships/ship4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/ships/ship2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/ships/ship3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/ships/ship5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/point.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/stars2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/Paralyzer.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/shipL.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/energy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/xbutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/playb.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/basicMask.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/nopoint.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/ybutton.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/entity.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/green.png";
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
		
		className.set ("graphics/preloader/haxepunk.png", __ASSET__graphics_preloader_haxepunk_png);
		type.set ("graphics/preloader/haxepunk.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_debug.png", __ASSET__graphics_debug_console_debug_png);
		type.set ("graphics/debug/console_debug.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_output.png", __ASSET__graphics_debug_console_output_png);
		type.set ("graphics/debug/console_output.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_play.png", __ASSET__graphics_debug_console_play_png);
		type.set ("graphics/debug/console_play.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_visible.png", __ASSET__graphics_debug_console_visible_png);
		type.set ("graphics/debug/console_visible.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_logo.png", __ASSET__graphics_debug_console_logo_png);
		type.set ("graphics/debug/console_logo.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_hidden.png", __ASSET__graphics_debug_console_hidden_png);
		type.set ("graphics/debug/console_hidden.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_step.png", __ASSET__graphics_debug_console_step_png);
		type.set ("graphics/debug/console_step.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_pause.png", __ASSET__graphics_debug_console_pause_png);
		type.set ("graphics/debug/console_pause.png", AssetType.IMAGE);
		
		className.set ("font/04B_03__.ttf", __ASSET__font_04b_03___ttf);
		type.set ("font/04B_03__.ttf", AssetType.FONT);
		
		className.set ("font/04B_03__.ttf.png", __ASSET__font_04b_03___ttf_png);
		type.set ("font/04B_03__.ttf.png", AssetType.IMAGE);
		
		className.set ("graphics/life.png", __ASSET__graphics_life_png);
		type.set ("graphics/life.png", AssetType.IMAGE);
		
		className.set ("graphics/winner.png", __ASSET__graphics_winner_png);
		type.set ("graphics/winner.png", AssetType.IMAGE);
		
		className.set ("graphics/snow.png", __ASSET__graphics_snow_png);
		type.set ("graphics/snow.png", AssetType.IMAGE);
		
		className.set ("graphics/basica.png", __ASSET__graphics_basica_png);
		type.set ("graphics/basica.png", AssetType.IMAGE);
		
		className.set ("graphics/lock.png", __ASSET__graphics_lock_png);
		type.set ("graphics/lock.png", AssetType.IMAGE);
		
		className.set ("graphics/basicb.png", __ASSET__graphics_basicb_png);
		type.set ("graphics/basicb.png", AssetType.IMAGE);
		
		className.set ("graphics/fireTackle.png", __ASSET__graphics_firetackle_png);
		type.set ("graphics/fireTackle.png", AssetType.IMAGE);
		
		className.set ("graphics/playl.png", __ASSET__graphics_playl_png);
		type.set ("graphics/playl.png", AssetType.IMAGE);
		
		className.set ("graphics/basic.png", __ASSET__graphics_basic_png);
		type.set ("graphics/basic.png", AssetType.IMAGE);
		
		className.set ("graphics/stars1.png", __ASSET__graphics_stars1_png);
		type.set ("graphics/stars1.png", AssetType.IMAGE);
		
		className.set ("graphics/buster.png", __ASSET__graphics_buster_png);
		type.set ("graphics/buster.png", AssetType.IMAGE);
		
		className.set ("graphics/join.png", __ASSET__graphics_join_png);
		type.set ("graphics/join.png", AssetType.IMAGE);
		
		className.set ("graphics/exit.png", __ASSET__graphics_exit_png);
		type.set ("graphics/exit.png", AssetType.IMAGE);
		
		className.set ("graphics/snowball.png", __ASSET__graphics_snowball_png);
		type.set ("graphics/snowball.png", AssetType.IMAGE);
		
		className.set ("graphics/explosion.png", __ASSET__graphics_explosion_png);
		type.set ("graphics/explosion.png", AssetType.IMAGE);
		
		className.set ("graphics/red.png", __ASSET__graphics_red_png);
		type.set ("graphics/red.png", AssetType.IMAGE);
		
		className.set ("graphics/bbutton.png", __ASSET__graphics_bbutton_png);
		type.set ("graphics/bbutton.png", AssetType.IMAGE);
		
		className.set ("graphics/speed.png", __ASSET__graphics_speed_png);
		type.set ("graphics/speed.png", AssetType.IMAGE);
		
		className.set ("graphics/lockS.png", __ASSET__graphics_locks_png);
		type.set ("graphics/lockS.png", AssetType.IMAGE);
		
		className.set ("graphics/create.png", __ASSET__graphics_create_png);
		type.set ("graphics/create.png", AssetType.IMAGE);
		
		className.set ("graphics/shipR.png", __ASSET__graphics_shipr_png);
		type.set ("graphics/shipR.png", AssetType.IMAGE);
		
		className.set ("graphics/ships/ship6.png", __ASSET__graphics_ships_ship6_png);
		type.set ("graphics/ships/ship6.png", AssetType.IMAGE);
		
		className.set ("graphics/ships/ship1.png", __ASSET__graphics_ships_ship1_png);
		type.set ("graphics/ships/ship1.png", AssetType.IMAGE);
		
		className.set ("graphics/ships/ship4.png", __ASSET__graphics_ships_ship4_png);
		type.set ("graphics/ships/ship4.png", AssetType.IMAGE);
		
		className.set ("graphics/ships/ship2.png", __ASSET__graphics_ships_ship2_png);
		type.set ("graphics/ships/ship2.png", AssetType.IMAGE);
		
		className.set ("graphics/ships/ship3.png", __ASSET__graphics_ships_ship3_png);
		type.set ("graphics/ships/ship3.png", AssetType.IMAGE);
		
		className.set ("graphics/ships/ship5.png", __ASSET__graphics_ships_ship5_png);
		type.set ("graphics/ships/ship5.png", AssetType.IMAGE);
		
		className.set ("graphics/point.png", __ASSET__graphics_point_png);
		type.set ("graphics/point.png", AssetType.IMAGE);
		
		className.set ("graphics/stars2.png", __ASSET__graphics_stars2_png);
		type.set ("graphics/stars2.png", AssetType.IMAGE);
		
		className.set ("graphics/Paralyzer.png", __ASSET__graphics_paralyzer_png);
		type.set ("graphics/Paralyzer.png", AssetType.IMAGE);
		
		className.set ("graphics/shipL.png", __ASSET__graphics_shipl_png);
		type.set ("graphics/shipL.png", AssetType.IMAGE);
		
		className.set ("graphics/energy.png", __ASSET__graphics_energy_png);
		type.set ("graphics/energy.png", AssetType.IMAGE);
		
		className.set ("graphics/xbutton.png", __ASSET__graphics_xbutton_png);
		type.set ("graphics/xbutton.png", AssetType.IMAGE);
		
		className.set ("graphics/playb.png", __ASSET__graphics_playb_png);
		type.set ("graphics/playb.png", AssetType.IMAGE);
		
		className.set ("graphics/basicMask.png", __ASSET__graphics_basicmask_png);
		type.set ("graphics/basicMask.png", AssetType.IMAGE);
		
		className.set ("graphics/nopoint.png", __ASSET__graphics_nopoint_png);
		type.set ("graphics/nopoint.png", AssetType.IMAGE);
		
		className.set ("graphics/ybutton.png", __ASSET__graphics_ybutton_png);
		type.set ("graphics/ybutton.png", AssetType.IMAGE);
		
		className.set ("graphics/entity.png", __ASSET__graphics_entity_png);
		type.set ("graphics/entity.png", AssetType.IMAGE);
		
		className.set ("graphics/green.png", __ASSET__graphics_green_png);
		type.set ("graphics/green.png", AssetType.IMAGE);
		
		className.set ("graphics/back.png", __ASSET__graphics_back_png);
		type.set ("graphics/back.png", AssetType.IMAGE);
		
		
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
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
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
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
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
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
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
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofString (event.currentTarget.data);
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
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
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
			image.src = path.get (id) + "?" + Assets.cache.version;
			
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
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
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
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__graphics_preloader_haxepunk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_debug_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_output_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_play_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_visible_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_hidden_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_step_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_pause_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__font_04b_03___ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__font_04b_03___ttf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_life_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_winner_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_snow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_basica_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_lock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_basicb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_firetackle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_playl_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_basic_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_stars1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_buster_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_join_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_exit_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_snowball_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_explosion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_red_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_bbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_speed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_locks_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_create_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_shipr_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_ships_ship6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_ships_ship1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_ships_ship4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_ships_ship2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_ships_ship3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_ships_ship5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_point_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_stars2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_paralyzer_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_shipl_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_energy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_xbutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_playb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_basicmask_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_nopoint_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_ybutton_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_entity_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_green_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5










@:keep #if display private #end class __ASSET__font_04b_03___ttf extends lime.text.Font { public function new () { super (); name = "04b03"; } } 











































#else



#if (windows || mac || linux || cpp)


@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/preloader/haxepunk.png") #if display private #end class __ASSET__graphics_preloader_haxepunk_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_debug.png") #if display private #end class __ASSET__graphics_debug_console_debug_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_output.png") #if display private #end class __ASSET__graphics_debug_console_output_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_play.png") #if display private #end class __ASSET__graphics_debug_console_play_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_visible.png") #if display private #end class __ASSET__graphics_debug_console_visible_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_logo.png") #if display private #end class __ASSET__graphics_debug_console_logo_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_hidden.png") #if display private #end class __ASSET__graphics_debug_console_hidden_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_step.png") #if display private #end class __ASSET__graphics_debug_console_step_png extends lime.graphics.Image {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/graphics/debug/console_pause.png") #if display private #end class __ASSET__graphics_debug_console_pause_png extends lime.graphics.Image {}
@:font("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/font/04B_03__.ttf") #if display private #end class __ASSET__font_04b_03___ttf extends lime.text.Font {}
@:image("/usr/lib/haxe/lib/HaxePunk/2,5,6/assets/font/04B_03__.ttf.png") #if display private #end class __ASSET__font_04b_03___ttf_png extends lime.graphics.Image {}
@:image("assets/graphics/life.png") #if display private #end class __ASSET__graphics_life_png extends lime.graphics.Image {}
@:image("assets/graphics/winner.png") #if display private #end class __ASSET__graphics_winner_png extends lime.graphics.Image {}
@:image("assets/graphics/snow.png") #if display private #end class __ASSET__graphics_snow_png extends lime.graphics.Image {}
@:image("assets/graphics/basica.png") #if display private #end class __ASSET__graphics_basica_png extends lime.graphics.Image {}
@:image("assets/graphics/lock.png") #if display private #end class __ASSET__graphics_lock_png extends lime.graphics.Image {}
@:image("assets/graphics/basicb.png") #if display private #end class __ASSET__graphics_basicb_png extends lime.graphics.Image {}
@:image("assets/graphics/fireTackle.png") #if display private #end class __ASSET__graphics_firetackle_png extends lime.graphics.Image {}
@:image("assets/graphics/playl.png") #if display private #end class __ASSET__graphics_playl_png extends lime.graphics.Image {}
@:image("assets/graphics/basic.png") #if display private #end class __ASSET__graphics_basic_png extends lime.graphics.Image {}
@:image("assets/graphics/stars1.png") #if display private #end class __ASSET__graphics_stars1_png extends lime.graphics.Image {}
@:image("assets/graphics/buster.png") #if display private #end class __ASSET__graphics_buster_png extends lime.graphics.Image {}
@:image("assets/graphics/join.png") #if display private #end class __ASSET__graphics_join_png extends lime.graphics.Image {}
@:image("assets/graphics/exit.png") #if display private #end class __ASSET__graphics_exit_png extends lime.graphics.Image {}
@:image("assets/graphics/snowball.png") #if display private #end class __ASSET__graphics_snowball_png extends lime.graphics.Image {}
@:image("assets/graphics/explosion.png") #if display private #end class __ASSET__graphics_explosion_png extends lime.graphics.Image {}
@:image("assets/graphics/red.png") #if display private #end class __ASSET__graphics_red_png extends lime.graphics.Image {}
@:image("assets/graphics/bbutton.png") #if display private #end class __ASSET__graphics_bbutton_png extends lime.graphics.Image {}
@:image("assets/graphics/speed.png") #if display private #end class __ASSET__graphics_speed_png extends lime.graphics.Image {}
@:image("assets/graphics/lockS.png") #if display private #end class __ASSET__graphics_locks_png extends lime.graphics.Image {}
@:image("assets/graphics/create.png") #if display private #end class __ASSET__graphics_create_png extends lime.graphics.Image {}
@:image("assets/graphics/shipR.png") #if display private #end class __ASSET__graphics_shipr_png extends lime.graphics.Image {}
@:image("assets/graphics/ships/ship6.png") #if display private #end class __ASSET__graphics_ships_ship6_png extends lime.graphics.Image {}
@:image("assets/graphics/ships/ship1.png") #if display private #end class __ASSET__graphics_ships_ship1_png extends lime.graphics.Image {}
@:image("assets/graphics/ships/ship4.png") #if display private #end class __ASSET__graphics_ships_ship4_png extends lime.graphics.Image {}
@:image("assets/graphics/ships/ship2.png") #if display private #end class __ASSET__graphics_ships_ship2_png extends lime.graphics.Image {}
@:image("assets/graphics/ships/ship3.png") #if display private #end class __ASSET__graphics_ships_ship3_png extends lime.graphics.Image {}
@:image("assets/graphics/ships/ship5.png") #if display private #end class __ASSET__graphics_ships_ship5_png extends lime.graphics.Image {}
@:image("assets/graphics/point.png") #if display private #end class __ASSET__graphics_point_png extends lime.graphics.Image {}
@:image("assets/graphics/stars2.png") #if display private #end class __ASSET__graphics_stars2_png extends lime.graphics.Image {}
@:image("assets/graphics/Paralyzer.png") #if display private #end class __ASSET__graphics_paralyzer_png extends lime.graphics.Image {}
@:image("assets/graphics/shipL.png") #if display private #end class __ASSET__graphics_shipl_png extends lime.graphics.Image {}
@:image("assets/graphics/energy.png") #if display private #end class __ASSET__graphics_energy_png extends lime.graphics.Image {}
@:image("assets/graphics/xbutton.png") #if display private #end class __ASSET__graphics_xbutton_png extends lime.graphics.Image {}
@:image("assets/graphics/playb.png") #if display private #end class __ASSET__graphics_playb_png extends lime.graphics.Image {}
@:image("assets/graphics/basicMask.png") #if display private #end class __ASSET__graphics_basicmask_png extends lime.graphics.Image {}
@:image("assets/graphics/nopoint.png") #if display private #end class __ASSET__graphics_nopoint_png extends lime.graphics.Image {}
@:image("assets/graphics/ybutton.png") #if display private #end class __ASSET__graphics_ybutton_png extends lime.graphics.Image {}
@:image("assets/graphics/entity.png") #if display private #end class __ASSET__graphics_entity_png extends lime.graphics.Image {}
@:image("assets/graphics/green.png") #if display private #end class __ASSET__graphics_green_png extends lime.graphics.Image {}
@:image("assets/graphics/back.png") #if display private #end class __ASSET__graphics_back_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__font_04b_03___ttf extends openfl.text.Font { public function new () { var font = new __ASSET__font_04b_03___ttf (); src = font.src; name = font.name; super (); }}

#end

#end