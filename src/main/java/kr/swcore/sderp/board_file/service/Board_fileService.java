package kr.swcore.sderp.board_file.service;


	import java.io.IOException;
	import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

	import org.springframework.web.multipart.MultipartHttpServletRequest;


	import kr.swcore.sderp.board_file.dto.Board_fileDTO;
import kr.swcore.sderp.board_file.dto.Board_fileDataDTO;
import kr.swcore.sderp.common.dto.PageDTO;

	public interface Board_fileService {
		
		//게시판 등록 action
		void board_file_insert(Board_fileDTO dto);
		//게시판 list 출력
		List<Board_fileDTO> board_file_list(Board_fileDTO dto);
		//게시판 상세
		List<Board_fileDTO> board_file_detail(Board_fileDTO dto);
		//게시판 삭제
		void board_file_delete(Board_fileDTO dto);
		//게시판 수정
		void board_file_update(Board_fileDTO dto);
		
		//uploadFile
		List<Board_fileDTO> listFile(int bf_pk);
		int uploadFile(HttpSession session, int bf_pk, MultipartHttpServletRequest fileList) throws IOException;
		
		//게시물 상세 조회 file detail
		List<Board_fileDataDTO> board_filedata_detail(Board_fileDataDTO datadto);
		//유저 이름
		List<Board_fileDTO> board_file_name(Board_fileDTO dto);

		
		Integer deleteFile(HttpSession session, Board_fileDataDTO dto);
		
		Board_fileDataDTO downloadFile(Board_fileDataDTO dto);
		
		
		
	}

