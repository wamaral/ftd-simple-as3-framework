/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common.efects
{
import flash.display.DisplayObject;

import ftd.common.ButtonMovieClip;

public class Swap extends AEffect
	implements IEffect
{
	public var overAsset:DisplayObject;
	public var outAsset:DisplayObject;

	public function Swap(tgt:ButtonMovieClip = null)
	{
		super(tgt);
	}

	public override function over(tgt:ButtonMovieClip = null):void
	{
		this.overAsset.visible = true;
		this.outAsset.visible = false;
	}

	public override function out(tgt:ButtonMovieClip = null):void
	{
		this.overAsset.visible = false;
		this.outAsset.visible = true;
	}
}
}
