/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common
{
import flash.events.MouseEvent;

import org.osflash.signals.Signal;

public class ScreenManager
{
	private static var instance:ScreenManager = null;

	private var screens:Array;
	private var currentScreen:Screen;
	private var currentScreenIndex:int;
	private var defaultScreenIndex:int;

	public var screenChanged:Signal;

	public function ScreenManager()
	{
		this.screens = new Array();
		this.defaultScreenIndex = 0;
		this.screenChanged = new Signal(Screen);
	}


	public static function get():ScreenManager
	{
		if (instance === null) {
			instance = new ScreenManager();
		}
		return instance;
	}


	public function init():void
	{
		this.currentScreenIndex = this.defaultScreenIndex;
		this.currentScreen = this.screens[this.defaultScreenIndex];
		this.activateScreen();
	}
	
	
	public function addScreen(screen:Screen, title:String = null):void
	{
		screen.index = this.screens.length; // before push
		screen.visible = false;
		if (title) {
			screen.title = title;
		}
		this.screens.push(screen);
	}
	
	
	public function gotoNext(e:MouseEvent = null):void
	{
		if(this.hasNext()) {
			this.currentScreenIndex++;
			this.currentScreen = this.screens[this.currentScreenIndex];
			this.activateScreen();
		}
	}
	
	public function gotoPrev(e:MouseEvent = null):void
	{
		if(this.hasPrev()) {
			this.currentScreenIndex--;
			this.currentScreen = this.screens[this.currentScreenIndex];
			this.activateScreen();
		}
	}
	
	public function gotoScreen(screen:Screen):void
	{
		if(this.hasScreen(screen)) {
			this.gotoScreenIndex(this.getScreenPos(screen));
		}
	}
	
	public function gotoScreenIndex(idx:int):void
	{
		var screen:Screen = this.screens[idx];
		if (screen) {
			this.currentScreenIndex = idx;
			this.currentScreen = screen;
			this.activateScreen();
		}
	}

	public function gotoScreenByName(name:String):void
	{
		var screen:Screen = this.getScreenByName(name);
		if (screen) {
			this.currentScreenIndex = this.getScreenPos(screen);
			this.currentScreen = screen;
			this.activateScreen();
		}
	}


	public function getScreenByName(name:String):Screen
	{
		for (var i:int = 0; i < this.screens.length; ++i) {
			var screen:Screen = this.screens[i];
			if (screen.title == name) {
				return screen;
			}
		}
		return null;
	}
	
	public function getCurrentScreen():Screen
	{
		return this.currentScreen;
	}

	public function getCurrentScreenIndex():int
	{
		return this.currentScreenIndex;
	}

	public function hasScreen(screen:Screen):Boolean
	{
		return this.getScreenPos(screen) != -1;
	}

	public function hasNext():Boolean
	{
		return this.currentScreenIndex < this.screens.length - 1;
	}

	public function hasPrev():Boolean
	{
		return this.currentScreenIndex > 0;
	}

	public function getNext():Screen
	{
		if (this.hasNext()) {
			return this.screens[this.currentScreenIndex + 1];
		}
		return null;
	}

	public function getPrev():Screen
	{
		if (this.hasPrev()) {
			return this.screens[this.currentScreenIndex - 1];
		}
		return null;
	}

	public function getScreenCount():int
	{
		return this.screens.length;
	}

	public function setDefaultScreen(screen:Screen):void
	{
		if(this.hasScreen(screen)) {
			this.setDefaultScreenIndex(this.getScreenPos(screen));
		}
	}

	public function setDefaultScreenIndex(idx:int):void
	{
		var screen:Screen = this.screens[idx];
		if (screen) {
			this.defaultScreenIndex = idx;
		}
	}


	
	protected function activateScreen():void
	{
		var changed:Screen = null;
		for (var i:int = 0; i < this.screens.length; ++i) {
			var s:Screen = this.screens[i];
			if (!s.visible && i == this.currentScreenIndex) {
				s.visible = true;
				s.init();
				changed = s;
			} else if (s.visible && i != this.currentScreenIndex) {
				s.visible = false;
				s.cleanup();
			}
		}
		if (changed) {
			this.screenChanged.dispatch(changed);
		}
	}
	
	public function hideAll():void
	{
		for (var i:int = 0; i < this.screens.length; ++i) {
			var s:Screen = this.screens[i];
			s.visible = false;
			s.cleanup();
		}
	}

	protected function getScreenPos(screen:Screen):int
	{
		return this.screens.indexOf(screen);
	}
}
}
