/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.helpers
{
import flash.net.registerClassAlias;
import flash.utils.ByteArray;
import flash.utils.getQualifiedClassName;

public class ObjectHelper
{
	public static function clone(obj:Object):*
	{
		var ba:ByteArray = new ByteArray();
		ba.writeObject(obj);
		ba.position = 0;
		return(ba.readObject());
	}

	public static function registerClassForCloning(c:Class):void
	{
		registerClassAlias("ftd.class_aliases.class" + getQualifiedClassName(c), c);
	}

	public static function registerClassesForCloning(classes:Array):void
	{
		for (var i:int = 0; i < classes.length; ++i) {
			registerClassForCloning(classes[i]);
		}
	}
}
}
