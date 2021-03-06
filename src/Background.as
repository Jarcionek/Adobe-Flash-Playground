﻿package {

import flash.display.MovieClip;
import flash.events.Event;

public class Background extends MovieClip {

    private static const speed:int = 1;

    public function Background(x: int, y: int) {
        this.addChild(Assets.bitmap(new Assets.background));
        this.x = x;
        this.y = y;
        this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {
        this.x -= speed;
        if (this.x < -this.width) {
            this.x = this.width;
        }
    }

}

}
