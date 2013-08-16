package
{
    
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import flash.media.Sound;
        
    public class MovingCircle extends Sprite
    {
        
        // for realistic movement we use gravity    
        public var globalKeyListener:Object;
        
        public static var gravity:Number = 1;
        
        public var xspeed:Number;
        public var yspeed:Number;
        
        // we want to "throw" the ball, that's why we need previous positions
        // to calculate new speed components
        
        private var oldx:Number
        private var oldy:Number;
        
        // gfx will be our "skin"
        // sfx will be our sound
        
        private var gfx:Bitmap;
        private var sfx:Sound;
        
        // that's how we embed external assets
        // we have to define an individual class name for them
        
        //[ Embed ( source = "yellowup1.png" ) ] private var soccerGFXClass:Class;
        [ Embed ( source = "pop.mp3" ) ] private var soccerSFXClass:Class;        
        [ Embed ( source = "soccerball.gif" ) ] private var soccerGFXClass:Class;
        
        public function MovingCircle ( )
        {

            // instantiate embedded assets
            
            gfx = new soccerGFXClass( );
            sfx = new soccerSFXClass( );

              // attaching ball to display list
            
            addChild( gfx );
            
            // skin repositioning to middle to make bouncing more precise
            
            gfx.x = - width / 2;
            gfx.y = - height / 2;
            
        
            
            
        }
        
        
       // initialization, called after parent addChild
        
        public function init ( ):void                    
        {
        
        
       
            // x , y and stage are inherited properties
            // watching our width and height not to cross "wall"
            
            x = width / 2 + Math.random( ) * ( stage.stageWidth - width / 2 );        
            y = height / 2 + Math.random( ) * ( stage.stageHeight - height / 2 );
            
            xspeed = 5 + Math.random( ) * 10;
            yspeed = 5 + Math.random( ) * 10;
            
            // start step triggering based on enterframe event
            
            addEventListener( Event.ENTER_FRAME , step );
            
          //  if(Key.isUp(Key.LEFT)){x=0;}

            // add mouseevents to make ourself draggable
            
            addEventListener( MouseEvent.MOUSE_DOWN , dragCircle );
            addEventListener( MouseEvent.MOUSE_UP , releaseCircle );
            
            
     //     globalKeyListener=new Object();
     //       Key.addListener(globalKeyListener);
  
  //        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyFunction);           
        }
 

//TJ question 1: why does pressing down do nothing?
//Down should set the x position of the triangle to 0 and play a clicking sound
/*
private function keyFunction(event:KeyboardEvent):void {
	if (event.keyCode == 40) {
		 x=0
		 sfx.play( ); 
	} 
}
*/
        
        private function dragCircle ( event:MouseEvent ):void
        {
 
            
            // when mousedown, we starting to listen to mouse movement of the stage
            // to catch mouse coordinates
        
            stage.addEventListener( MouseEvent.MOUSE_MOVE , moveCircle );
            
            // we stop stepping during dragging
            
            removeEventListener( Event.ENTER_FRAME , step );
            
        }
        
        private function releaseCircle ( event:MouseEvent ):void
        {
            
            // removing stage mousemove listening
        
            stage.removeEventListener( MouseEvent.MOUSE_MOVE , moveCircle );                
            
            // start stepping
            
            addEventListener( Event.ENTER_FRAME , step );
            
        }
        
        private function moveCircle ( event:MouseEvent ):void
        {
            
            // store previous coordinates
            
            oldx = x;
            oldy = y;
            
            x = event.stageX;
            y = event.stageY;
            
            // calculate new speed components
            
            xspeed = x - oldx;
            yspeed = y - oldy;
            
        }
        
        public function step ( event:Event ):void
        {
            
            
            
            // sett position
            
            x += xspeed;
            y += yspeed;
            
            // adding gravity to y component
            
            yspeed += gravity;
            
            // rotating for realistic movement
            
            rotation += xspeed;
            
            // bounce ball at stage edges
            
            if ( x + xspeed > stage.stageWidth - width / 2 ) 
            {
            
                xspeed *= -1;    
                //sfx.play( );    // playing sound
                
            }
            else if ( x + xspeed < width / 2 ) 
            {
            
                xspeed *= -1;
                //sfx.play( );    // playing sound
            
            }
            
            if ( y + yspeed > stage.stageHeight - height / 2 ) 
            {
            
                yspeed *= -1;
                //sfx.play( );    // playing sound
            
            }
            else if ( y + yspeed < height / 2 )
            {
                
                yspeed *= -1;
                //sfx.play( );    // playind sound    
                
            }
            
        }
        
    }

    
}