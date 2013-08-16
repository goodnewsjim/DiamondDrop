//AUTHOR JIM SAGER
//Technical assistance TJ
//@author of RANDOM SEED CODE: Noel Billig (http://www.dncompute.com)

package 
{
    //fscommand2("FullScreen",true);
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.display.Stage;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.net.URLRequest;
    import flash.net.navigateToURL;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.utils.Timer;

//import mochi.as3.*;


[SWF(width=800, height=600)]
//[SWF(height=500)]
    public class FirstCircle extends Sprite
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
var whiteup:WhiteUp;//5
var whitedown:WhiteDown;//5
var background2:Background2;


var delay:uint = 1;
 var myTimer:Timer = new Timer(delay, 0);
var rand:RandomSeed;
var test1:int;
var datea:Date=new Date();;
var test2:int;
var board:Array;
var boardtemp:Array;
var boardtri:Array;
//struct blkpos
var bc1:int;
var bc2:int;
var bx:int;
var by:int;
var bmx:int;
var bmy:int;
var badjust:int;
var bn0:int;
//end struct blkpos

var curcnt:int=0;
var nextup:int;
var nextdown:int;

var tri:Tri;
var nexttri:Tri;


///FOLLOWING VARIABLES ARE TRI.CC clones

var count:int=0;
var mx:int=0;
var my:int=0;
var adjust:int=0;
var posx:int=10;
var posy:int=0;
var oldcnt:int=0;
var cdif:int=0;

//var pace:int=125;//starting pace
var pace:int=220;//starting pace
var wcnt:int=0;

var cox:int=0;
var coy:int=0;
var prevx:int=0;
var prevy:int=0;
var holdit:int=0;


var nullify_code_after:int=0; //HACKISH CODE to port HACKISH GOTO CODE - \(><)/
var yyyy:int;
var temp1:int;
var temp2:int;
var look_if_a_tri_is_completed_to_change_fall_mode:Boolean=false;
var board_falling_mode:Boolean=false;

var scoredisplay:TextField = new TextField();
var highscoredisplay:TextField = new TextField();

var leveldisplay:TextField = new TextField();
var gameoverdisplay1:TextField = new TextField();
var gameoverdisplay2:TextField = new TextField();


var highscore:int=0;
var score:int=0;
var level:int=1;

var difficulty:int=3; //1-easy 2-normal 3-hard
var trianglesseen:int=1;

var combo:int=1;
//var tempstring:String;
var clearboard:Boolean=true;
var gameover:Boolean=false;


var mouseposx:int=0;
var mouseposy:int=0;
var mouseoverride:Boolean=false;

var gameovertime:int=-1;

//var tcpip:XMLSocketExample;

        public static const GAME_ID:String = "b10db135ef3c7fd7";
        public static const AD_ID:String = "b10db135ef3c7fd7";  // This is normally your GAME_ID

private var superstage:Stage;

/// NEW STUFF
		var timeelapsed:int=-1;
		var lasttime:int=-1;
		var lasttick:int=0;


var particlecontroller:ParticleController;
var howmuchtimepassedsincelasttickoftimeelapsed:int=-1;
var lasttimeelapsed:int=-1;

var animplaying:int=-1;

var flip:Flip;
var drop:Drop;
var help:Help;

var mousebuttondown:Boolean;

        public function FirstCircle()
        {
		stage.addEventListener( Event.ENTER_FRAME , init );

         
        } 
        
//		 private function start():void
        //{
		//}
		
        public function init ( event:Event ):void //need to set all variables like pace and stuff
        {
var i:int;
var j:int;
var myText:TextField = new TextField();
var myText2:TextField = new TextField();
var myText3:TextField = new TextField();
particlecontroller=new ParticleController();
background2=new Background2();
background2.moveto(0,0);
addChild(background2);
drop=new Drop();
drop.x=595;
drop.y=480;
addChild(drop);
flip=new Flip();
flip.x=595;
flip.y=20;
addChild(flip);
help=new Help();
help.y=20;
addChild(help);


				//addEventListener(Flip.MOUSE_DOWN, flipmousedownHandler);


superstage=stage;


if(difficulty==1)
pace=500;
if(difficulty==2)
pace=220;
if(difficulty==3)
pace=80;

trace("test");
//tcpip=new XMLSocketExample;
//tcpip.send(1);

var myFormat:TextFormat = new TextFormat();
myFormat.size = 25;

myText.defaultTextFormat = myFormat;
myText.text = "Score:";
addChild(myText);
myText.y=440;

myText3.defaultTextFormat = myFormat;
myText3.width=250;
myText3.text = "High Score:";
addChild(myText3);
myText3.y=480;


myText2.defaultTextFormat = myFormat;
myText2.text = "Level:";
addChild(myText2);
myText2.y=400;

gameoverdisplay1.defaultTextFormat = myFormat;
gameoverdisplay2.defaultTextFormat = myFormat;


scoredisplay.defaultTextFormat = myFormat;
leveldisplay.defaultTextFormat = myFormat;
scoredisplay.text = score.toString();
addChild(scoredisplay);
scoredisplay.y=460;

leveldisplay.text=level.toString();
addChild(leveldisplay);
leveldisplay.y=420;


highscoredisplay.defaultTextFormat = myFormat;
highscoredisplay.text = highscore.toString();
addChild(highscoredisplay);
highscoredisplay.y=500;

        	
board = new Array()
for(var i=0; i<=21 ;i++)
board.push(new Array());

for(i=0;i<21;i++)
for(j=0;j<10;j++)
board[i][j]=0;

for(i=0;i<10;i++)
{
board[i][i]=20;
board[20-i][i]=20;	
}


boardtri = new Array()
for(var i=0; i<=21 ;i++)
boardtri.push(new Array());

for(i=0;i<21;i++)
for(j=0;j<10;j++)
boardtri[i][j]=null;


//board[20][0] = 20;        	
//trace(board[20][0]);

        	
test2=datea.getMilliseconds();        	
test2=test2+1000*datea.getSeconds();
//trace(test2);
rand = new RandomSeed();
rand.RandomSeed1(test2);//randomize(timer);
test1=rand.getIntInRange(1,100);
//trace(test1);
next();


tri=new Tri(nextup,nextdown);
//tri=new Tri(nextup,0);
next();            
nexttri=new Tri(nextup,nextdown);

           stage.removeEventListener( Event.ENTER_FRAME , init );
myTimer.start();           
myTimer.addEventListener(TimerEvent.TIMER, timerHandler);
  



tri.moveto(9*16,0);
nexttri.moveto(280,300);

if(tri.colorup==0)
addChild(tri.purpleup);
if(tri.colorup==1)
addChild(tri.blueup);
if(tri.colorup==2)
addChild(tri.yellowup);
if(tri.colorup==3)
addChild(tri.redup);
if(tri.colorup==4)
addChild(tri.greenup);
if(tri.colorup==5)
addChild(tri.whiteup);


if(tri.colordown==0)
addChild(tri.purpledown);
if(tri.colordown==1)
addChild(tri.bluedown);
if(tri.colordown==2)
addChild(tri.yellowdown);
if(tri.colordown==3)
addChild(tri.reddown);
if(tri.colordown==4)
addChild(tri.greendown);
if(tri.colordown==5)
addChild(tri.whitedown);


nexttri.moveto(280,300);
if(nexttri.colorup==0)
addChild(nexttri.purpleup);
if(nexttri.colorup==1)
addChild(nexttri.blueup);
if(nexttri.colorup==2)
addChild(nexttri.yellowup);
if(nexttri.colorup==3)
addChild(nexttri.redup);
if(nexttri.colorup==4)
addChild(nexttri.greenup);
if(nexttri.colorup==5)
addChild(nexttri.whiteup);
if(nexttri.colordown==0)
addChild(nexttri.purpledown);
if(nexttri.colordown==1)
addChild(nexttri.bluedown);
if(nexttri.colordown==2)
addChild(nexttri.yellowdown);
if(nexttri.colordown==3)
addChild(nexttri.reddown);
if(nexttri.colordown==4)
addChild(nexttri.greendown);
if(nexttri.colordown==5)
addChild(nexttri.whitedown);



posx=10;

            for ( var a:int = 0 ; a < 1 ; a++ )
            {
  //          circle = new MovingCircle( );
      	    //addChild( circle );
            ///circle.init( );
/*
            purpleup=new PurpleUp();
            addChild(purpleup);
            purpledown=new PurpleDown();
            addChild(purpledown);
			purpledown.x=20;
            blueup=new BlueUp();
            addChild(blueup);
            blueup.x=40;
            bluedown=new BlueDown();
            addChild(bluedown);
            bluedown.x=60;
            yellowup=new YellowUp();
            addChild(yellowup);
            yellowup.x=80;
            yellowdown=new YellowDown();
            addChild(yellowdown);
			yellowdown.x=120;
            greenup=new GreenUp();
            addChild(greenup);
            greenup.x=140;
            greendown=new GreenDown();
            addChild(greendown);
            greendown.x=160;
            redup=new RedUp();
            addChild(redup);
            redup.x=280;
            reddown=new RedDown();
            addChild(reddown);
			reddown.x=220;
*/
            
            
            
                
                
//           var framelines:LineWork = new LineWork();
//           addChild( framelines );
  

                                              
            }
         stage.addEventListener(KeyboardEvent.KEY_DOWN, keyFunction);
         stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
         stage.addEventListener(MouseEvent.MOUSE_DOWN, mousedownleft);
         stage.addEventListener(MouseEvent.CLICK, mouseclick);
         
		 stage.addEventListener(MouseEvent.MOUSE_MOVE, onHover);
		//stage.addEventListener(MouseEvent.MOUSE_RIGHT_MOUSE_DOWN, mousedownright);
        stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);

        stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseWheelHandler);

        }

