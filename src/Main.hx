import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Main extends Engine {
	private var sX:Int;
	private var sY:Int;

	override public function init() {
#if debug
		HXP.console.enable();
#end
		HXP.fullscreen = true;
		HXP.screen.scaleX = 5000;
		HXP.scene = new scenes.TitleScreen();
	}

	public static function main() { 
		new Main(); 
	}
}