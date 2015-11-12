package {

import flash.display.MovieClip;
import flash.events.Event;

//noinspection JSUnusedGlobalSymbols
public class Main extends MovieClip {

    private var playerShip:PlayerShip;

    //noinspection JSUnusedGlobalSymbols
    public function Main() {
        var keyService:KeyService = new KeyService(stage);

        playerShip = new PlayerShip(stage.stageWidth / 2, stage.stageHeight / 2, keyService);

        stage.addChild(new Background(2110 * 1 / 2, 300 / 2));
        stage.addChild(new Background(2110 * 3 / 2, 300 / 2));
        stage.addChild(playerShip);

        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {
        if (int(Math.random() * 60) == 0) {
            stage.addChild(new EnemyShip(playerShip));
        }
    }

}

}
