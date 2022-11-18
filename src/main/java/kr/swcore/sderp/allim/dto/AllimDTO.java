package kr.swcore.sderp.allim.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AllimDTO {
	private int allimNo;
	private int userNo;
	private int compNo;
	private String allimRole;
	private String allimContents;
	private String allimPath;
	private int readCheck;
	private String regDateTime;
}
