/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common.validators
{
public class IntBetweenValidator implements IValidator
{
	protected var min:int;
	protected var max:int;
	
	public function IntBetweenValidator(min:int, max:int)
	{
		this.min = min;
		this.max = max;
	}

	public function validate(txt:String):Boolean
	{
		var i:int = parseInt(txt);
		if (isNaN(i)) {
			return false;
		}
		return (i >= min) && (i <= max);
	}

	public function fix(txt:String):String
	{
		var i:int = parseInt(txt);
		if (isNaN(i)) {
			return "";
		}
		if (i < this.min) {
			i = this.min;
		}
		if (i > this.max) {
			i = this.max;
		}
		return i.toString();
	}
}
}
