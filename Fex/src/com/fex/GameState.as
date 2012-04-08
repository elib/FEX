package com.fex 
{
	import org.flixel.*;
	
	public class GameState extends FlxState
	{
		private var _totalTime:Number = 0;
		private var _nextYellow:Number = 0;
		private var _payer:Payer;
		
		private var _floor:FlxSprite
		
		private var _yellows:FlxGroup;
		
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
			this.add(_floor);
			
			FlxG.camera.follow(_payer, FlxCamera.STYLE_PLATFORMER);
			FlxG.camera.setBounds(0, 0, 100000, FlxG.height, true);
			
			_yellows = new FlxGroup(10);
			this.add(_yellows);
			for (var i:int = 0; i < 10; i++)
			{
				_yellows.add(new YellowThing());
			}
		}
		
		override public function update():void 
		{
			super.update();
			
			_totalTime += FlxG.elapsed;
			
			FlxG.collide(_payer, _floor);
			
			var screennum:int = int(_payer.x / FlxG.width);
			var screennumblock:int = int(_floor.x / FlxG.width);
			if (screennum > screennumblock)
			{
				_floor.x = (screennum - 0.5) * FlxG.width;
			}
			
			if (_nextYellow < _totalTime)
			{
				var yel:YellowThing = (_yellows.getFirstDead() as YellowThing);
				if (yel != null)
				{
					yel.reset(Math.random() * FlxG.width + (_payer.x + FlxG.width / 2), FlxG.height - 40);
					_nextYellow += 2;
				}
			}
		}
	}
}