package
{
    
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.media.Sound;
        
    public class ParticleEffect_Constellation extends ParticleEffect
    {
        var last_ms_played:int=0;
		var b:Bitmap;
		var particles:Array;
		var maxparticles:int;
        var c:Object;
		
        public function ParticleEffect_Constellation(bit:Bitmap,cont:Object)
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
		for(i=0;i<800;i++)
		{
		if(totalms>i*10 && last_ms_played<i*10+1)
		{
		particles[maxparticles]=new ParticleXA(b,i,100);
		c.addChild(particles[maxparticles]);
var angle:Number;
		angle=45*i;
					trace("Anglea"+angle);

		angle=angle/10;
					//trace("Angleb"+angle);

			//angle=angle*(2*Math.PI) / 360;
var dx:Number;
var dy:Number;
					dx=Math.cos(angle);
					trace("dx"+dx);
				dx=100*dx;
				dy=100*(Math.sin(angle));
				
					dx=dx+300;
					dy=dy+300;

		particles[maxparticles].x=dx;
		particles[maxparticles].y=dy;
		
		
		
		
		
		maxparticles++;
		
		}
		
		
		}
		
		last_ms_played=totalms;
		return false;		
		}
        
    }

    
}