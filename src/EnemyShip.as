package {

import flash.display.MovieClip;
import flash.events.Event;

public class EnemyShip extends MovieClip {

    private var speed:int;
    private var ship:Ship;

    public function EnemyShip(ship:Ship) {
        this.ship = ship;
        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onAddedToStage(e:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.x = stage.stageWidth + this.width;
        this.y = Math.random() * (stage.stageHeight - this.height) + this.height / 2;
        this.speed = Math.random() * 5 + 5;
    }

    private function onEnterFrame(event:Event):void {
        this.x = this.x - speed;
        if (this.x < -this.width || this.hitTestObject(ship)) {
            this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
            this.parent.removeChild(this);
        }
    }

}

}