public function mouseUpHandler(m:MouseEvent):void{
	holdit=0;
	mousebuttondown=false;
    }
public function mouseWheelHandler(m:MouseEvent):void{
if(gameover==false)
{
	temp1=tri.colordown;
    temp2=tri.colorup;

erasetri(tri);

tri=null;
tri=new Tri(temp1,temp2);
		
		
if(tri.colorup==0)
addChild(tri.purpleup);
if(tri.colorup==1)
addChild(tri.blueup);
if(tri.colorup==2)
addChild(tri.yellowup);
if(tri.colorup==3)
addChild(tri.redup);
if(tri.colorup==4)
addChild(tri.greenup);
if(tri.colorup==5)
addChild(tri.whiteup);

if(tri.colordown==0)
addChild(tri.purpledown);
if(tri.colordown==1)
addChild(tri.bluedown);
if(tri.colordown==2)
addChild(tri.yellowdown);
if(tri.colordown==3)
addChild(tri.reddown);
if(tri.colordown==4)
addChild(tri.greendown);
if(tri.colordown==5)
addChild(tri.whitedown);
	
}	

}

public function onHover(m:MouseEvent):void{

if(gameover==false)
{
mouseoverride=false;


mouseposx=m.stageX;
mouseposy=m.stageY;



//trace("mx,my"+m.stageX+","+m.stageY);
//trace("posx"+posx);
}	
}



