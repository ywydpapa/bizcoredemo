package kr.swcore.sderp.code.dto;

public class CodeDTO {

	private int codeNo;
	private int compNo;
	private String code01;
	private String code02;
	private String code03;
	private String desc01;
	private String desc02;
	private String desc03;
	private String value01;
	private String value02;
	private String value03;
	private String sortNo;
	private String regDatetime;
	private String modDatetime;
	private String attrib;
	private String compId;
	private String compName;
	private String compType;
	private String saleType;
	
	
	
	public String getCompType() {
		return compType;
	}
	public void setCompType(String compType) {
		this.compType = compType;
	}
	public String getSaleType() {
		return saleType;
	}
	public void setSaleType(String saleType) {
		this.saleType = saleType;
	}
	public int getCodeNo() {
		return codeNo;
	}
	public void setCodeNo(int codeNo) {
		this.codeNo = codeNo;
	}
	public int getCompNo() {
		return compNo;
	}
	public void setCompNo(int compNo) {
		this.compNo = compNo;
	}
	public String getCode01() {
		return code01;
	}
	public void setCode01(String code01) {
		this.code01 = code01;
	}
	public String getCode02() {
		return code02;
	}
	public void setCode02(String code02) {
		this.code02 = code02;
	}
	public String getCode03() {
		return code03;
	}
	public void setCode03(String code03) {
		this.code03 = code03;
	}
	public String getDesc01() {
		return desc01;
	}
	public void setDesc01(String desc01) {
		this.desc01 = desc01;
	}
	public String getDesc02() {
		return desc02;
	}
	public void setDesc02(String desc02) {
		this.desc02 = desc02;
	}
	public String getDesc03() {
		return desc03;
	}
	public void setDesc03(String desc03) {
		this.desc03 = desc03;
	}
	public String getValue01() {
		return value01;
	}
	public void setValue01(String value01) {
		this.value01 = value01;
	}
	public String getValue02() {
		return value02;
	}
	public void setValue02(String value02) {
		this.value02 = value02;
	}
	public String getValue03() {
		return value03;
	}
	public void setValue03(String value03) {
		this.value03 = value03;
	}
	public String getSortNo() {
		return sortNo;
	}
	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}
	public String getRegDatetime() {
		return regDatetime;
	}
	public void setRegDatetime(String regDatetime) {
		this.regDatetime = regDatetime;
	}
	public String getModDatetime() {
		return modDatetime;
	}
	public void setModDatetime(String modDatetime) {
		this.modDatetime = modDatetime;
	}
	public String getAttrib() {
		return attrib;
	}
	public void setAttrib(String attrib) {
		this.attrib = attrib;
	}
	
	
	public String getCompId() {
		return compId;
	}
	public void setCompId(String compId) {
		this.compId = compId;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	@Override
	public String toString() {
		return "CodeDTO [codeNo=" + codeNo + ", compNo=" + compNo + ", code01=" + code01 + ", code02=" + code02
				+ ", code03=" + code03 + ", desc01=" + desc01 + ", desc02=" + desc02 + ", desc03=" + desc03
				+ ", value01=" + value01 + ", value02=" + value02 + ", value03=" + value03 + ", sortNo=" + sortNo
				+ ", regDatetime=" + regDatetime + ", modDatetime=" + modDatetime + ", attrib=" + attrib + ", compId="
				+ compId + ", compName=" + compName + ", compType=" + compType + ", saleType=" + saleType + "]";
	}
	public CodeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
