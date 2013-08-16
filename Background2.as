package
{
    
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import flash.media.Sound;
        
    public class Background2 extends Sprite
    {
        
        private var gfx:Bitmap;
        
        [ Embed ( source = "background.png" ) ] private var soccerGFXClass:Class;
        
        public function Background2( )
        {

            
            gfx = new soccerGFXClass( );

       
            addChild( gfx );
        }
        
        public function moveto(xx:int,yy:int)
        {
        this.x=xx;
        this.y=yy;	
        
        }
       // initialization, called after parent addChild
        
       
        
        
    }

    
}