/*
public function flipmousedownHandler(m:MouseEvent):void{
temp1=tri.colordown;
    temp2=tri.colorup;

erasetri(tri);

tri=null;
tri=new Tri(temp1,temp2);
		
		
if(tri.colorup==0)
addChild(tri.purpleup);
if(tri.colorup==1)
addChild(tri.blueup);
if(tri.colorup==2)
addChild(tri.yellowup);
if(tri.colorup==3)
addChild(tri.redup);
if(tri.colorup==4)
addChild(tri.greenup);
if(tri.colorup==5)
addChild(tri.whiteup);

if(tri.colordown==0)
addChild(tri.purpledown);
if(tri.colordown==1)
addChild(tri.bluedown);
if(tri.colordown==2)
addChild(tri.yellowdown);
if(tri.colordown==3)
addChild(tri.reddown);
if(tri.colordown==4)
addChild(tri.greendown);
if(tri.colordown==5)
addChild(tri.whitedown);

}
*/

public function restartgame()
{
var i:int;
var j:int;

if(gameovertime+2500<timeelapsed)
{
clearboard=true;
gameovertime=-1;
removeChild(gameoverdisplay1);
removeChild(gameoverdisplay2);
gameoverdisplay2.y=380;
gameover=false;
scoredisplay.text="0";
leveldisplay.text="1";
//MAYBE ERASE TRI


board = new Array()
for(var i=0; i<=21 ;i++)
board.push(new Array());




for(i=0;i<21;i++)
for(j=0;j<10;j++)
{
if(board[i][j]!=0)
if(boardtri[i][j]!=null)
erasetri(boardtri[i][j]);

board[i][j]=0;

}

for(i=0;i<10;i++)
{
board[i][i]=20;
board[20-i][i]=20;	
}


boardtri = new Array()
for(var i=0; i<=21 ;i++)
boardtri.push(new Array());

for(i=0;i<21;i++)
for(j=0;j<10;j++)
boardtri[i][j]=null;


if(tri)
erasetri(tri);
if(nexttri)
erasetri(nexttri);
tri=new Tri(nextup,nextdown);
//tri=new Tri(nextup,0);
next();            
nexttri=new Tri(nextup,nextdown);

           stage.removeEventListener( Event.ENTER_FRAME , init );
myTimer.start();           
myTimer.addEventListener(TimerEvent.TIMER, timerHandler);
  



tri.moveto(9*16,0);
nexttri.moveto(280,300);

if(tri.colorup==0)
addChild(tri.purpleup);
if(tri.colorup==1)
addChild(tri.blueup);
if(tri.colorup==2)
addChild(tri.yellowup);
if(tri.colorup==3)
addChild(tri.redup);
if(tri.colorup==4)
addChild(tri.greenup);
if(tri.colorup==5)
addChild(tri.whiteup);


if(tri.colordown==0)
addChild(tri.purpledown);
if(tri.colordown==1)
addChild(tri.bluedown);
if(tri.colordown==2)
addChild(tri.yellowdown);
if(tri.colordown==3)
addChild(tri.reddown);
if(tri.colordown==4)
addChild(tri.greendown);
if(tri.colordown==5)
addChild(tri.whitedown);


nexttri.moveto(280,300);
if(nexttri.colorup==0)
addChild(nexttri.purpleup);
if(nexttri.colorup==1)
addChild(nexttri.blueup);
if(nexttri.colorup==2)
addChild(nexttri.yellowup);
if(nexttri.colorup==3)
addChild(nexttri.redup);
if(nexttri.colorup==4)
addChild(nexttri.greenup);
if(nexttri.colorup==5)
addChild(nexttri.whiteup);
if(nexttri.colordown==0)
addChild(nexttri.purpledown);
if(nexttri.colordown==1)
addChild(nexttri.bluedown);
if(nexttri.colordown==2)
addChild(nexttri.yellowdown);
if(nexttri.colordown==3)
addChild(nexttri.reddown);
if(nexttri.colordown==4)
addChild(nexttri.greendown);
if(nexttri.colordown==5)
addChild(nexttri.whitedown);



posx=10;

score=0;
level=1;


}//end of okgame over

}







