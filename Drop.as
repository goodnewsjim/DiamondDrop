package
{
    
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import flash.media.Sound;
       import flash.events.MouseEvent;
	   
	   
    public class Drop extends Sprite
    {
        
        private var gfx:Bitmap;
        
        [ Embed ( source = "drop.png" ) ] private var soccerGFXClass:Class;
        
        public function Drop ( )
        {

            
            gfx = new soccerGFXClass( );

       
            addChild( gfx );
        }
        
        
       // initialization, called after parent addChild
        
            public function moveto(xx:int,yy:int)
        {
        this.x=xx+239;
        this.y=yy+88;	
        
        }
        
        
    }

    
}