package kr.swcore.sderp.sopp.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SoppFileDataDTO {
	private String fileId;
	private String fileName;
	private String fileDesc;
	private String uploadDate;
	private byte[] fileContent;
	private Integer soppNo;
	private Integer userNo;
	private String fileExtention;
	private String fileSize;
}
