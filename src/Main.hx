import hxd.Key;
import haxe.io.Float32Array;
import hxd.FloatBuffer;

class Main extends hxd.App{
    var hero : h2d.Bitmap;

    var velocity : Float = 0;
    var gravity : Float = 10;
    
    var chunkSize : Float = 100;
    
    var windowsizex : Int = 800;
    var windowsizey : Int = 768;

    var herosizex : Int = 100;
    var herosizey : Int = 100;

    override function init () {
       // create a white box + create 100x100 tile from it
        var tile = h2d.Tile.fromColor(0xFFFFFF, herosizex, herosizey);
        tile.dx = -tile.width * 0.5;
        tile.dy = -tile.height * 0.5;
        
       //create a bitmap jbject and add it to the default 2d scene (s2d)
        hero = new h2d.Bitmap(tile, s2d);

       //modify the display position of bitmap
       hero.x = s2d.width * 0.5;
       hero.y = s2d.height * 0.5;
    }

    

    override function update(dt:Float){ 
       MoveHero();
    }

    function MoveHero() {
        if(Key.isDown(Key.A)&&(hero.x >= (herosizex/2)))
            hero.x --;
        if(Key.isDown(Key.D)&&(hero.x <= (windowsizex-(herosizex/2))))
            hero.x ++;
        if(Key.isDown(Key.W)&&(hero.y >= (herosizex/2)))
            hero.y --;
        if(Key.isDown(Key.S)&&(hero.y <= (windowsizey-(herosizey/2))))
            hero.y ++;
    }

    static function main() {
        new Main();
    }


}