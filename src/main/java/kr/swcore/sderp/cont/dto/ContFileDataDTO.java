package kr.swcore.sderp.cont.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ContFileDataDTO {
	private String fileId;
	private String fileName;
	private String fileDesc;
	private String uploadDate;
	private byte[] fileContent;
	private Integer contNo;
	private Integer userNo;

	private String fileExtention;
	private String fileSize;
	
	public ContFileDataDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
}
