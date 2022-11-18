package kr.swcore.sderp.notice.dto;

import kr.swcore.sderp.common.dto.PageDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class NoticeDTO extends PageDTO {
	private int notiNo;
	private String notiTitle;
	private String notiContents;
	private int userNo;
	private String regDatetime;
	private String regSDate;	// 등록일 시작
	private String regEDate;	// 등록일 끝
	
	private String userName;
	private int compNo;
	private int row_num;
	private String listDateFrom;
}
