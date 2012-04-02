/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common.effects
{
import com.greensock.TweenMax;
import com.greensock.easing.Linear;
import com.greensock.plugins.FramePlugin;
import com.greensock.plugins.TweenPlugin;

import ftd.common.ButtonMovieClip;

public class Frame extends AEffect
	implements IEffect
{
	public var lastFrame:int;
	public var frameRate:int = 30;

	public function Frame(tgt:ButtonMovieClip = null)
	{
		super(tgt);
		TweenPlugin.activate([FramePlugin]);
		if (tgt) {
			this.createTween(tgt);
		}
	}

	public override function over(tgt:ButtonMovieClip = null):void
	{
		if (!this.tween && tgt) {
			this.createTween(tgt);
		}
		if (this.tween.paused) {
			this.tween.resume();
		} else {
			this.tween.restart();
		}
	}

	public override function out(tgt:ButtonMovieClip = null):void
	{
		if (!this.tween && tgt) {
			this.createTween(tgt);
		}
		this.tween.reverse();
	}

	protected function createTween(tgt:ButtonMovieClip):void
	{
		if (this.tween) {
			this.tween.kill();
		}
		var lFrame:int = this.lastFrame ? this.lastFrame : tgt.totalFrames;
		this.tween = new TweenMax(tgt, lFrame / this.frameRate, {frame:lFrame, paused:true, ease:Linear.easeNone});
	}
}
}
