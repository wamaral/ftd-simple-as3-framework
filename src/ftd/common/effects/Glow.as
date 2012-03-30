/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common.effects
{
import com.greensock.plugins.GlowFilterPlugin;
import com.greensock.plugins.TweenPlugin;

import ftd.common.ButtonMovieClip;

public class Glow extends AEffect
	implements IEffect
{
	public var params:Object;

	public function Glow(tgt:ButtonMovieClip = null)
	{
		super(tgt);
		TweenPlugin.activate([GlowFilterPlugin]);
		this.defaultOverParams = {glowFilter:{}};
		this.defaultOutParams = {glowFilter:{alpha: 0, remove: true}};
	}


	public override function getOverParams():Object
	{
		return this.params ? {glowFilter: this.params} : this.defaultOverParams;
	}
}
}
