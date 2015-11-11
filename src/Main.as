package {

import flash.display.MovieClip;
import flash.events.Event;

//noinspection JSUnusedGlobalSymbols
public class Main extends MovieClip {

    //noinspection JSUnusedGlobalSymbols
    public function Main() {
        var keyService:KeyService = new KeyService(stage);

        this.addChildAt(new Background(0, 150), this.numChildren);
        this.addChildAt(new Background(2110, 150), this.numChildren);
        this.addChildAt(new Ship(stage.stageWidth / 2, stage.stageHeight / 2, keyService), this.numChildren);

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {
        if (int(Math.random() * 60) == 0) {
            this.addChildAt(new EnemyShip(), this.numChildren);
        }
    }

}

}
