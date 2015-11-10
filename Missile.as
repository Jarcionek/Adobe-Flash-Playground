package {
	
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Missile extends MovieClip {
		
		private static const speed = 20;

		public function Missile() {
			addEventListener('enterFrame', onEnterFrame);
		}

		function onEnterFrame(event: Event): void {
			super.x = super.x + speed;
			if (super.x > 600) {
				super.removeEventListener('enterFrame', onEnterFrame);
				super.parent.removeChild(this);
			}
		}
		
	}

}