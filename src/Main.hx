import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Main extends Engine {

	override public function init() {
#if debug
		HXP.console.enable();
#end
		HXP.fullscreen = true;
		HXP.scene = new scenes.TitleScreen();
	}

	public static function main() { 
		new Main();
	}
}