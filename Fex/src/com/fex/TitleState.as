package com.fex 
{
	import org.flixel.*;
	
	public class TitleState extends FlxState
	{
		[Embed(source = '../../../../fex_logo.png')] private var ImgLogo:Class;
		
		private var anyKeyJustPressed:Boolean = false;
		
		public function TitleState() 
		{
			super();
		}
		
		override public function create():void 
		{
			super.create();
			
			var logo:FlxSprite = new FlxSprite(0, 0, ImgLogo);
			this.add(logo);
			
			//
			//var txt: FlxText = new FlxText(0, FlxG.height - 16, FlxG.width, "press any key");
			//this.add(txt);
			//
			
		}
		
		override public function update():void 
		{
			super.update();
			
			if (FlxG.keys.any() && !anyKeyJustPressed)
			{
				anyKeyJustPressed = true;
				FlxG.fade(0xff000000, 2, StartGame, false);
			}
			else if (!FlxG.keys.any())
			{
				anyKeyJustPressed = false;
			}
		}
		
		private function StartGame():void
		{
			FlxG.switchState(new GameState());
		}
		
	}

}