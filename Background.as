package  {

	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Background extends MovieClip{

		public function Background() {
			addEventListener('enterFrame', onEnterFrame);
		}

		function onEnterFrame(event: Event): void {
			super.x = super.x - 1;
			if (super.x < -2110) {
				super.x = 0;
			}
		}

	}
	
}
