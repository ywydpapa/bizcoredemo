package kr.swcore.sderp.gw.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GwFileDataDTO {
	private String fileId;
	private String fileName;
	private String fileDesc;
	private String uploadDate;
	private byte[] fileContent;
	private Integer docNo;
	private Integer userNo;
	private Integer updateNo;
	private Integer lastdocNo;
	
	private String fileExtention;
	private String fileSize;
	
	public GwFileDataDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
}
