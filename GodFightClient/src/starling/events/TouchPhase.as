// =================================================================================================
//
//	Starling Framework
//	Copyright 2011 Gamua OG. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package starling.events
{
    import starling.errors.AbstractClassError;

    /** A class that provides constant values for the phases of a touch object. 
     *  
     *  <p>A touch moves through at least the following phases in its life:</p>
     *  
     *  <code>BEGAN -> MOVED -> ENDED</code>
     *  
     *  <p>Furthermore, a touch can enter a <code>STATIONARY</code> phase. That phase does not
     *  trigger a touch event itself, and it can only occur in multitouch environments. Picture a 
     *  situation where one finger is moving and the other is stationary. A touch event will
     *  be dispatched only to the object under the <em>moving</em> finger. In the list of touches
     *  of that event, you will find the second touch in the stationary phase.</p>
     *  
     *  <p>Finally, there's the <code>HOVER</code> phase, which is exclusive to mouse input. It is
     *  the equivalent of a <code>MouseOver</code> event in Flash when the mouse button is
     *  <em>not</em> pressed.</p> 
     */
    public final class TouchPhase
    {
        /** @private */
        public function TouchPhase() { throw new AbstractClassError(); }
        
        /** 只有鼠标模式下可用：当光标滑过一个对象，并且没有按下鼠标。 鼠标/ 手指悬于物体上（类似于mouseOver）*/
        public static const HOVER:String = "hover";
        
        /** 当手指刚刚接触屏幕，或者鼠标按下。鼠标/ 手指开始交互（类似于mouseDown）*/
        public static const BEGAN:String = "began";
        
        /** 手指在屏幕上滑动，或者鼠标在按下的情况下在屏幕上滑动。  鼠标/ 手指在物体上移动（类似于mouseDown + mouseMove）*/
        public static const MOVED:String = "moved";
        
        /** 手指或鼠标(按下) 没有移动。鼠标/ 手指停止与物体的交互但仍停留在其上 */
        public static const STATIONARY:String = "stationary";
        
        /** 手指离开屏幕或鼠标松开。 鼠标/ 手指停止交互（类似于mouseClick） */
        public static const ENDED:String = "ended";
    }
}