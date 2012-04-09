/**
 * @author Wagner Amaral <wamaral@wamaral.org>
 */
package ftd
{
public class MainExample extends EntryPoint
{
	public function MainExample()
	{
		super(CIE_NEC_6_1);
		this.template.MEC = false;
		//this.sm.addScreen(this.menu, "menu");
		this.init();
	}
}
}