public function doflip()
{
temp1=tri.colordown;
    temp2=tri.colorup;

erasetri(tri);

tri=null;
tri=new Tri(temp1,temp2);
		
		
if(tri.colorup==0)
addChild(tri.purpleup);
if(tri.colorup==1)
addChild(tri.blueup);
if(tri.colorup==2)
addChild(tri.yellowup);
if(tri.colorup==3)
addChild(tri.redup);
if(tri.colorup==4)
addChild(tri.greenup);
if(tri.colorup==5)
addChild(tri.whiteup);

if(tri.colordown==0)
addChild(tri.purpledown);
if(tri.colordown==1)
addChild(tri.bluedown);
if(tri.colordown==2)
addChild(tri.yellowdown);
if(tri.colordown==3)
addChild(tri.reddown);
if(tri.colordown==4)
addChild(tri.greendown);
if(tri.colordown==5)
addChild(tri.whitedown);

}

public function mouseclick(m:MouseEvent):void{

mouseposx=m.stageX;
mouseposy=m.stageY;


		 if(mouseposx<200 && mouseposy<120)
{
var request:URLRequest = new URLRequest("http://www.goodnewsjim.com/ddhelp/help.html");
			navigateToURL(request);
			
}
}
public function mousedownleft(m:MouseEvent):void{
var temptri:Tri;
var i:int;
var j:int;

//if(m.rightmousedown)
//trace("mouse down111");
mousebuttondown=true;

mouseposx=m.stageX;
mouseposy=m.stageY;



if(gameover==false)
{
if(mouseposx>594 &&mouseposy>479)
holdit=1;

if(mouseposx>594 &&mouseposy>20 && mouseposy<120)
doflip();


//else
//holdit=1;
}
else
{//
restartgame();



}

}

private function timerHandler (e:TimerEvent):void{
var temptri:Tri;
var i:int;
var j:int;



			var datea:Date=new Date();
			var addtime:int=0;

			if(timeelapsed==-1)
			{
				timeelapsed=1;
				
				test2=datea.getMilliseconds();        	
				test2=test2+1000*datea.getSeconds();
				lasttime=test2;
				
			}
			else
			{
				
				test2=datea.getMilliseconds();        	
				test2=test2+1000*datea.getSeconds();
				if(test2<lasttime)//wrap around 60,000
					addtime=60000-lasttime+test2;
				else
					addtime=test2-lasttime;
					timeelapsed=timeelapsed+addtime;
				lasttime=test2;
			}

//trace("timeelapsed"+timeelapsed);

howmuchtimepassedsincelasttickoftimeelapsed=timeelapsed-lasttimeelapsed;
			lasttimeelapsed=timeelapsed;
			
particlecontroller.advancemilliseconds(howmuchtimepassedsincelasttickoftimeelapsed);

if(gameover==false)
{
mx=0;
count++;
myTimer.stop();           

//trace("Timer is Triggered");
if(board_falling_mode)
{
cdif++;

if(lasttick+pace<timeelapsed)
//if(cdif>pace/4)
{
lasttick=timeelapsed;
	cdif=0;
	curcnt++;//Must mean comes down
if(curcnt>16)
{
trace("curcnt=16");
curcnt=0;
adjust_fallen_board();
search_for_spaces();

if(board_falling_mode==false)
{
trace("check for tri");
//combo
check_for_tri();

}
//if(board_falling_mode==false)
//{
//check_for_clear();
//}	
	
}

for(i=0;i<21;i++)
for(j=0;j<10;j++)
if(boardtri[i][j]!=null)
{
temptri=boardtri[i][j];
temptri.doautofall(curcnt);
}



}

}
else
afterupdate();

if(board_falling_mode==false && mouseoverride==false)
{

if(mousebuttondown)
{
if(mouseposx<580)
if(400+(posx-10)*16 +15 <mouseposx)
mx=1;
if(400+(posx-10)*16 -15 >mouseposx)
mx=-1;
}

aftermx();
}

myTimer.start();
}
}

private function keyUp(event:KeyboardEvent):void {
	if (event.keyCode == 83 || event.keyCode == 40) 
	{
	holdit=0;
	}
	
}


