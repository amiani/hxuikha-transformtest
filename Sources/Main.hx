package;

import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.math.FastMatrix3;
import haxe.ui.Toolkit;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.containers.VBox;
import haxe.ui.components.Button;
import haxe.ui.components.DropDown;

class Main {
	static var box : VBox;

	static function initUI() {
		box = ComponentMacros.buildComponent('../Assets/ui.xml', VBox);
		var button = box.findComponent('button', Button);
		button.onClick = e -> button.text = 'Touched';
		box.ready();
	}

	static function update(): Void {

	}

	static function render(frames: Array<Framebuffer>): Void {
		var g = frames[0].g2;
		g.begin();
		g.pushTransformation(g.transformation.multmat(FastMatrix3.translation(100, 0)));
		box.renderTo(g);
		g.popTransformation();
		g.end();
	}

	public static function main() {
		System.start({title: "Transform Test", width: 1024, height: 768}, function (_) {
			Assets.loadEverything(function () {
				Toolkit.init();
				initUI();
				Scheduler.addTimeTask(function () { update(); }, 0, 1 / 60);
				System.notifyOnFrames(function (frames) { render(frames); });
			});
		});
	}
}
