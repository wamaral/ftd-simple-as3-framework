/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common.effects
{
import com.greensock.plugins.ColorMatrixFilterPlugin;
import com.greensock.plugins.EndArrayPlugin;
import com.greensock.plugins.TweenPlugin;

import ftd.common.ButtonMovieClip;

public class Color extends AEffect
	implements IEffect
{
	public var params:Object;

	public function Color(tgt:ButtonMovieClip = null)
	{
		super(tgt);
		TweenPlugin.activate([ColorMatrixFilterPlugin, EndArrayPlugin]);
		this.defaultOverParams = {colorMatrixFilter:{}};
		this.defaultOutParams = {colorMatrixFilter:{}};
	}


	public override function getOverParams():Object
	{
		return this.params ? {colorMatrixFilter: this.params} : this.defaultOverParams;
	}
}
}
