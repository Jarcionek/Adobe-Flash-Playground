package {
	
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Missile extends MovieClip {
		
		private static const speed: int = 20;

		public function Missile(x: int, y: int) {
			this.x = x;
			this.y = y;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(event: Event): void {
			this.x = this.x + speed;
			if (this.x > stage.stageWidth) {
				this.removeEventListener('enterFrame', onEnterFrame);
				this.parent.removeChild(this);
			}
		}
		
	}

}