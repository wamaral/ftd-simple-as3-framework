/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.helpers
{
public class MathHelper
{
	/**
	 * ( Ported from Processing )
	 *
	 * Re-maps a number from one range to another. In the example above,
	 * the number '25' is converted from a value in the range 0..100 into
	 * a value that ranges from the left edge (0) to the right edge (width)
	 * of the screen.
	 * <br/> <br/>
	 * Numbers outside the range are not clamped to 0 and 1, because
	 * out-of-range values are often intentional and useful.
	 *
	 * @param value the incoming value to be converted
	 * @param istart lower bound of the value's current range
	 * @param istop upper bound of the value's current range
	 * @param ostart lower bound of the value's target range
	 * @param ostop upper bound of the value's target range
	 */
	public static function map(value:Number, istart:Number, istop:Number, ostart:Number, ostop:Number):Number
	{
		return ostart + (ostop - ostart) * ((value - istart) / (istop - istart));
	}
}
}
