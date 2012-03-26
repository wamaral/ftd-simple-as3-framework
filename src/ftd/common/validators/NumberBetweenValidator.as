/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common.validators
{
public class NumberBetweenValidator implements IValidator
{
	protected var min:Number;
	protected var max:Number;
	
	public function NumberBetweenValidator(min:Number, max:Number)
	{
		this.min = min;
		this.max = max;
	}

	public function validate(txt:String):Boolean
	{
		var i:Number = parseFloat(txt);
		if (isNaN(i)) {
			return false;
		}
		return (i >= min) && (i <= max);
	}

	public function fix(txt:String):String
	{
		var i:Number = parseFloat(txt);
		if (isNaN(i) || !i) {
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
