/**
  * @说明 
  * @作者 黎嘉杰 
  * @日期 2016年8月27日 下午9:36:40 
  */
package bas.alpayset;

import bean.base.BaseInfo;
import common.db.BeanTableInfo;

/**
  * @说明 支付宝支付设置
  * @作者 黎嘉杰 
  * @日期 2016年9月10日 下午3:32:55 
  */
public class ALPaySetInfo extends BaseInfo{
	private static final long serialVersionUID = 1L;
	
	protected String pid = null;
	protected String appId = null;
	protected String signType = null;
	
	protected String payApi = null;
	protected String bzApi = null;
	
	protected String publicKey = null;
	protected String privateKey = null;
	protected String alPublicKey = null;
	
	public ALPaySetInfo() {
		super();
	}
	
	

	public String getPid() {
		return pid;
	}



	public void setPid(String pid) {
		this.pid = pid;
	}



	public String getAppId() {
		return appId;
	}



	public void setAppId(String appId) {
		this.appId = appId;
	}



	public String getSignType() {
		return signType;
	}



	public void setSignType(String signType) {
		this.signType = signType;
	}



	public String getPayApi() {
		return payApi;
	}



	public void setPayApi(String payApi) {
		this.payApi = payApi;
	}



	public String getBzApi() {
		return bzApi;
	}



	public void setBzApi(String bzApi) {
		this.bzApi = bzApi;
	}



	public String getPublicKey() {
		return publicKey;
	}



	public void setPublicKey(String publicKey) {
		this.publicKey = publicKey;
	}



	public String getPrivateKey() {
		return privateKey;
	}



	public void setPrivateKey(String privateKey) {
		this.privateKey = privateKey;
	}



	public String getAlPublicKey() {
		return alPublicKey;
	}



	public void setAlPublicKey(String alPublicKey) {
		this.alPublicKey = alPublicKey;
	}



	public BeanTableInfo getBT() throws Exception {
		BeanTableInfo bt = new BeanTableInfo();
		bt.setClsName(ALPaySetInfo.class.getName());
		bt.setTableName("base_alpayset");
		bt.setPk("0045");
		return bt;
	}

}
