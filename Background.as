package  {

	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Background extends MovieClip {
		
		private static const speed: int = 1;

		public function Background() {
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(event: Event): void {
			this.x = this.x - speed;
			if (this.x < -stage.width / 2) {
				this.x = stage.width / 2;
			}
		}

	}
	
}
