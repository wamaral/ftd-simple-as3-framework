/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common.efects
{
import com.greensock.TweenMax;

import flash.utils.getQualifiedClassName

import ftd.common.ButtonMovieClip;

public class AEffect implements IEffect
{
	public var defaultTime:Number = .2;
	public var defaultOverParams:Object;
	public var defaultOutParams:Object;

	public var overTime:Number;
	public var outTime:Number;
	public var overParams:Object;
	public var outParams:Object;
	public var target:ButtonMovieClip;

	protected var tween:TweenMax;

	public function AEffect(tgt:ButtonMovieClip = null)
	{
		if (tgt) {
			this.target = tgt;
		}
	}


	public function over(tgt:ButtonMovieClip = null):void
	{
		this.tween = new TweenMax(tgt ? tgt : this.target, this.getOverTime(), this.getOverParams());
	}

	public function out(tgt:ButtonMovieClip = null):void
	{
		this.tween = new TweenMax(tgt ? tgt : this.target, this.getOutTime(), this.getOutParams());
	}


	public function getOverTime():Number
	{
		return this.overTime ? this.overTime : this.defaultTime;
	}

	public function getOutTime():Number
	{
		return this.outTime ? this.outTime : this.defaultTime;
	}

	public function getOverParams():Object
	{
		return this.overParams ? this.overParams : this.defaultOverParams;
	}

	public function getOutParams():Object
	{
		return this.outParams ? this.outParams : this.defaultOutParams;
	}


	public function toString():String
	{
		return getQualifiedClassName(this) + " [" + this.target + "]";
	}
}
}
