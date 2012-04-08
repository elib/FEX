package com.fex 
{
	import org.flixel.*;
	
	public class Payer extends FlxSprite
	{
		[Embed(source = '../../../../sprite.png')] private var ImgPayer:Class;
		
		public function Payer(X:Number, Y:Number) 
		{
			super(X, Y);
			
			loadGraphic(ImgPayer, true, true, 16, 16);
			
			acceleration.y = 500;
			acceleration.x = 0;
			maxVelocity.x = maxVelocity.y = 200;
			
		}
		
	}

}