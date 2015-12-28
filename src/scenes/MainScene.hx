import com.haxepunk.Scene;

class MainScene extends Scene {
	public override function begin() {
		add(new entities.Player1(20, 20, 1, 1, 1, 2, 3));
	}
}