package  {
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;

    public class Main extends MovieClip {

		public function Main() {
			stage.addEventListener(KeyboardEvent.KEY_UP, keyHandleUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandleDown);
		}
		
		private var heldKeys: Object = {};

		private function keyHandleUp(event: KeyboardEvent): void {
			delete heldKeys[event.keyCode];
		}

		private function keyHandleDown(event: KeyboardEvent): void {
			heldKeys[event.keyCode] = true;
		}

		public function isKeyDown(code: int): Boolean {
			return heldKeys[code];
		}

	}
	
}
