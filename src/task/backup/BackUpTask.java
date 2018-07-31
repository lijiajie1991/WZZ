/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年10月7日 下午1:03:52 
  */
package task.backup;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

import com.baidubce.auth.DefaultBceCredentials;
import com.baidubce.services.bos.BosClient;
import com.baidubce.services.bos.BosClientConfiguration;
import com.baidubce.services.bos.model.BosObjectSummary;
import com.baidubce.services.bos.model.ListObjectsResponse;

import bas.sys.param.IHttpParam;
import common.properties.DbProperties;
import common.util.DateTimeUtil;


/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年10月7日 下午1:03:52 
  */
public class BackUpTask extends TimerTask{
	public static final String ACCESS_KEY_ID = "1ea43cc10f314411a862b703cbab3d60";
	public static final String SECRET_ACCESS_KEY = "15fb7d74471b4196aadb4e3b07dc41a9";
	public static final String BUCKET = "localmysqlbackup";
	public static final String BATFILE = "D:\\mysql_backup.bat";
	
	
	
	/**
	  * @功能描述
	  * @作者 黎嘉杰 
	  * @日期 2016年10月7日 下午1:04:22 
	  * @参数 
	  * @返回
	  */
	public void run() {
		System.out.println("开始执行备份数据");
		
		try{
			String mysqlPath = IHttpParam.getInstance().getStrParam("mysqlPath");
			String user = DbProperties.getProperties("USER");
			String password = DbProperties.getProperties("PASSWORD");
			String db = DbProperties.getProperties("DB");
			
			String fileName = db + "_" + DateTimeUtil.getDateStr(DateTimeUtil.getDateAfterDays(new Date(), 0), DateTimeUtil.numberFormat);
			String dbFile = "D:\\" + fileName + ".dump";
			File file = new File(BATFILE);
			if(file.exists())
				file.delete();
			file.createNewFile();
			
			//写入相应的文件
	        BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(BATFILE));
	        
	        String delFile = db + "_" + DateTimeUtil.getDateStr(DateTimeUtil.getDateAfterDays(new Date(), -10), "yyyyMMdd");
			
	        
			// 导出数据库语句
			StringBuffer cmd = new StringBuffer();
			cmd.append(mysqlPath.substring(0, 2) + "\n");
			cmd.append("cd " + mysqlPath.substring(2) + "\n");
			cmd.append("mysqldump -u");
			cmd.append(user);
			cmd.append(" -p");
			cmd.append(password);
			cmd.append(" --set-charset=utf8 ");
			cmd.append(db);
			cmd.append(" > " + dbFile + "\n");
			cmd.append("exit\n");
			
			out.write(cmd.toString().getBytes());
			
			//清楚缓存
	        out.flush();
	        //关闭流
	        out.close();
	        
			//创建系统执行器并执行备份语句
			Runtime rt = Runtime.getRuntime();
			rt.exec("cmd.exe /c start " + BATFILE);
			
			
			UpLoadAndDeleteFile uf = new UpLoadAndDeleteFile(dbFile, delFile);
			uf.start();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.println("完成备份任务");
	}

	/**
	 * @功能秒杀 上传备份数据
	 * @author lijiajie
	 *
	 */
	protected class UpLoadAndDeleteFile extends Thread
	{
		protected String fielName = null;
		protected String delFile = null;
		
		public UpLoadAndDeleteFile(String fielName, String delFile)
		{
			super();
			this.fielName = fielName;
			this.delFile = delFile;
		}
		
		public void run()
		{
			try{
				//等待10分钟
				sleep(1000 * 60 * 10);
				
				BosClientConfiguration config = new BosClientConfiguration();
			    config.setCredentials(new DefaultBceCredentials(BackUpTask.ACCESS_KEY_ID, BackUpTask.SECRET_ACCESS_KEY));
			    BosClient client = new BosClient(config);
			    
			    if(!client.doesBucketExist(BackUpTask.BUCKET))
			    {
			    	client.createBucket(BackUpTask.BUCKET);
			    }
			    
			    File file = new File(this.fielName);
			    client.putObject(BackUpTask.BUCKET, file.getName(), file);
			    
			    ListObjectsResponse objs = client.listObjects(BackUpTask.BUCKET);
			    List<BosObjectSummary> list = objs.getContents();
			    int len = list.size();
			    for(int i = 0; i < len; i++) {
			    	BosObjectSummary obj = list.get(i);
			    	if(obj.getKey().startsWith(delFile))
			    	{
			    		client.deleteObject(BackUpTask.BUCKET, obj.getKey());
			    	}
			    }
			    
			    
			    
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			
			//删除备份文件
			File file = new File(this.fielName);
			if(file.exists())
				file.delete();
			
			//删除备份文件
			File batFile = new File(BATFILE);
			if(batFile.exists())
				batFile.delete();
		}
	}
	
	

}
