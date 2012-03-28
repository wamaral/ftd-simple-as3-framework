/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common
{
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.text.TextField;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;
import flash.utils.getQualifiedSuperclassName;

import org.osflash.signals.Signal;

public class DraggableMovieClip extends MovieClip
{
	public var allowDepthChange:Boolean;
	public var allowedDropTargetTypes:Array;
	public var checkDropTargetImmediateSuperClass:Boolean;
	public var dropTargetsToSkip:Array;

	public var dragStarted:Signal;
	public var dragStopped:Signal;

	public var lockCenter:Boolean;
	public var bounds:Rectangle;
	public var centeredRegister:Boolean;

	protected var originalPos:Point;
	protected var beforeDragPos:Point;
	protected var dragEnabled:Boolean;

	public function DraggableMovieClip()
	{
		this.allowedDropTargetTypes = [MovieClip, TextField];
		this.checkDropTargetImmediateSuperClass = true;
		this.dropTargetsToSkip = new Array();
		this.originalPos = new Point(this.x,  this.y);
		this.dragStarted = new Signal(DraggableMovieClip);
		this.dragStopped = new Signal(DraggableMovieClip, DisplayObject);
		this.lockCenter = false;
		this.centeredRegister = false;
		this.enableDrag();
	}


	public function enableDrag():void
	{
		if (!this.dragEnabled) {
			this.addEventListener(MouseEvent.MOUSE_DOWN, this.beginDrag, false, 0, true);
			this.addEventListener(MouseEvent.MOUSE_UP, this.endDrag, false, 0, true);
			this.dragEnabled = true;
		}
	}


	public function disableDrag():void
	{
		if (this.dragEnabled) {
			this.removeEventListener(MouseEvent.MOUSE_DOWN, this.beginDrag, false);
			this.removeEventListener(MouseEvent.MOUSE_UP, this.endDrag, false);
			this.dragEnabled = false;
		}
	}
	
	public function returnPos():void
	{
		this.x = this.beforeDragPos.x;
		this.y = this.beforeDragPos.y;
	}
	
	public function resetPos():void
	{
		this.x = this.originalPos.x;
		this.y = this.originalPos.y;
	}

	public function reset():void
	{
		this.stopDrag();
		this.resetPos();
		this.enableDrag();
	}
	
	
	public function fit(d:DisplayObject):void
	{
		this.fitCenter(d);
	}


	public function isEnabled():Boolean
	{
		return this.dragEnabled;
	}



	protected function beginDrag(e:MouseEvent = null):void
	{
		this.beforeDragPos = new Point(this.x,  this.y);
		if (this.allowDepthChange) {
			this.parent.setChildIndex(this, this.parent.numChildren - 1);
		}
		this.startDrag(this.lockCenter, this.bounds);
		this.dragStarted.dispatch(this);
	}

	protected function endDrag(e:MouseEvent = null):void
	{
		var d:DisplayObject;
		var vis:Array = new Array();
		for (var i:int = 0; i < this.dropTargetsToSkip.length; ++i) {
			d = DisplayObject(this.dropTargetsToSkip[i]);
			vis.push(d.visible);
			d.visible = false;
		}
		this.stopDrag();
		for (i = 0; i < this.dropTargetsToSkip.length; ++i) {
			d = DisplayObject(this.dropTargetsToSkip[i]);
			d.visible = vis[i];
		}
		this.dragStopped.dispatch(this, this.getDropTarget());
	}
	
	
	public function getDropTarget():DisplayObject
	{
		var tgt:DisplayObject = this.dropTarget;
		while (tgt != null && this.allowedDropTargetTypes.indexOf(Class(getDefinitionByName(getQualifiedClassName(tgt)))) == -1) {
			tgt = tgt.parent;
		}
		if (tgt == null && this.checkDropTargetImmediateSuperClass) {
			tgt = this.dropTarget;
			while (tgt != null && this.allowedDropTargetTypes.indexOf(Class(getDefinitionByName(getQualifiedSuperclassName(tgt)))) == -1) {
				tgt = tgt.parent;
			}
		}
		return tgt;
	}
	
	
	protected function fitCenter(d:DisplayObject):void
	{
		var rect:Rectangle = d.getRect(this.parent);
		this.x = rect.x + ((rect.width - (this.centeredRegister ? 0 : this.width)) / 2);
		this.y = rect.y + ((rect.height - (this.centeredRegister ? 0 : this.height)) / 2);
	}
	
	protected function fitTopLeft(d:DisplayObject):void
	{
		this.x = d.getRect(this.parent).left + (this.centeredRegister ? this.width / 2 : 0);
		this.y = d.getRect(this.parent).top + (this.centeredRegister ? this.height / 2 : 0);
	}
	
	protected function fitRegistrationPointInCenter(d:DisplayObject):void
	{
		var rect:Rectangle = d.getRect(this.parent);
		this.x = rect.x + (rect.width / 2);
		this.y = rect.y + (rect.height / 2);
	}
}
}
