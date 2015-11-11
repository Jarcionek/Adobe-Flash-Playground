package {

import flash.display.MovieClip;
import flash.events.Event;
import flash.ui.Keyboard;

public class Ship extends MovieClip {

    private static const velocity:int = 10;
    private static const fireRateCoolDown:int = 8;

    private var fireRateCount:int = 0;

    private var keyService:KeyService;

    public function Ship(x:int, y:int, keyService:KeyService) {
        this.x = x;
        this.y = y;
        this.keyService = keyService;
        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {
        this.x = calculatePosition(
                this.x,
                movingRightModifier() + movingLeftModifier(),
                this.width / 2,
                stage.stageWidth - this.width / 2
        );

        this.y = calculatePosition(
                this.y,
                movingDownModifier() + movingUpModifier(),
                this.height / 2,
                stage.stageHeight - this.height / 2
        );

        if (keyService.isKeyDown(Keyboard.SPACE) && fireRateCount <= 0) {
            var missile:Missile = new Missile(this.x + 50, this.y + 2);
            stage.addChildAt(missile, stage.numChildren);
            fireRateCount = fireRateCoolDown;
        }
        fireRateCount--;
    }

    private static function calculatePosition(currentPosition:int, velocityMultiplier:int, min:int, max:int):int {
        var result:int = currentPosition + velocityMultiplier * velocity;

        if (result > max) {
            return max;
        }
        if (result < min) {
            return min;
        }

        return result;
    }


    private function movingRightModifier():int {
        return keyService.isKeyDown(Keyboard.RIGHT) || keyService.isKeyDown(Keyboard.D) ? 1 : 0;
    }

    private function movingLeftModifier():int {
        return keyService.isKeyDown(Keyboard.LEFT) || keyService.isKeyDown(Keyboard.A) ? -1 : 0
    }

    private function movingUpModifier():int {
        return keyService.isKeyDown(Keyboard.DOWN) || keyService.isKeyDown(Keyboard.S) ? 1 : 0
    }

    private function movingDownModifier():int {
        return keyService.isKeyDown(Keyboard.UP) || keyService.isKeyDown(Keyboard.W) ? -1 : 0
    }

}

}
