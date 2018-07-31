/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年10月7日 下午1:05:07 
  */
package task.sum;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年10月7日 下午1:05:07 
  */
public class SumTaskListener implements ServletContextListener  {
	/**
	  * @功能描述
	  * @作者 黎嘉杰 
	  * @日期 2016年10月7日 下午1:05:17 
	  * @参数 
	  * @返回
	  */
	public void contextDestroyed(ServletContextEvent e) {
	}

	/**
	  * @功能描述
	  * @作者 黎嘉杰 
	  * @日期 2016年10月7日 下午1:05:17 
	  * @参数 
	  * @返回
	  */
	public void contextInitialized(ServletContextEvent e) {
		new SumManager();
	}

}
