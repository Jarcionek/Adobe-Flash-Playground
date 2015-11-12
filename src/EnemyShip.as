﻿package {

import flash.display.MovieClip;
import flash.events.Event;

public class EnemyShip extends MovieClip {

    public static const ships:Array = [];

    private var speed:int;
    private var playerShip:PlayerShip;

    public function EnemyShip(ship:PlayerShip) {
        this.addChild(Assets.bitmap(new Assets.enemyShipBitmap));

        this.playerShip = ship;

        this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);

        ships.push(this);
    }

    private function onAddedToStage(e:Event):void {
        this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        this.x = stage.stageWidth + this.width;
        this.y = Math.random() * (stage.stageHeight - this.height) + this.height / 2;
        this.speed = Math.random() * 5 + 5;
    }

    private function onEnterFrame(event:Event):void {
        this.x = this.x - speed;

        if (this.hitTestObject(playerShip)) {
            this.explode();
        } else if (this.x < -this.width) {
            this.removeFromStage();
        }
    }

    public function explode(): void {
        trace('explosion at ' + this.x + ',' + this.y);

        this.removeFromStage();
    }

    private function removeFromStage():void {
        for (var i:int = 0; i < ships.length; i++) {
            if (ships[i] == this) {
                ships[i] = null;
                break;
            }
        }
        if (ships[0] == null) {
            ships.shift();
        }
        this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
        this.parent.removeChild(this);
    }

}

}
