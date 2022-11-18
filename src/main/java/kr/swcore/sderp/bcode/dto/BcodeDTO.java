package kr.swcore.sderp.bcode.dto;

public class BcodeDTO {
		private String code02;
		private String desc02;
		private String code03;
		private String desc03;
		private String value03;
		private String sortNo;
		
		public String getCode02() {
			return code02;
		}
		public void setCode02(String code02) {
			this.code02 = code02;
		}
		public String getDesc02() {
			return desc02;
		}
		public void setDesc02(String desc02) {
			this.desc02 = desc02;
		}
		public String getCode03() {
			return code03;
		}
		public void setCode03(String code03) {
			this.code03 = code03;
		}
		public String getDesc03() {
			return desc03;
		}
		public void setDesc03(String desc03) {
			this.desc03 = desc03;
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
		@Override
		public String toString() {
			return "BcodeDTO [code02=" + code02 + ", desc02=" + desc02 + ", code03=" + code03 + ", desc03=" + desc03
					+ ", value03=" + value03 + ", sortNo=" + sortNo + "]";
		}

		public BcodeDTO() {
			super();
			// TODO Auto-generated constructor stub
		}

		
		
}
