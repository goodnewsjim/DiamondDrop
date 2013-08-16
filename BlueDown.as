package
{
    
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import flash.media.Sound;
        
    public class BlueDown extends Sprite
    {
        
        private var gfx:Bitmap;
        
        [ Embed ( source = "bluedown1.png" ) ] private var soccerGFXClass:Class;
        
        public function BlueDown ( )
        {

            
            gfx = new soccerGFXClass( );

       
            addChild( gfx );
        }
        
        public function moveto(xx:int,yy:int)
        {
        this.x=xx+239;
        this.y=yy+88;	
        
        }
        
       // initialization, called after parent addChild
        
       
        
        
    }

    
}