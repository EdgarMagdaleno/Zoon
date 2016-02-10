import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.haxepunk.utils.Key;

class Main extends Engine {

	override public function init() {
#if debug
		HXP.console.enable(Key.F1);
#end
		HXP.scene = new scenes.ShipSelectScene();
		HXP.fullscreen = true;
	}

	public static function main() { 
		new Main();
	}
}