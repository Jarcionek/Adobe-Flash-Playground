package {
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.KeyboardEvent;

public class KeyService extends Sprite {

    private var heldKeys:Object = {};

    public function KeyService(stage:Stage) {
        stage.addEventListener(KeyboardEvent.KEY_UP, keyHandleUp);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandleDown);
    }

    public function isKeyDown(code:int):Boolean {
        return heldKeys[code];
    }

    private function keyHandleUp(event:KeyboardEvent):void {
        delete heldKeys[event.keyCode];
    }

    private function keyHandleDown(event:KeyboardEvent):void {
        heldKeys[event.keyCode] = true;
    }

}

}
