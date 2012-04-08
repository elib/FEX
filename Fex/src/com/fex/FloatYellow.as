package com.fex 
{
	import org.flixel.*;
	public class FloatYellow  extends FlxSprite
	{
		
		private var _totalTime:Number = 0;
		private const _targetTime:Number = 2;
		private var x0:Number = 0;
		private var y0:Number = 0;
		private var targx:Number = 0;
		private var targy:Number = 0;
		private var scale0:Number = 0;
		
		public function FloatYellow(xtarg:Number, ytarg:Number) 
		{
			var h:Number = FlxG.height * 0.8;
			var marginx:Number = (FlxG.width - h) / 2;
			var marginy:Number = (FlxG.height - h) / 2;
			x0 = marginx + h / 2;
			y0 = marginy + h / 2;
			targx = xtarg;
			targy = ytarg;
			super(x0, y0);
			
			makeGraphic(1, 1, 0xfffaff00, false);
			
			scale.x = h;
			scale.y = h;
			scale0 = h;
			
			scrollFactor.x = scrollFactor.y = 0;
		}
		
		override public function update():void 
		{
			super.update();
			_totalTime += FlxG.elapsed;
			
			if (_totalTime > _targetTime + 0.1)
			{
				x = targx;
				y = targy;
				scale.x = scale.y = 1;
				return;
			}
			
			var fac:Number = 1 - (_targetTime - _totalTime) / _targetTime;
			var xthink:Number = x0 + (targx - x0) * fac;
			var ythink:Number = y0 + (targy - y0) * fac;
			var sca:Number = scale0 + (1 - scale0) * fac;
			
			x = xthink;
			y = ythink;
			scale.x = scale.y = Math.max(sca, 1);
		}
		
	}

}