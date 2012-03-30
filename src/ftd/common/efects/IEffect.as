/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd.common.efects
{
import ftd.common.ButtonMovieClip;

public interface IEffect
{
	function over(tgt:ButtonMovieClip = null):void;
	function out(tgt:ButtonMovieClip = null):void;
}
}
