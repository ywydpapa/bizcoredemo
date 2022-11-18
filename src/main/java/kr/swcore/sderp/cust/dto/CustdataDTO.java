package kr.swcore.sderp.cust.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class CustdataDTO{
	
	private int custdataNo;
	private int custNo;
	private int catNo;
	private String dataStr;
	private int dataNum;
	private MultipartFile dataBlob;
	private Date dataDate;
	private String attrib;
	public int getCustdataNo() {
		return custdataNo;
	}
	public Date getDataDate() {
		return dataDate;
	}
	public void setDataDate(Date dataDate) {
		this.dataDate = dataDate;
	}
	public void setCustdataNo(int custdataNo) {
		this.custdataNo = custdataNo;
	}
	public int getCustNo() {
		return custNo;
	}
	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}
	public int getCatNo() {
		return catNo;
	}
	public void setCatNo(int catNo) {
		this.catNo = catNo;
	}
	public String getDataStr() {
		return dataStr;
	}
	public void setDataStr(String dataStr) {
		this.dataStr = dataStr;
	}
	public int getDataNum() {
		return dataNum;
	}
	public void setDataNum(int dataNum) {
		this.dataNum = dataNum;
	}
	
	public MultipartFile getDataBlob() {
		return dataBlob;
	}
	public void setDataBlob(MultipartFile dataBlob) {
		this.dataBlob = dataBlob;
	}
	public String getAttrib() {
		return attrib;
	}
	public void setAttrib(String attrib) {
		this.attrib = attrib;
	}
	@Override
	public String toString() {
		return "CustdataDTO [custdataNo=" + custdataNo + ", custNo=" + custNo + ", catNo=" + catNo + ", dataStr="
				+ dataStr + ", dataNum=" + dataNum + ", dataBlob=" + dataBlob + ", dataDate=" + dataDate + ", attrib="
				+ attrib + "]";
	}
	
	public CustdataDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}