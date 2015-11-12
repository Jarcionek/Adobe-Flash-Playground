package {
import flash.display.Sprite;
import flash.events.Event;

public class EnemyMissile extends Sprite {

    private static const speed:int = 20;

    private var playerShip:PlayerShip;

    public function EnemyMissile(x:int, y:int, playerShip:PlayerShip) {
        this.addChild(Assets.bitmap(new Assets.enemyMissile));
        this.x = x;
        this.y = y;

        this.playerShip = playerShip;

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {
        this.x -= speed;

        if (this.hitTestObject(playerShip)) {
            trace('player ship hit'); //TODO
            removeFromStage();
        } else if (this.x < -this.width) {
            removeFromStage();
        }
    }

    private function removeFromStage():void {
        this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
        this.parent.removeChild(this);
    }

}

}
