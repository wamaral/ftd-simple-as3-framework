/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common
{
public class Screen extends CommonMovieClip
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
		//
	}


	public function cleanup():void
	{
		//
	}


	public function getIndex():int
	{
		return this.index;
	}


	public function pause():void
	{
		//
	}


	public function resume():void
	{
		//
	}
}
}
