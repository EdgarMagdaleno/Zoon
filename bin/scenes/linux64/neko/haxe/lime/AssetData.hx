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
			path.set ("graphics/debug/console_play.png", "graphics/debug/console_play.png");
			type.set ("graphics/debug/console_play.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_visible.png", "graphics/debug/console_visible.png");
			type.set ("graphics/debug/console_visible.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_pause.png", "graphics/debug/console_pause.png");
			type.set ("graphics/debug/console_pause.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_debug.png", "graphics/debug/console_debug.png");
			type.set ("graphics/debug/console_debug.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_step.png", "graphics/debug/console_step.png");
			type.set ("graphics/debug/console_step.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_output.png", "graphics/debug/console_output.png");
			type.set ("graphics/debug/console_output.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_logo.png", "graphics/debug/console_logo.png");
			type.set ("graphics/debug/console_logo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/debug/console_hidden.png", "graphics/debug/console_hidden.png");
			type.set ("graphics/debug/console_hidden.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("font/04B_03__.ttf.png", "font/04B_03__.ttf.png");
			type.set ("font/04B_03__.ttf.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("font/04B_03__.ttf", "font/04B_03__.ttf");
			type.set ("font/04B_03__.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("graphics/lockS.png", "graphics/lockS.png");
			type.set ("graphics/lockS.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/entity.png", "graphics/entity.png");
			type.set ("graphics/entity.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/back.png", "graphics/back.png");
			type.set ("graphics/back.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/playb.png", "graphics/playb.png");
			type.set ("graphics/playb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/stars2.png", "graphics/stars2.png");
			type.set ("graphics/stars2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/lock.png", "graphics/lock.png");
			type.set ("graphics/lock.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/playl.png", "graphics/playl.png");
			type.set ("graphics/playl.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/stars1.png", "graphics/stars1.png");
			type.set ("graphics/stars1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/shipL.png", "graphics/shipL.png");
			type.set ("graphics/shipL.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/shipR.png", "graphics/shipR.png");
			type.set ("graphics/shipR.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/bullet.png", "graphics/bullet.png");
			type.set ("graphics/bullet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/ships/ship4.png", "graphics/ships/ship4.png");
			type.set ("graphics/ships/ship4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/ships/ship5.png", "graphics/ships/ship5.png");
			type.set ("graphics/ships/ship5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/ships/ship2.png", "graphics/ships/ship2.png");
			type.set ("graphics/ships/ship2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/ships/ship1.png", "graphics/ships/ship1.png");
			type.set ("graphics/ships/ship1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("graphics/ships/ship3.png", "graphics/ships/ship3.png");
			type.set ("graphics/ships/ship3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
