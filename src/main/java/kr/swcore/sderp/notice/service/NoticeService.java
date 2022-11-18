package kr.swcore.sderp.notice.service;


import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.board_file.dto.Board_fileDTO;
import kr.swcore.sderp.common.dto.PageDTO;
import kr.swcore.sderp.notice.dto.NoticeDTO;

public interface NoticeService {
	List<NoticeDTO> listNotice();
	List<NoticeDTO> listNotice(HttpSession session, PageDTO pageDTO);
	Object listNotice(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response);
	int insertNotice(HttpSession session, NoticeDTO dto);
	NoticeDTO detailNotice(int notiNo);
	int updateNotice(NoticeDTO dto);
	int deleteNotice(int notiNo);
	
	List<Board_fileDTO> listNotice1(HttpSession session, PageDTO pageDTO);
	Object listNotice1(HttpSession session, String param, HttpServletRequest request, HttpServletResponse response);
}
