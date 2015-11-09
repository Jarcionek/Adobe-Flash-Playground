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
			super.x = calculatePosition(
				super.x,
				velocity * isKeyDown(Keyboard.RIGHT),
				velocity * isKeyDown(Keyboard.LEFT),
				ship_width / 2,
				scene_width - ship_width / 2
			);

			super.y = calculatePosition(
				super.y,
				velocity * isKeyDown(Keyboard.DOWN),
				velocity * isKeyDown(Keyboard.UP),
				ship_height / 2,
				scene_height - ship_height / 2
			);
		}

		private function calculatePosition(currentPosition: int, toAdd: int, toSubtract: int, min: int, max: int): int {
			var result = currentPosition + toAdd - toSubtract;

			if (result > max) {
				return max;
			}
			if (result < min) {
				return min;
			}

			return result;
		}

		private var hash: Object = {};

		private function keyHandleUp(event: KeyboardEvent): void {
			delete hash[event.keyCode];
		}

		private function keyHandleDown(event: KeyboardEvent): void {
			hash[event.keyCode] = 1;
		}

		private function isKeyDown(code: int): int {
			return hash[code] == undefined ? 0 : 1;
		}

	}

}