package {
import flash.display.Sprite;
import flash.events.Event;

public class EnemyMissile extends Sprite {

    private static const speed:int = 20;

    private var playerShip:PlayerShip;

    private var speedX:int;
    private var speedY:int;

    public function EnemyMissile(x:int, y:int, playerShip:PlayerShip) {
        this.addChild(Assets.bitmap(new Assets.enemyMissile));
        this.x = x;
        this.y = y;

        this.playerShip = playerShip;

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);

        var xDiff:int = playerShip.x - this.x;
        var yDiff:int = playerShip.y - this.y;
        var dist:Number = Math.sqrt(xDiff * xDiff + yDiff * yDiff);

        speedX = speed * xDiff / dist;
        speedY = speed * yDiff / dist;
    }

    private function onEnterFrame(event:Event):void {
        this.x += speedX;
        this.y += speedY;

        if (this.hitTestObject(playerShip)) {
            trace('player ship hit'); //TODO
            removeFromStage();
        } else if (this.x < -this.width
                || this.x > stage.stageWidth + this.width
                || this.y < -this.height
                || this.y > stage.stageHeight + this.height) {
            removeFromStage();
        }
    }

    private function removeFromStage():void {
        this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
        this.parent.removeChild(this);
    }

}

}
