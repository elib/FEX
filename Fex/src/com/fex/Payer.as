package com.fex 
{
	import org.flixel.*;
	
	public class Payer extends FlxSprite
	{
		[Embed(source = '../../../../sprite.png')] private var ImgPayer:Class;
		
		private var _hasControl:Boolean = true;
		
		public function control(cancontrol:Boolean):void
		{
			_hasControl = cancontrol;
		}
		
		public function Payer(X:Number, Y:Number) 
		{
			super(X, Y);
			
			loadGraphic(ImgPayer, true, true, 16, 16);
			
			acceleration.y = 500;
			acceleration.x = 0;
			maxVelocity.x = 110;
			maxVelocity.y = 300;
			drag.x = drag.y = 500;
			
		}
		
		public function jump():void
		{
			var t:uint = touching;
			if (isTouching(DOWN))
			{
				velocity.y = -200;
			}
		}
		
		override public function update():void 
		{
			super.update();
			
			if (_hasControl)
			{				
				if ((FlxG.keys.justPressed("SPACE") || FlxG.keys.justPressed("W") || FlxG.keys.justPressed("UP")))
				{
					jump();
				}
				
				if (FlxG.keys.LEFT || FlxG.keys.A)
				{
					facing = LEFT;
					velocity.x = -200;
				}
				
				
				if (FlxG.keys.RIGHT || FlxG.keys.D)
				{
					facing = RIGHT;
					velocity.x = 200;
				}
			}
		}
		
	}

}