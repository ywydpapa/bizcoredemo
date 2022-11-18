package kr.swcore.sderp.board_file.dto;

import kr.swcore.sderp.common.dto.PageDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Board_fileDTO extends PageDTO{

	private int bf_pk;
	private String bf_Title;
	private String bf_Contents;
	private int userNo;
	private String regDatetime;
	private String regSDate;	// 등록일 시작
	private String regEDate;
	private String userName;
	private String listDateFrom;
	
	//추가 DTO//추가 DTO//추가 DTO//추가 DTO//추가 DTO
	private int compNo;
	private int row_num;
	//추가 DTO//추가 DTO//추가 DTO//추가 DTO//추가 DTO
}