private function keyFunction(event:KeyboardEvent):void {

//mouseposx=mouseposx;
if(gameover)
restartgame();
mouseoverride=true;
if(gameover==false)
{
if(board_falling_mode==false)
{	
myTimer.stop(); 

	mx=0;

if(event.keyCode==48  && false)
{
	//debug
	var t:Tri;
count=0;
oldcnt=0;
curcnt=0;	
	
boardtemp[10][9]=0;
boardtemp[10][8]=0;

t=boardtri[10][9];
if(t!=null)
erasetri(t);
boardtri[10][9]=null;

	search_for_spaces();
	
}

	if (event.keyCode == 65 || event.keyCode == 37) 
	{
	mx=-1;
	
	}
    if ((event.keyCode == 68 || event.keyCode== 39)&& mx==0) 
	{
	mx=1;
	
	}
	if (event.keyCode == 83 || event.keyCode == 40) 
	{
	holdit=1;
	}
	if( event.keyCode == 70)
	{
		//check_for_tri();
	}
	
	
	if (event.keyCode == 32 || event.keyCode == 38 ) 
	{
	temp1=tri.colordown;
    temp2=tri.colorup;

erasetri(tri);

tri=null;
tri=new Tri(temp1,temp2);
		
		
if(tri.colorup==0)
addChild(tri.purpleup);
if(tri.colorup==1)
addChild(tri.blueup);
if(tri.colorup==2)
addChild(tri.yellowup);
if(tri.colorup==3)
addChild(tri.redup);
if(tri.colorup==4)
addChild(tri.greenup);
if(tri.colorup==5)
addChild(tri.whiteup);

if(tri.colordown==0)
addChild(tri.purpledown);
if(tri.colordown==1)
addChild(tri.bluedown);
if(tri.colordown==2)
addChild(tri.yellowdown);
if(tri.colordown==3)
addChild(tri.reddown);
if(tri.colordown==4)
addChild(tri.greendown);
if(tri.colordown==5)
addChild(tri.whitedown);


	
	}



//check_move HERE:

aftermx();

	
//myTimer.stop();           
//myTimer = new Timer(1000, 0);
//myTimer.start();
//myTimer.addEventListener(TimerEvent.TIMER, timerHandler);
//65a
//68d
//83s
//32 space	
myTimer.start();
}
	 
}	 
}
        

private function afterupdate()
{
//trace(adjust);
check_for_clear();

if(oldcnt!=count)	
	cdif++;

oldcnt=count;

if(cdif==pace || holdit==1)
{
	cdif=0;
	curcnt++;//Must mean comes down
//	trace("down 1");
}
if(wcnt>16)
{
curcnt=16;


}

cox=(posx-1)*16+adjust*curcnt;
coy=(posy)*48+curcnt*3;
tri.moveto(cox,coy);
//trace("cox:" +cox +" coy:"+coy);

	

if(curcnt>15)
{
if(holdit==1)
{
score=score+level;
scoredisplay.text = score.toString();
if(score>highscore)
{
highscore=score;
highscoredisplay.text=highscore.toString();
}
}

curcnt=curcnt-16;
posy=posy+1;
if(adjust==-1)
posx=posx-1;
if(adjust==1)
posx=posx+1;

//check to see if stuck
//trace("pox,posy"+posx+","+posy);
nullify_code_after=0;

if(board[posx-1][posy]>0)
if(board[posx+1][posy]>0)
{
	trace("stuck: posx,posy"+posx+","+posy);

trianglesseen++;
if(trianglesseen%12==0)
{
level++;
leveldisplay.text=level.toString();


if(pace>1 && pace<16)
pace=pace-1;
if(pace<69 && pace>15)
pace=pace-3;
if(pace<121 &&pace >68)
pace=pace-8;
if(pace<280 &&pace >120)
pace=pace-16;
if(pace==280)
pace=220;	
if(pace==300)
pace=280;	
if(pace==400)
pace=300;
if(pace==500)
pace=400;


trace("level"+level+"+"+"pace"+"+"+pace);

}

if(posy==1)
if(posx==10)
game_over();

board[posx][posy]=tri.colordown+1;
board[posx][posy-1]=tri.colorup+1;
boardtri[posx][posy]=tri;

clearboard=false;
combo=1;
check_for_tri();
posx=10;
posy=0;
adjust=0;
my=0;
mx=0;
count=0;
oldcnt=0;
curcnt=0;	
//TODO SAVE TRI in array.. TO LEARN: how do you eliminate TRI
tri=new Tri(nextup,nextdown);//good code
//trace only
//tri=new Tri(nextup,0);
tri.moveto(9*16,0);
if(tri.colorup==0)
addChild(tri.purpleup);
if(tri.colorup==1)
addChild(tri.blueup);
if(tri.colorup==2)
addChild(tri.yellowup);
if(tri.colorup==3)
addChild(tri.redup);
if(tri.colorup==4)
addChild(tri.greenup);
if(tri.colorup==5)
addChild(tri.whiteup);

if(tri.colordown==0)
addChild(tri.purpledown);
if(tri.colordown==1)
addChild(tri.bluedown);
if(tri.colordown==2)
addChild(tri.yellowdown);
if(tri.colordown==3)
addChild(tri.reddown);
if(tri.colordown==4)
addChild(tri.greendown);
if(tri.colordown==5)
addChild(tri.whitedown);

next();
erasetri(nexttri);
nexttri=null;
nexttri=new Tri(nextup,nextdown);
nexttri.moveto(280,300);
if(nexttri.colorup==0)
addChild(nexttri.purpleup);
if(nexttri.colorup==1)
addChild(nexttri.blueup);
if(nexttri.colorup==2)
addChild(nexttri.yellowup);
if(nexttri.colorup==3)
addChild(nexttri.redup);
if(nexttri.colorup==4)
addChild(nexttri.greenup);
if(nexttri.colorup==5)
addChild(nexttri.whiteup);
if(nexttri.colordown==0)
addChild(nexttri.purpledown);
if(nexttri.colordown==1)
addChild(nexttri.bluedown);
if(nexttri.colordown==2)
addChild(nexttri.yellowdown);
if(nexttri.colordown==3)
addChild(nexttri.reddown);
if(nexttri.colordown==4)
addChild(nexttri.greendown);
if(nexttri.colordown==5)
addChild(nexttri.whitedown);

nullify_code_after=1;
trace("NEW TRI");
}	//end of stuck

if(adjust==0 && nullify_code_after==0)
{
	if(board[posx][posy+1]>0)
	{
		if(board[posx-1][posy]>0)
		{
		adjust=1;
	nullify_code_after=1;
		}
	
	if(board[posx+1][posy]>0 && nullify_code_after==0)
	{
		adjust=-1;
		nullify_code_after=1;
	}
	if(nullify_code_after==0)
	{
		yyyy=rand.getIntInRange(1,2);
		if(yyyy==1)
		adjust=1;
		else
		adjust=-1;
		
		
	}
	
	
	
	}
}





}//end of curcnt>15



mx=0;
}//end afterupdate()

