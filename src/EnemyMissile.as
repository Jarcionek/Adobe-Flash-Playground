package {
import flash.display.Sprite;
import flash.events.Event;

public class EnemyMissile extends Sprite {

    private static const speed:int = 20;

    public function EnemyMissile(x:int, y:int) {
        this.addChild(Assets.bitmap(new Assets.enemyMissile));
        this.x = x;
        this.y = y;
        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {
        this.x = this.x - speed;

        if (this.x < -this.width) {
            this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
            this.parent.removeChild(this);
        }
    }

}

}
