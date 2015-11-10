package {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class Ship extends MovieClip {

		private static const velocity: int = 10;
		private static const fireRateCooldown: int = 8;

		private var fireRateCount: int = 0;
		
		private var main: Main;

		public function Ship() {
			this.main = this.parent as Main;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(event: Event): void {
			this.x = calculatePosition(
				this.x,
				movingRightModifier() + movingLeftModifier(),
				this.width / 2,
				stage.stageWidth - this.width / 2
			);

			this.y = calculatePosition(
				this.y,
				movingDownModifier() + movingUpModifier(),
				this.height / 2,
				stage.stageHeight - this.height / 2
			);

			if (main.isKeyDown(Keyboard.SPACE) && fireRateCount <= 0) {
				var missile = new Missile(this.x + 50, this.y + 2);
				main.addChildAt(missile, main.numChildren);
				fireRateCount = fireRateCooldown;
			}
			fireRateCount--;
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
			return main.isKeyDown(Keyboard.RIGHT) || main.isKeyDown(Keyboard.D) ? 1 : 0;
		}

		private function movingLeftModifier(): int {
			return main.isKeyDown(Keyboard.LEFT) || main.isKeyDown(Keyboard.A) ? -1 : 0
		}

		private function movingUpModifier(): int {
			return main.isKeyDown(Keyboard.DOWN) || main.isKeyDown(Keyboard.S) ? 1 : 0
		}

		private function movingDownModifier(): int {
			return main.isKeyDown(Keyboard.UP) || main.isKeyDown(Keyboard.W) ? -1 : 0
		}

	}

}