private function next()
{
//TODO: DISPLAY

if(difficulty==2 || difficulty==3)
{
nextup=rand.getIntInRange(0,5);
nextdown=rand.getIntInRange(0,5);
}
if(difficulty==1)
{
nextup=rand.getIntInRange(0,4);
nextdown=rand.getIntInRange(0,4);
}
}
private function check_for_tri()//This function sees if there is any scoring to be had
{
var i:int;
var j:int;

var tx:int;
var ty:int;
var x1:int;
var y1:int;
var x2:int;
var y2:int;

curcnt=0;

boardtemp=null;//hopefully garbage collection figures stuff out
boardtemp = new Array()
for(var i=0; i<=21 ;i++)
boardtemp.push(new Array());

for(i=0;i<21;i++)
for(j=0;j<10;j++)
boardtemp[i][j]=board[i][j];



for(i=8;i>1;i--)
for(j=0;j<9-i;j++)
{
tx=i+2+j*2;
ty=i+1;
x1=tx-1;
x2=tx+1;
y1=ty-1;
y2=y1;
//trace("(" +x1+","+y1+")("+x2+","+y2+")("+tx+","+ty+")");
if(board[x1][y1]!=0 && board[x1][y1] == board[x2][y2] && board[x1][y1] == board[tx][ty])
do_tri_down(tx,ty);
}

for(i=7;i>0;i--)
for(j=0;j<8-i;j++)
{
ty=i-1;
tx=i+3+j*2;
x1=tx-1;
x2=tx+1;
y1=ty+1;
y2=y1;

//trace("(" +x1+","+y1+")("+x2+","+y2+")("+tx+","+ty+")");
if(board[x1][y1]!=0 && board[x1][y1] == board[x2][y2] && board[x1][y1] == board[tx][ty])
do_tri_up(tx,ty);
}





board=boardtemp;
//TODO DETECT TRIS
//TODO SWITCH MODE TO DROPPING BOARD

if(look_if_a_tri_is_completed_to_change_fall_mode)
search_for_spaces();


}
private function search_for_spaces()
{
var xx:int;
var yy:int;

var i;
var j;

var foundupperleft:Boolean=false;
var temptri:Tri;

board_falling_mode=false;
//start from top and work to bottom
for(yy=2;yy<10;yy++)
for(xx=yy+1;xx<20-yy;xx=xx+2)
{
//first see if space there
if(board[xx][yy]==0)//if space here
{
//search upper left
foundupperleft=false;
if(board[xx-1][yy-1]>0 && board[xx-1][yy-1]<100)
{
board_falling_mode=true;
trace("Board falling mode set to true \\ XX:"+xx+" YY:"+yy);

foundupperleft=true;
//initiate fall sequence
i=xx-1;
j=yy-1;
while(board[i][j]!=0)
{
board[i][j]=board[i][j]+100;
temptri=boardtri[i][j];
temptri.autofall(1);

i=i-1;
j=j-1;
}

}
//search upper right if upperleft not found
if(foundupperleft==false)
if(board[xx+1][yy-1]>0 && board[xx+1][yy-1]<100)
{
trace("Board falling mode set to true / XX:"+xx+" YY:"+yy);
board_falling_mode=true;
i=xx+1;
j=yy-1;
while(board[i][j]!=0)
{
board[i][j]=board[i][j]+200;
temptri=boardtri[i][j];
temptri.autofall(2);
i=i+1;
j=j-1;
}

}
	
	
}//end of space
	



}//end of yy/xx







	
}


