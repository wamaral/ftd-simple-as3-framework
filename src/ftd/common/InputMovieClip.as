/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common
{
import flash.events.Event;
import flash.text.TextField;

import ftd.common.validators.DummyValidator;

import ftd.common.validators.IValidator;

import org.osflash.signals.Signal;

import org.osflash.signals.natives.NativeSignal;

public class InputMovieClip extends CommonMovieClip
{
	public var input:TextField;
	public var fixEnabled:Boolean;
	protected var validator:IValidator;
	
	public var changed:Signal;
	protected var relayChanged:NativeSignal;

	public function InputMovieClip()
	{
		this.fixEnabled = true;
		this.setValidator(new DummyValidator());

		this.changed = new Signal(InputMovieClip);

		this.attachRelayEvents();
	}
	
	public function setInput(t:TextField):void
	{
		this.input = t;
		this.attachRelayEvents();
	}

	public function getText():String
	{
		return this.input.text;
	}

	public function setText(txt:String):void
	{
		if (this.fixEnabled) {
			if (!this.validator.validate(txt)) {
				txt = this.validator.fix(txt);
			}
		}
		this.input.text = txt;
	}
	
	public function setValidator(v:IValidator):void
	{
		this.validator = v;
	}

	public function validate():Boolean
	{
		return this.validateValue(this.getText());
	}

	public function validateValue(txt:String):Boolean
	{
		return this.validator.validate(txt);
	}

	public function fix():void
	{
		this.setText(this.getText());
	}


	protected function attachRelayEvents():void
	{
		if (this.relayChanged) {
			this.relayChanged.removeAll();
		}
		this.relayChanged = new NativeSignal(this.input, Event.CHANGE, Event);
		this.relayChanged.add(this.rChanged);
	}

	protected function rChanged(e:Event):void
	{
		this.changed.dispatch(this);
	}
}
}
