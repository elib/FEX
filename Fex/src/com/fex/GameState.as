package com.fex 
{
	import org.flixel.*;
	
	public class GameState extends FlxState
	{
		
		private var _payer:Payer;
		
		private var _floor:FlxSprite;
		
		public function GameState() 
		{
			FlxG.bgColor = 0xffffffff;
			_payer = new Payer(FlxG.width / 3, FlxG.height / 3);
			this.add(_payer);
			
			_floor = new FlxSprite(0, FlxG.height - 20);
			_floor.makeGraphic(FlxG.width, 10, 0xff000000);
			_floor.scrollFactor.x = _floor.scrollFactor.y = 0;
			_floor.immovable = true;
			this.add(_floor);
			
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.collide(_payer, _floor);
		}
		
	}

}