package {

import flash.display.MovieClip;
import flash.events.Event;

//noinspection JSUnusedGlobalSymbols
public class Main extends MovieClip {

    private var ship:Ship;

    //noinspection JSUnusedGlobalSymbols
    public function Main() {
        var keyService:KeyService = new KeyService(stage);

        this.ship = new Ship(stage.stageWidth / 2, stage.stageHeight / 2, keyService);

        stage.addChild(new Background(0, 150));
        stage.addChild(new Background(2110, 150));
        stage.addChild(ship);

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {
        if (int(Math.random() * 60) == 0) {
            stage.addChild(new EnemyShip(this.ship));
        }
    }

}

}