public function do_tri_down(xx:int,yy:int)//This function clears board and sets 
{



			var p1:ParticleEffect_Tridown;
			
			var rgb1:RGB;
			var rgb2:RGB;
			var rgb3:RGB;
			var rgb4:RGB;
			var rgb5:RGB;
			
			rgb1=new RGB;
			rgb2=new RGB;
			rgb3=new RGB;
			rgb4=new RGB;
			rgb5=new RGB;
			
			
	/*		
			if(tri.colorup==0)
addChild(tri.purpleup);
if(tri.colorup==1)
addChild(tri.blueup);
if(tri.colorup==2)
addChild(tri.yellowup);
if(tri.colorup==3)
addChild(tri.redup);
if(tri.colorup==4)
addChild(tri.greenup);
if(tri.colorup==5)
addChild(tri.whiteup);
*/
			
			if(board[xx][yy]==1)//purple
			{
			rgb1.r=255;
			rgb1.b=255;
			rgb1.g=0;
			}
			if(board[xx][yy]==2)//blue
			{
			rgb1.r=0;
			rgb1.b=255;
			rgb1.g=0;
			}
			if(board[xx][yy]==3)//blue
			{
			rgb1.r=255;
			rgb1.b=0;
			rgb1.g=255;
			}
			if(board[xx][yy]==4)//blue
			{
			rgb1.r=255;
			rgb1.b=0;
			rgb1.g=0;
			}
			if(board[xx][yy]==5)//blue
			{
			rgb1.r=0;
			rgb1.b=0;
			rgb1.g=255;
			}
			if(board[xx][yy]==6)//blue
			{
			rgb1.r=255;
			rgb1.b=255;
			rgb1.g=255;
			}
			
			/*
			rgb1.r=241;
			rgb1.g=166;
			rgb1.b=251;
			*/
			
			rgb2.r=203;
			rgb2.g=2;
			rgb2.b=219;
			
			rgb3.r=255;
			rgb3.g=255;
			rgb3.b=255;
			
			rgb4.r=255;
			rgb4.g=255;
			rgb4.b=255;
			
			var b3:Bitmap;
			
			p1= new ParticleEffect_Tridown(b3,superstage,1,rgb1,rgb2,rgb3,rgb4,rgb5,15,30,239+16*(xx),88+48*yy);
				//p1= new ParticleEffect_Trid(b3,superstage,1,rgb1,rgb2,rgb3,rgb4,rgb5,15,30,0,0);
			p1.advancemilliseconds(1);
			particlecontroller.registereffect(p1);












var t:Tri;
//score=score+1;
//scoredisplay.text = score.toString();
score=score+100*level*combo;
combo++;
scoredisplay.text = score.toString();

if(score>highscore)
{
highscore=score;
highscoredisplay.text=highscore.toString();
}


look_if_a_tri_is_completed_to_change_fall_mode=true;
boardtemp[xx][yy]=0;
boardtemp[xx][yy-1]=0;
boardtemp[xx-1][yy-1]=0;
boardtemp[xx-1][yy-2]=0;
boardtemp[xx+1][yy-1]=0
boardtemp[xx+1][yy-2]=0

t=boardtri[xx][yy];
if(t!=null)
erasetri(t);
boardtri[xx][yy]=null;
t=boardtri[xx-1][yy-1];
if(t!=null)
erasetri(t);
boardtri[xx-1][yy-1]=null;
t=boardtri[xx+1][yy-1];
if(t!=null)
erasetri(t);
t=boardtri[xx+1][yy-1]=null;


}


public function do_tri_up(xx:int,yy:int)//This function clears board and sets 
{
			var p1:ParticleEffect_Triup;
			
			var rgb1:RGB;
			var rgb2:RGB;
			var rgb3:RGB;
			var rgb4:RGB;
			var rgb5:RGB;
			
			rgb1=new RGB;
			rgb2=new RGB;
			rgb3=new RGB;
			rgb4=new RGB;
			rgb5=new RGB;
			
			
	/*		
			if(tri.colorup==0)
addChild(tri.purpleup);
if(tri.colorup==1)
addChild(tri.blueup);
if(tri.colorup==2)
addChild(tri.yellowup);
if(tri.colorup==3)
addChild(tri.redup);
if(tri.colorup==4)
addChild(tri.greenup);
if(tri.colorup==5)
addChild(tri.whiteup);
*/
			
			if(board[xx][yy]==1)//purple
			{
			rgb1.r=255;
			rgb1.b=255;
			rgb1.g=0;
			}
			if(board[xx][yy]==2)//blue
			{
			rgb1.r=0;
			rgb1.b=255;
			rgb1.g=0;
			}
			if(board[xx][yy]==3)//blue
			{
			rgb1.r=255;
			rgb1.b=0;
			rgb1.g=255;
			}
			if(board[xx][yy]==4)//blue
			{
			rgb1.r=255;
			rgb1.b=0;
			rgb1.g=0;
			}
			if(board[xx][yy]==5)//blue
			{
			rgb1.r=0;
			rgb1.b=0;
			rgb1.g=255;
			}
			if(board[xx][yy]==6)//blue
			{
			rgb1.r=255;
			rgb1.b=255;
			rgb1.g=255;
			}
			
			/*
			rgb1.r=241;
			rgb1.g=166;
			rgb1.b=251;
			*/
			
			rgb2.r=203;
			rgb2.g=2;
			rgb2.b=219;
			
			rgb3.r=255;
			rgb3.g=255;
			rgb3.b=255;
			
			rgb4.r=255;
			rgb4.g=255;
			rgb4.b=255;
			
			var b3:Bitmap;
			
			p1= new ParticleEffect_Triup(b3,superstage,1,rgb1,rgb2,rgb3,rgb4,rgb5,15,30,239+16*(xx),88+48*(yy+1));
				//p1= new ParticleEffect_Trid(b3,superstage,1,rgb1,rgb2,rgb3,rgb4,rgb5,15,30,0,0);
			p1.advancemilliseconds(1);
			particlecontroller.registereffect(p1);








var t:Tri;
score=score+100*level*combo;
combo++;
scoredisplay.text = score.toString();

if(score>highscore)
{
highscore=score;
highscoredisplay.text=highscore.toString();
}

look_if_a_tri_is_completed_to_change_fall_mode=true;
boardtemp[xx][yy]=0;
boardtemp[xx][yy+1]=0;
boardtemp[xx-1][yy+2]=0;
boardtemp[xx-1][yy+1]=0;
boardtemp[xx+1][yy+2]=0
boardtemp[xx+1][yy+1]=0

//trace("wooo"+xx+","+yy);


t=boardtri[xx][yy+1];
if(t!=null)
erasetri(t);
boardtri[xx][yy+1]=null;

t=boardtri[xx+1][yy+2];
if(t!=null)
erasetri(t);
boardtri[xx+1][yy+2]=null;

t=boardtri[xx-1][yy+2];
if(t!=null)
erasetri(t);
t=boardtri[xx-1][yy+2]=null;
}


