package
{
    
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.media.Sound;
        
    public class ParticleController extends Sprite
    {
        var effects:Array;
		var maxeffects:int;
        
        public function ParticleController( )
        {
		effects=new Array;
		maxeffects=0;
        }
        
		public function registereffect(o:Object)
		{
		effects[maxeffects]=o;
		maxeffects++;
		}
		
		public function advancemilliseconds(ms:int)
		{
		var i:int;
		var delme:Boolean;
		for(i=0;i<maxeffects;i++)
		{
		
		delme=effects[i].advancemilliseconds(ms);
		if(delme)
		{
		dealloc(i);
		i--;
		}
		
		}
		
		}
        public function dealloc(z:int)
		{
		var i:int;
		for(i=z;i<maxeffects-1;i++)
		effects[i]=effects[i+1];
		maxeffects--;
		
		}
		
		public function reset()
		{
		effects=new Array;
		maxeffects=0;
		}
		
        
    }

    
}