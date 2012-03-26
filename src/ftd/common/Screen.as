/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common
{
import flash.display.MovieClip;

public class Screen extends MovieClip
{
	public var title:String;
	internal var index:int;

	public function Screen(title:String = null)
	{
		if (title) {
			this.title = title;
		}
		this.stop();
	}


	public function init():void
	{
		;
	}


	public function cleanup():void
	{
		;
	}


	public function getIndex():int
	{
		return this.index;
	}
}
}
