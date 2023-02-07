package kr.swcore.sderp.user.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {
	private int userNo;
	private String userId;
	private String compId;
	private String userName;
	private String userPasswd;
	private String userRole;
	private String docRole;
	private String userKey;
	private int userOtp;
	private String compNo;
	private String userRank;
	private String userDept;
	private int org_id;
	private String userChangePasswd;
	private String attrib;
	private String userTel;
	private String userEmail;
	
	private String listDateFrom;
	
	// 23-02-07 등록일 수정일 추가
	private String regDateTime;
	private String modDateTime;
	
	private String attStart;
	private String attEnd;
	private String attDesc;
	private int attType;
	private String googleCalendarId;
}
