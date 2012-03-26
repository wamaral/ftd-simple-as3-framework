/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common.efects
{
import ftd.common.ButtonMovieClip;

public class Grow extends AEffect
	implements IEffect
{
	public var defaultPct:Number = 1.05;

	public function Grow(tgt:ButtonMovieClip = null)
	{
		super(tgt);
		this.defaultOverParams = {scaleX: defaultPct, scaleY: defaultPct};
		this.defaultOutParams = {scaleX: 1.0, scaleY: 1.0};
	}
}
}
