/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年10月7日 下午1:02:07 
  */
package task.sum;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

/**
 * @说明
 * @作者 黎嘉杰
 * @日期 2016年10月7日 下午1:02:07
 */
public class SumManager {
	// 每小时执行一次
	private static final long PERIOD_DAY = 30 * 60 * 1000;
//	private static final long PERIOD_DAY = 10 * 1000;

	public SumManager() {
	  Calendar calendar = Calendar.getInstance();
	        
	  calendar.set(Calendar.HOUR_OF_DAY, 0);
	  calendar.set(Calendar.MINUTE, 0);
	  calendar.set(Calendar.SECOND, 0);
	   
	  Date date=calendar.getTime(); //第一次执行定时任务的时间
	  Timer timer = new Timer();
	   
	  SumTask task = new SumTask();
	  //安排指定的任务在指定的时间开始进行重复的固定延迟执行。
	  timer.schedule(task, date, PERIOD_DAY);
	 }
}
