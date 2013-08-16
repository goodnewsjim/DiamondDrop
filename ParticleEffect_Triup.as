package
{
    
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.media.Sound;
    
  	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	import fl.transitions.easing.*;
      
    public class ParticleEffect_Triup extends ParticleEffect
    {
        var last_ms_played:int=0;
		var b:Bitmap;
		var particles:Array;
		var maxparticles:int;
        var c:Object;
		
		var playonce:Boolean=true;
		var numcolors:int;
        var closetime:int;
		var opentime:int;
		
		var rgb1:RGB;
		var rgb2:RGB;
		var rgb3:RGB;
		var rgb4:RGB;
		var rgb5:RGB;
		
		var x3:int;
		var y3:int;
		
		public function ParticleEffect_Triup(bit:Bitmap,cont:Object,n:int,r1:RGB,r2:RGB,r3:RGB,r4:RGB,r5:RGB,ct:int,ot:int,x33:int,y33:int)
        {
		x3=x33;
		y3=y33;
		numcolors=n;
		closetime=ct;
		opentime=ot;
		
		rgb1=r1;
		rgb2=r2;
		rgb3=r3;
		rgb4=r4;
		rgb5=r5;
		
		
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
				if(last_ms_played>-1 &&playonce)
		{

		for(i=0;i<60;i++)
		{
		
		var rando:int;
		playonce=false;
		
		rando=getrandomint(1,numcolors)
		
		
		if(rando==1)
		particles[maxparticles]=new ParticleXA(b,100+x3,100+y3,rgb1);
		if(rando==2)
		particles[maxparticles]=new ParticleXA(b,100+x3,100+y3,rgb2);
		if(rando==3)
		particles[maxparticles]=new ParticleXA(b,100+x3,100+y3,rgb3);
		if(rando==4)
		particles[maxparticles]=new ParticleXA(b,100+x3,100+y3,rgb4);
		if(rando==5)
		particles[maxparticles]=new ParticleXA(b,100+x3,100+y3,rgb5);

		c.addChild(particles[maxparticles]);
		var angle2:Number;
		angle2=60*i;
					trace("Anglea"+angle2);

		angle2=angle2/10;
					trace("Angleb"+angle2);

			
			angle2=angle2*(2*Math.PI) / 360;
var dx:Number;
var dy:Number;

//angle2=Math.PI/2;
//trace("ANGLE"+angle2);
					dx=Math.cos(angle2);
					trace("dx"+dx);
				
				var dz:int;
				dz=getrandomint(0,50);
				
				dx=((100+dz)*dx);
				dy=((100+dz)*(Math.sin(angle2)));
				
				///trace("dy"+dy);
					dx=dx+x3;
					dy=dy+y3;

		particles[maxparticles].angle=angle2;


		particles[maxparticles].x=dx;
		particles[maxparticles].y=dy;
		
		particles[maxparticles].scaleX=.1;
		particles[maxparticles].scaleY=.1;
		
		
		particles[maxparticles].tweena = new Tween(particles[maxparticles].b,"scaleX",None.easeInOut,1,8,1);
		particles[maxparticles].tweenb = new Tween(particles[maxparticles].b,"scaleY",None.easeInOut,1,8,1);
		
		//particles[maxparticles].tweena.addEventListener(TweenEvent.MOTION_FINISH, onTweenFinish1);
		if(i==59)
		next1();

		
		

		maxparticles++;
		
		}
		
		
		}

		//for(i=0;i<60;i++)
//particles[i].rotation= totalms;
		
		last_ms_played=totalms;
		return false;		
		}
 
 
 


private function next1()
{
trace("finished");
var i:int;
for(i=0;i<60;i++)
{
var a:int=i;
var dx:Number;
var dy:Number;

					dx=Math.cos(particles[i].angle);
				dx=((5)*dx);
				dy=((5)*(Math.sin(particles[i].angle)));
			trace("Angle"+	particles[i].angle);
					dx=dx+x3;
					dy=dy+y3;


			particles[a].tweena = new Tween(particles[a],"x",None.easeInOut,particles[a].x,dx,closetime);
			particles[a].tweenb = new Tween(particles[a],"y",None.easeInOut,particles[a].y,dy,closetime);

			particles[a].tweene = new Tween(particles[a],"alpha",None.easeInOut,0,1,closetime);

if(a==0)
			particles[a].tweena.addEventListener(TweenEvent.MOTION_FINISH, onTweenFinish2);


if(a%2)
{
particles[a].tweenc = new Tween(particles[a].b,"scaleX",Regular.easeIn,8,16,closetime);
		particles[a].tweend = new Tween(particles[a].b,"scaleY",Regular.easeIn,8,16,closetime);
}
else
{
particles[a].tweenc = new Tween(particles[a].b,"scaleX",None.easeInOut,8,3,closetime);
		particles[a].tweend = new Tween(particles[a].b,"scaleY",None.easeInOut,8,3,closetime);
}		


}


}
 
 
 function onTweenFinish2(e:TweenEvent):void {
			var i:int;
			var a:int=-1;
			for(i=0;i<maxparticles;i++)
				if(Tween(e.target) == particles[i].tweena)
				{
					a=i;
					i=maxparticles;
				}
			
			Tween(e.target).removeEventListener(TweenEvent.MOTION_FINISH, onTweenFinish2);

var a:int;
for(a=0;a<maxparticles;a++)
{
var dx:Number;
var dy:Number;

					dx=Math.cos(particles[a].angle);
				

if(a%2)
{				
				dx=((200)*dx);
				dy=((200)*(Math.sin(particles[a].angle)));
}
else
{
				dx=((400)*dx);
				dy=((400)*(Math.sin(particles[a].angle)));

}			
			
					dx=dx+x3;
					dy=dy+y3;

			particles[a].tweena = new Tween(particles[a],"x",Strong.easeOut,particles[a].x,dx,opentime);
			particles[a].tweenb = new Tween(particles[a],"y",Strong.easeOut,particles[a].y,dy,opentime);
particles[a].tweenc = new Tween(particles[a],"alpha",Strong.easeOut,1,0,opentime);


if(a==0)
particles[0].tweena.addEventListener(TweenEvent.MOTION_FINISH, onTweenFinish3);
}

 function onTweenFinish3(e:TweenEvent):void {
particles[0].tweena.removeEventListener(TweenEvent.MOTION_FINISH, onTweenFinish3);
var i:int;

for(i=0;i<60;i++)
{
trace("i"+i);
c.removeChild(particles[i]);


}

}
			//alltweens[a].tween  = new Tween(alltweens[a].image,"alpha",Strong.easeOut,1,0,1,40);
			//alltweens[a].tween.addEventListener(TweenEvent.MOTION_FINISH, onTween2Finish);
			
			//alltweens[a].tween2  = new Tween(alltweens[a].image,"y",None.easeInOut,alltweens[a].ggy*60-40-(alltweens[a].gridy+1)*60+alltweens[a].incy,alltweens[a].ggy*60-120-(alltweens[a].gridy+1)*60+alltweens[a].incy,40);
			
		}

 
 		private function getrandomint(low:int,high:int)
		{
			return Math.floor(Math.random()*(1+high-low))+low;
		}

        
    }

    
}