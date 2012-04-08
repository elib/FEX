package com.fex 
{
	import org.flixel.*;
	
	public class GameState extends FlxState
	{
		
		private var _payer:Payer;
		
		private var _floor:FlxSprite;
		
		public function GameState() 
		{
			super();
			FlxG.bgColor = 0xffffffff;
		}
		
		override public function create():void 
		{
			super.create();
			
			_payer = new Payer(FlxG.width / 3, FlxG.height / 3);
			this.add(_payer);
			
			_floor = new FlxSprite(- FlxG.width/2, FlxG.height - 20);
			_floor.makeGraphic(FlxG.width * 2, 10, 0xff000000);
			_floor.immovable = true;
			//_floor.scrollFactor.x = _floor.scrollFactor.y = 0;
			this.add(_floor);
			
			
			FlxG.camera.follow(_payer, FlxCamera.STYLE_PLATFORMER);
			FlxG.camera.setBounds(0, 0, 100000, FlxG.height, true);
		}
		
		override public function update():void 
		{
			super.update();
			
			FlxG.collide(_payer, _floor);
			
			var screennum:int = int(_payer.x / FlxG.width);
			var screennumblock:int = int(_floor.x / FlxG.width);
			if (screennum > screennumblock)
			{
				_floor.x = (screennum - 0.5) * FlxG.width;
			}
			
			//_floor.x = _floor.getScreenXY().x;
			
		}
		
	}

}