/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common
{
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;

public class CommonMovieClip extends MovieClip
{
	public function CommonMovieClip()
	{
		super();
	}

	public function bringToFront(holder:DisplayObjectContainer = null):void
	{
		var tgt:DisplayObjectContainer = holder ? holder : this.parent;
		if (tgt) {
			tgt.setChildIndex(this, tgt.numChildren - 1);
		}
	}

	public function sendToBack(holder:DisplayObjectContainer = null):void
	{
		var tgt:DisplayObjectContainer = holder ? holder : this.parent;
		if (tgt) {
			tgt.setChildIndex(this, 0);
		}
	}

	public function bringChildToFront(child:DisplayObject):void
	{
		this.setChildIndex(child, this.numChildren - 1);
	}

	public function sendChildToBack(child:DisplayObject):void
	{
		this.setChildIndex(child, 0);
	}
}
}