public function game_over(){
gameoverdisplay1.text="Game";
addChild(gameoverdisplay1);
gameoverdisplay1.y=360;
gameoverdisplay2.text="Over";
addChild(gameoverdisplay2);
gameoverdisplay2.y=380;
gameover=true;

gameovertime=timeelapsed;
}//end gameover

public function erasetri(t:Tri)
{
	if(t.colorup==0)
removeChild(t.purpleup);
if(t.colorup==1)
removeChild(t.blueup);
if(t.colorup==2)
removeChild(t.yellowup);
if(t.colorup==3)
removeChild(t.redup);
if(t.colorup==4)
removeChild(t.greenup);
if(t.colorup==5)
removeChild(t.whiteup);

if(t.colordown==0)
removeChild(t.purpledown);
if(t.colordown==1)
removeChild(t.bluedown);
if(t.colordown==2)
removeChild(t.yellowdown);
if(t.colordown==3)
removeChild(t.reddown);
if(t.colordown==4)
removeChild(t.greendown);
if(t.colordown==5)
removeChild(t.whitedown);

}
public function check_for_clear()
{

if(clearboard==false)
if(board[10][9]==0)
{
score=score+1000*level;
scoredisplay.text = score.toString();
clearboard=true;
if(score>highscore)
{
highscore=score;
highscoredisplay.text=highscore.toString();
}


}

}

private function aftermx()
{
if(mx==-1)
{
	if(adjust!=1)
	{
		adjust=0;
		if(board[posx-1][posy+1]>0)
		adjust=1;
		posx--;
	}
}
if(mx==1)
{
	if(adjust!=-1)
	{
		adjust=0;
		if(board[posx+1][posy+1]>0)
		adjust=-1;
		posx++;
	}
}


afterupdate();
	

}

public function adjust_fallen_board()
{
var temptri:Tri;
//shift down everyone going \ and shift down everyone going /
//Start from bottom and work to top;

var xx:int;
var yy:int;
var i:int;
var j:int;

for(i=0;i<21;i++)
for(j=0;j<10;j++)
if(boardtri[i][j]!=null)
{
temptri=boardtri[i][j];
temptri.autofall(0);
}
	
for(yy=9;yy>0;yy--)
for(xx=yy+1;xx<20-yy;xx=xx+2)
{
if(board[xx][yy]==0)
{
	if(board[xx-1][yy-1]>99 &&board[xx-1][yy-1]<200)//fall \
	{
	board[xx][yy]=board[xx-1][yy-1]-100;
	board[xx][yy-1]=board[xx-1][yy-2];
	board[xx-1][yy-1]=0;
	board[xx-1][yy-2]=0;
	
	boardtri[xx][yy]=boardtri[xx-1][yy-1];
	boardtri[xx-1][yy-1]=null;
	trace("Fall \\ XX:"+xx+" YY:"+yy);
	} 
	if(board[xx+1][yy-1]>199 &&board[xx+1][yy-1]<300)//fall /
	{
	board[xx][yy]=board[xx+1][yy-1]-200;
	board[xx][yy-1]=board[xx+1][yy-2];

	board[xx+1][yy-1]=0;
	board[xx+1][yy-2]=0;
	boardtri[xx][yy]=boardtri[xx+1][yy-1];
	boardtri[xx+1][yy-1]=null;
	trace("Fall / XX:"+xx+" YY:"+yy);
	} 
	
	
	
}	//end of board[xx][yy]==0

}//end of YY/XX
	
}
    }//end of class
    
}