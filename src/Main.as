package {

import flash.display.MovieClip;
import flash.events.Event;
import flash.events.KeyboardEvent;

public class Main extends MovieClip {

    public function Main() {
        stage.addEventListener(KeyboardEvent.KEY_UP, keyHandleUp);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandleDown);
        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {
        if (int(Math.random() * 60) == 0) {
            this.addChildAt(new EnemyShip(), this.numChildren);
        }
    }


    private var heldKeys:Object = {};

    private function keyHandleUp(event:KeyboardEvent):void {
        delete heldKeys[event.keyCode];
    }

    private function keyHandleDown(event:KeyboardEvent):void {
        heldKeys[event.keyCode] = true;
    }

    public function isKeyDown(code:int):Boolean {
        return heldKeys[code];
    }

}

}
