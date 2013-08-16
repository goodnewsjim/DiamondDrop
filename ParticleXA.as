package
{
    
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.ColorTransform;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.media.Sound;
    
    //import mx.effects.Tween;
      //  	import fl.transitions.TweenEvent;
	//import fl.transitions.easing.*;
	
	    
  	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;

    public class ParticleXA extends Sprite
    {
		//var particle:Particle;
        var velx:int=0;
		var vely:int=0;
		var b:Particle;
//x,y explanitory
		var xx:int=0;
		var yy:int=0;
		var accx:int=0;
		var accy:int=0;        
		var angle:Number=0;
		var tweena:Tween;
		var tweenb:Tween;
		var tweenc:Tween;
		var tweend:Tween;
		var tweene:Tween;
		
        public function ParticleXA(bit:Bitmap,x1:int,y1:int,rgb:RGB)
        {
		b=new Particle();
		//b=copybitmap(8,8,bit,true, 0x00FF00CC);
		b.transform.colorTransform = new ColorTransform(1, 1, 1, 1, rgb.r, rgb.g,rgb.b,0 );
		b.x=x1;
		b.y=y1;
		b.x=0;
		b.y=0;
		addChild(b);
		
        }
        
        public static function copybitmap(x1:int,y1:int,b2:Bitmap,trans:Boolean=true, color:Number=0x00000000)
		{
		
			var bitmap2:BitmapData;
			
			//bitmap2 = new BitmapData( spr.width, spr.height, trans, color );
			//bitmap2.draw( spr );
			
			bitmap2=b2.bitmapData.clone();
			//bitmap2=b2.bitmapData;
			
			
			var p:Point;
			p=new Point;
			p.x=0;
			p.y=0;
			//var secondRect:Rectangle = new Rectangle(0, 0, x1, y1);
			//Done
			var bitmap:Bitmap;
			//bitmap = new BitmapData(x1, y1, trans,color);
			
			
			
			bitmap=new Bitmap(bitmap2);
			
			///bitmap.copyPixels(bitmap2, secondRect, p);
			
			//bitmap.draw( spr );
			
			return bitmap;
		}

    }

    
}