package {

	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Ship extends MovieClip {

		var velocityX = 0;
		var velocityY = 0;

		public function Ship() {
			addEventListener('enterFrame', onEnterFrame);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyHandleUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandleDown);
		}

		function onEnterFrame(event) {
			var maxSpeed = 20;			
			
			if (isKeyDown(Keyboard.LEFT)) {
				velocityX--;
			}
			if (isKeyDown(Keyboard.UP)) {
				velocityY--;
			}
			if (isKeyDown(Keyboard.RIGHT)) {
				velocityX++;
			}
			if (isKeyDown(Keyboard.DOWN)) {
				velocityY++
			}
			
			if (velocityX > maxSpeed) {
				velocityX = maxSpeed;
			}
			if (velocityX < -maxSpeed) {
				velocityX = -maxSpeed;
			}
			if (velocityY > maxSpeed) {
				velocityY = maxSpeed;
			}
			if (velocityY < -maxSpeed) {
				velocityY = -maxSpeed;
			}
			
			super.x = (600 + super.x + velocityX) % 600;
			super.y = (300 + super.y + velocityY) % 300;
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