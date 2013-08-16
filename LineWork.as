package
{
    
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.media.Sound;
        
    public class LineWork extends Sprite
    {
        
        
        public function LineWork ( )
        {


      var rectangleA:Sprite = new Sprite();
        rectangleA.graphics.lineStyle(1, 0x000000, 100, false);
        rectangleA.graphics.moveTo(0,0);
        rectangleA.graphics.lineTo(159,480);
        rectangleA.graphics.lineTo(159,496);
        rectangleA.graphics.lineTo(0,16);
        rectangleA.graphics.moveTo(159,496);
        rectangleA.graphics.lineTo(319,16);
        rectangleA.graphics.lineTo(319,0);
        rectangleA.graphics.lineTo(159,480);
       
        addChild(rectangleA);            
              
            
        }
        
        
       // initialization, called after parent addChild
        
        public function init ( ):void                    
        {
        
         
        }
        
        private function dragCircle ( event:MouseEvent ):void
        {
 
            
            
        }
        
        private function releaseCircle ( event:MouseEvent ):void
        {
            
        
        }
        
        private function moveCircle ( event:MouseEvent ):void
        {
            
            
            
        }
        
        public function step ( event:Event ):void
        {
           
              
        }
        
    }

    
}