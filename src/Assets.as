package {
import flash.display.Bitmap;

public class Assets {

    [Embed(source="background.jpg")]
    public static const background:Class;

    [Embed(source="enemyShip.png")]
    public static const enemyShipBitmap:Class;

    [Embed(source="playerShip.png")]
    public static const playerShipBitmap:Class;

    [Embed(source="missile.png")]
    public static const missile:Class;


    public static function bitmap(bitmap:Bitmap):Bitmap {
        var result:Bitmap = bitmap as Bitmap;
        result.x = -result.width / 2;
        result.y = -result.height / 2;
        return result;
    }

}

}
