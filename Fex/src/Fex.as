package  
{
	import org.flixel.*;
	import com.fex.*;
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]
	[Frame(factoryClass = "Preloader")]
 
	public class Fex extends FlxGame
	{
		public static const TILESIZE:int = 16;
		
		public function Fex()
		{
			super(320, 240, TitleState, 2);
		}
	}
}