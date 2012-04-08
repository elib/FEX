package com.fex 
{
	import org.flixel.*;
	
	public class GameState extends FlxState
	{
		[Embed(source = '../../../../4eliFEX.mp3')] private var SndFex:Class;
		[Embed(source = '../../../../4eliFEXYAY.mp3')] private var SndYay:Class;
		
		private var _totalTime:Number = 0;
		private var _nextYellow:Number = 0;
		
		private var hitalready:Boolean;
		private var _payer:Payer;
		
		private var _floor:FlxSprite
		
		private var _yellows:FlxGroup;

		private var _scoreblocks:FlxGroup;
		
		private var _txtscore:FlxText;
		
		private var _stopJumping:Number = 0;
		
		public function GameState() 
		{
			super();
			FlxG.bgColor = 0xff83eae8;
		}
		
		override public function create():void 
		{
			super.create();
			
			_payer = new Payer(FlxG.width / 3, FlxG.height / 3);
			this.add(_payer);
			
			_scoreblocks = new FlxGroup();
			this.add(_scoreblocks);
			
			FlxG.playMusic(SndFex);
			
			
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
			
			_txtscore = new FlxText(10, FlxG.height - 35, FlxG.width / 2, "");
			_txtscore.setFormat(null, 8, 0xff0000, null, 0xff333333);
			_txtscore.scrollFactor.x = _txtscore.scrollFactor.y = 0;
			this.add(_txtscore);
		}
		
		override public function update():void 
		{
			super.update();
			
			hitalready = false;
			
			if (_stopJumping != 0)
			{
				if (_stopJumping < _totalTime)
				{
					FlxG.music.play();
					_payer.control(true);
					_payer.active = true;
					_stopJumping = 0;
				}
				else
				{
					//_payer.jump();
				}
			}
			
			
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
			
			FlxG.collide(_payer, _yellows, YellowHit);
		}
		
		private function YellowHit(payer:FlxObject, yel:FlxObject):void
		{
			if (hitalready)
				return;
				
			yel.kill();
			FlxG.score += 1;
			//calculate target location
			var targx:Number = (FlxG.score % FlxG.width) - 1;
			var targy:Number = int(FlxG.score / FlxG.width);
			var newblock:FloatYellow = new FloatYellow(targx, targy);
			_scoreblocks.add(newblock);
			
			_txtscore.text = "" + FlxG.score + "/" + 320 * 240 + " PIXELS FOUND";
			_txtscore.flicker(3);
			
			_stopJumping = _totalTime + 3;
			_payer.active = false;
			_payer.control(false);
			FlxG.music.pause();
			FlxG.play(SndYay);
			
			hitalready = true;
		}
	}
}