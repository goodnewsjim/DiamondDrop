package
{
    
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import flash.media.Sound;
        
    public class Tri 
    {
    	
    	
var purpleup:PurpleUp;//0
var purpledown:PurpleDown;//0
var blueup:BlueUp;//1
var bluedown:BlueDown;//1
var yellowup:YellowUp;//2
var yellowdown:YellowDown;//2
var redup:RedUp;//3
var reddown:RedDown;//3
var greenup:GreenUp;//4
var greendown:GreenDown;//4
var whitedown:WhiteDown;
var whiteup:WhiteUp;

var colorup:int;
var colordown:int;
var falldir:int=0;

        
        
        public function Tri (up:int,down:int )
        {
if(up==0)
{
purpleup=new PurpleUp();


}

if(up==1)
blueup=new BlueUp();
if(up==2)
yellowup=new YellowUp();
if(up==3)
redup=new RedUp();
if(up==4)
greenup=new GreenUp();
if(up==5)
whiteup=new WhiteUp();

if(down==0)
purpledown=new PurpleDown();
if(down==1)
bluedown=new BlueDown();
if(down==2)
yellowdown=new YellowDown();
if(down==3)
reddown=new RedDown();
if(down==4)
greendown=new GreenDown();
if(down==5)
whitedown=new WhiteDown();
        
colorup=up;
colordown=down;       
        }
        
        public function moveto(xx:int,yy:int)
        {
        	
if(colorup==0)
purpleup.moveto(xx,yy-48)
if(colorup==1)
blueup.moveto(xx,yy-48)
if(colorup==2)
yellowup.moveto(xx,yy-48)
if(colorup==3)
redup.moveto(xx,yy-48)
if(colorup==4)
greenup.moveto(xx,yy-48)
if(colorup==5)
whiteup.moveto(xx,yy-48)
if(colordown==0)
{
purpledown.moveto(xx,yy)
}        	
if(colordown==1)
{
bluedown.moveto(xx,yy);

//for some reaon standard code gave me a 1119 error
//bluedown.x=xx;
//bluedown.y=yy;


}        	
if(colordown==2)
{
yellowdown.moveto(xx,yy)
}     
if(colordown==3)
{
reddown.moveto(xx,yy)
}  
if(colordown==4)
{
greendown.moveto(xx,yy)

}        	
if(colordown==5)
{
whitedown.moveto(xx,yy)
}        	
        	
        	
        	
        	
        	
        	
        } 
 public function autofall(direction:int)//direction -0= no fall, 1=down right, 2==down left
 {
 	falldir=direction;
 }       
 public function doautofall(curcnt:int)//direction -0= no fall, 1=down right, 2==down left
 {
var xxx:int;
var yyy:int;

if(colordown==0)
{
xxx=purpledown.x-239;
yyy=purpledown.y-88;
}        	
if(colordown==1)
{
xxx=bluedown.x-239;
yyy=bluedown.y-88;
}        	
if(colordown==2)
{
xxx=yellowdown.x-239;
yyy=yellowdown.y-88;
}     
if(colordown==3)
{
xxx=reddown.x-239;
yyy=reddown.y-88;
}  
if(colordown==4)
{
xxx=greendown.x-239;
yyy=greendown.y-88;
}        	
if(colordown==5)
{
xxx=whitedown.x-239;
yyy=whitedown.y-88;
}        	
 		


 	if(falldir==1)
 	{
 		
 		xxx=xxx+1;
		yyy=yyy+3;
 	moveto(xxx,yyy);	
 	}
 	if(falldir==2)
 	{

xxx=xxx-1;
yyy=yyy+3;
 	moveto(xxx,yyy);	

 	}
 }       
 
       // initialization, called after parent addChild
        
       
        
        
    }

    
}