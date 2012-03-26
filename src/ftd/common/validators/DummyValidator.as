/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common.validators
{
public class DummyValidator implements IValidator
{
	public function DummyValidator()
	{
	}

	public function validate(txt:String):Boolean
	{
		return true;
	}

	public function fix(txt:String):String
	{
		return txt;
	}
}
}
