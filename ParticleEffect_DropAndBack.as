package
{
    
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.media.Sound;
        
    public class ParticleEffect_DropAndBack extends ParticleEffect
    {
        var last_ms_played:int=0;
		var b:Bitmap;
		var particles:Array;
		var maxparticles:int;
        var c:Object;
		
        public function ParticleEffect_DropAndBack(bit:Bitmap,cont:Object)
        {
		c=cont;
		b=bit;
		particles=new Array;
		maxparticles=0;
        }
        
        public function advancemilliseconds(ms:int)
		{
		var totalms:int;
		totalms=last_ms_played+ms;
		
		//1 sec per particle
		var i:int;
		
		//init them
		for(i=0;i<600;i=i+10)
		{
		if(totalms>i*100 && last_ms_played<i*100+1)
		{
		particles[maxparticles]=new ParticleXA(b,i,100);
		c.addChild(particles[maxparticles]);
		maxparticles++;
		
		}
		
		
		}
		
		last_ms_played=totalms;
		return false;		
		}
        
    }

    
}