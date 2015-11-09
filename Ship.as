package {

	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;

	public class Ship extends MovieClip {

		const scene_width = 600;
		const scene_height = 300;
		const ship_width = 79;
		const ship_height = 39;
		const velocity = 10;

		public function Ship() {
			addEventListener('enterFrame', onEnterFrame);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyHandleUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandleDown);
		}

		function onEnterFrame(event: Event): void {
			if (isKeyDown(Keyboard.LEFT)) {
				super.x = super.x - velocity;
			}
			if (isKeyDown(Keyboard.UP)) {
				super.y = super.y - velocity;
			}
			if (isKeyDown(Keyboard.RIGHT)) {
				super.x = super.x + velocity;
			}
			if (isKeyDown(Keyboard.DOWN)) {
				super.y = super.y + velocity;
			}

			if (super.x > scene_width - ship_width / 2) {
				super.x = scene_width - ship_width / 2;
			} else if (super.x < ship_width / 2) {
				super.x = ship_width / 2;
			}
			if (super.y > scene_height - ship_height / 2) {
				super.y = scene_height - ship_height / 2;
			} else if (super.y < ship_height / 2) {
				super.y = ship_height / 2;
			}
		}

		private var hash: Object = {};

		private function keyHandleUp(event: KeyboardEvent): void {
			delete hash[event.keyCode];
		}

		private function keyHandleDown(event: KeyboardEvent): void {
			hash[event.keyCode] = 1;
		}

		private function isKeyDown(code: int): Boolean {
			return hash[code] !== undefined;
		}

	}

}