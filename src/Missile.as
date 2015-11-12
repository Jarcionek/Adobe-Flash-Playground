package {

import flash.display.MovieClip;
import flash.events.Event;

public class Missile extends MovieClip {

    private static const speed:int = 20;

    public function Missile(x:int, y:int) {
        this.addChild(Assets.bitmap(new Assets.missile));
        this.x = x;
        this.y = y;
        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {
        this.x += speed;

        if (this.x > stage.stageWidth) {
            this.removeFromStage();
            return;
        }

        for (var i:int = 0; i < EnemyShip.ships.length; i++) {
            if (EnemyShip.ships[i] !== null && this.hitTestObject(EnemyShip.ships[i])) {
                EnemyShip.ships[i].explode();
                this.removeFromStage();
            }
        }
    }

    private function removeFromStage():void {
        this.removeEventListener('enterFrame', onEnterFrame);
        this.parent.removeChild(this);
    }

}

}
