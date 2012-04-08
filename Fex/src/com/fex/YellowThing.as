package com.fex 
{
	import org.flixel.*;
	public class YellowThing extends FlxSprite
	{
		public function YellowThing()
		{
			super(0, 0);
			kill();
			
			makeGraphic(16, 16, 0xfffaff00);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (getScreenXY().x + width < 0)
			{
				kill();
			}
		}
		
		override public function reset(X:Number, Y:Number):void 
		{
			super.reset(X, Y);
			angularVelocity = (Math.random() - 0.5) * 720;
		}
		
	}

}