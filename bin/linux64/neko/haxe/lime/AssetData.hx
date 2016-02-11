package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("graphics/preloader/haxepunk.png", "graphics/preloader/haxepunk.png");
			type.set ("graphics/preloader/haxepunk.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_debug.png", "graphics/debug/console_debug.png");
			type.set ("graphics/debug/console_debug.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_output.png", "graphics/debug/console_output.png");
			type.set ("graphics/debug/console_output.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_play.png", "graphics/debug/console_play.png");
			type.set ("graphics/debug/console_play.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_visible.png", "graphics/debug/console_visible.png");
			type.set ("graphics/debug/console_visible.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_logo.png", "graphics/debug/console_logo.png");
			type.set ("graphics/debug/console_logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_hidden.png", "graphics/debug/console_hidden.png");
			type.set ("graphics/debug/console_hidden.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_step.png", "graphics/debug/console_step.png");
			type.set ("graphics/debug/console_step.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_pause.png", "graphics/debug/console_pause.png");
			type.set ("graphics/debug/console_pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("font/04B_03__.ttf", "font/04B_03__.ttf");
			type.set ("font/04B_03__.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("font/04B_03__.ttf.png", "font/04B_03__.ttf.png");
			type.set ("font/04B_03__.ttf.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/life.png", "graphics/life.png");
			type.set ("graphics/life.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/selector.png", "graphics/selector.png");
			type.set ("graphics/selector.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/winner.png", "graphics/winner.png");
			type.set ("graphics/winner.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/snow.png", "graphics/snow.png");
			type.set ("graphics/snow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/basica.png", "graphics/basica.png");
			type.set ("graphics/basica.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/lock.png", "graphics/lock.png");
			type.set ("graphics/lock.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/basicb.png", "graphics/basicb.png");
			type.set ("graphics/basicb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/fireTackle.png", "graphics/fireTackle.png");
			type.set ("graphics/fireTackle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/playl.png", "graphics/playl.png");
			type.set ("graphics/playl.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/basic.png", "graphics/basic.png");
			type.set ("graphics/basic.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/stars1.png", "graphics/stars1.png");
			type.set ("graphics/stars1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/buster.png", "graphics/buster.png");
			type.set ("graphics/buster.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/join.png", "graphics/join.png");
			type.set ("graphics/join.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/exit.png", "graphics/exit.png");
			type.set ("graphics/exit.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/snowball.png", "graphics/snowball.png");
			type.set ("graphics/snowball.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/explosion.png", "graphics/explosion.png");
			type.set ("graphics/explosion.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/red.png", "graphics/red.png");
			type.set ("graphics/red.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/bbutton.png", "graphics/bbutton.png");
			type.set ("graphics/bbutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/locked.png", "graphics/locked.png");
			type.set ("graphics/locked.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/speed.png", "graphics/speed.png");
			type.set ("graphics/speed.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/lockS.png", "graphics/lockS.png");
			type.set ("graphics/lockS.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/create.png", "graphics/create.png");
			type.set ("graphics/create.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/shipR.png", "graphics/shipR.png");
			type.set ("graphics/shipR.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/ships/ship6.png", "graphics/ships/ship6.png");
			type.set ("graphics/ships/ship6.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/ships/ship1.png", "graphics/ships/ship1.png");
			type.set ("graphics/ships/ship1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/ships/ship4.png", "graphics/ships/ship4.png");
			type.set ("graphics/ships/ship4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/ships/ship2.png", "graphics/ships/ship2.png");
			type.set ("graphics/ships/ship2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/ships/ship3.png", "graphics/ships/ship3.png");
			type.set ("graphics/ships/ship3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/ships/ship5.png", "graphics/ships/ship5.png");
			type.set ("graphics/ships/ship5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/icons/avalanche.png", "graphics/icons/avalanche.png");
			type.set ("graphics/icons/avalanche.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/icons/buster.png", "graphics/icons/buster.png");
			type.set ("graphics/icons/buster.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/icons/snowball.png", "graphics/icons/snowball.png");
			type.set ("graphics/icons/snowball.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/icons/reflector.png", "graphics/icons/reflector.png");
			type.set ("graphics/icons/reflector.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/icons/firetackle.png", "graphics/icons/firetackle.png");
			type.set ("graphics/icons/firetackle.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/icons/paralyzer.png", "graphics/icons/paralyzer.png");
			type.set ("graphics/icons/paralyzer.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/icons/shotgun.png", "graphics/icons/shotgun.png");
			type.set ("graphics/icons/shotgun.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/point.png", "graphics/point.png");
			type.set ("graphics/point.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/stars2.png", "graphics/stars2.png");
			type.set ("graphics/stars2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/Paralyzer.png", "graphics/Paralyzer.png");
			type.set ("graphics/Paralyzer.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/shipL.png", "graphics/shipL.png");
			type.set ("graphics/shipL.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/energy.png", "graphics/energy.png");
			type.set ("graphics/energy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/xbutton.png", "graphics/xbutton.png");
			type.set ("graphics/xbutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/playb.png", "graphics/playb.png");
			type.set ("graphics/playb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/basicMask.png", "graphics/basicMask.png");
			type.set ("graphics/basicMask.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/nopoint.png", "graphics/nopoint.png");
			type.set ("graphics/nopoint.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/ybutton.png", "graphics/ybutton.png");
			type.set ("graphics/ybutton.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/entity.png", "graphics/entity.png");
			type.set ("graphics/entity.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/green.png", "graphics/green.png");
			type.set ("graphics/green.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/back.png", "graphics/back.png");
			type.set ("graphics/back.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
