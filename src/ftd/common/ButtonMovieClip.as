/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common
{
import flash.events.MouseEvent;

import ftd.common.effects.Grow;

import ftd.common.effects.IEffect;

import org.osflash.signals.natives.NativeSignal;

public class ButtonMovieClip extends CommonMovieClip
{
	public var effects:Array;
	public var effectsActive:Boolean;
	public var bringToFrontEnabled:Boolean;

	public var clicked:NativeSignal;

	public function ButtonMovieClip()
	{
		this.buttonMode = true;
		this.useHandCursor = true;

		this.bringToFrontEnabled = true;

		// default is grow to 105% in .2 second
		var e:Grow = new Grow(this);
		this.effects = [e];

		this.effectsActive = true;

		this.clicked = new NativeSignal(this, MouseEvent.CLICK, MouseEvent);

		this.addEventListener(MouseEvent.MOUSE_OVER, this.over, false, 0, true);
		this.addEventListener(MouseEvent.MOUSE_OUT,  this.out,  false, 0, true);
	}


	protected function over(e:MouseEvent = null):void
	{
		if (this.effectsActive) {
			for (var i:int = 0; i < this.effects.length; ++i) {
				var eff:IEffect = this.effects[i];
				eff.over(this);
			}
		}

		if (this.bringToFrontEnabled) {
			this.bringToFront();
		}
	}

	protected function out(e:MouseEvent = null):void
	{
		if (this.effectsActive) {
			for (var i:int = 0; i < this.effects.length; ++i) {
				var eff:IEffect = this.effects[i];
				eff.out(this);
			}
		}
	}
}
}
