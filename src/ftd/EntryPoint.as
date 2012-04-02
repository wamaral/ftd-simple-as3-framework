/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd
{
import flash.display.MovieClip;
import flash.events.Event;

import ftd.common.Screen;

import ftd.common.ScreenManager;

import template.Template;
import template.event.TemplateEvent;

public class EntryPoint extends MovieClip
{
	protected var template:Template;

	protected var sm:ScreenManager;

	public function EntryPoint()
	{
		super();
		this.sm = ScreenManager.get();
		this.sm.screenChanged.add(this.screenChanged);

		var t:Template = new Template();
		t.MEC = false;
		t.addEventListener(TemplateEvent.INICIAR,    this.start,        false, 0, true);
		t.addEventListener(TemplateEvent.ABERTA,     this.overlayOpen,  false, 0, true);
		t.addEventListener(TemplateEvent.FECHAR,     this.overlayClose, false, 0, true);
		t.addEventListener(TemplateEvent.CREDITOS,   this.credits,      false, 0, true);
		t.addEventListener(TemplateEvent.INSTRUCOES, this.instructions, false, 0, true);
		t.addEventListener(TemplateEvent.REINICIAR,  this.restart,      false, 0, true);
		this.template = t;
	}

	protected function init():void
	{
		// don't know why the cast...
		(this.template as Template).instance = this;
	}

	protected function screenChanged(screen:Screen):void
	{
		//
	}

	protected function start(e:TemplateEvent):void
	{
		this.sm.init();
	}

	protected function overlayOpen(e:TemplateEvent):void
	{
		this.pause();
	}

	protected function overlayClose(e:TemplateEvent):void
	{
		this.resume();
	}

	protected function credits(e:TemplateEvent):void
	{
		this.pause();
	}

	protected function instructions(e:TemplateEvent):void
	{
		this.pause();
	}

	protected function pause(e:Event = null):void
	{
		this.sm.pause();
	}

	protected function resume(e:Event = null):void
	{
		this.sm.resume();
	}

	protected function restart(e:Event = null):void
	{
		this.sm.restart();
	}
}
}
