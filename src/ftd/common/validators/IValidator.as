/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common.validators
{
public interface IValidator
{
	function validate(txt:String):Boolean;
	function fix(txt:String):String;
}
}
