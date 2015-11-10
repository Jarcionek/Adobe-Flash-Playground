package {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class Ship extends MovieClip {

		private static const scene_width = 600;
		private static const scene_height = 300;
		private static const ship_width = 79;
		private static const ship_height = 39;
		private static const velocity = 10;

		public function Ship() {
			addEventListener('enterFrame', onEnterFrame);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyHandleUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandleDown);
		}

		function onEnterFrame(event: Event): void {
			super.x = calculatePosition(
				super.x,
				movingRightModifier() + movingLeftModifier(),
				ship_width / 2,
				scene_width - ship_width / 2
			);

			super.y = calculatePosition(
				super.y,
				movingDownModifier() + movingUpModifier(),
				ship_height / 2,
				scene_height - ship_height / 2
			);

			if (isKeyDown(Keyboard.SPACE)) {
				var missile = new Missile();
				missile.x = missile.x + 50;
				missile.y = missile.y + 2;
				super.addChildAt(missile, 0);
			}
		}

		private function calculatePosition(currentPosition: int, velocityMultiplier: int, min: int, max: int): int {
			var result = currentPosition + velocityMultiplier * velocity;

			if (result > max) {
				return max;
			}
			if (result < min) {
				return min;
			}

			return result;
		}


		private function movingRightModifier(): int {
			return isKeyDown(Keyboard.RIGHT) || isKeyDown(Keyboard.D) ? 1 : 0;
		}

		private function movingLeftModifier(): int {
			return isKeyDown(Keyboard.LEFT) || isKeyDown(Keyboard.A) ? -1 : 0
		}

		private function movingUpModifier(): int {
			return isKeyDown(Keyboard.DOWN) || isKeyDown(Keyboard.S) ? 1 : 0
		}

		private function movingDownModifier(): int {
			return isKeyDown(Keyboard.UP) || isKeyDown(Keyboard.W) ? -1 : 0
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