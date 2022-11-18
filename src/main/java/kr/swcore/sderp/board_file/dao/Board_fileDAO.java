package kr.swcore.sderp.board_file.dao;

	import java.util.List;

import kr.swcore.sderp.board_file.dto.Board_fileDTO;
import kr.swcore.sderp.board_file.dto.Board_fileDataDTO;



	public interface Board_fileDAO {

		//게시판 등록 acton
		public void board_file_insert(Board_fileDTO dto);
		//게시판 list 출력
		public List<Board_fileDTO> board_file_list(Board_fileDTO dto);
		//게시판 상세
		public List<Board_fileDTO> board_file_detail(Board_fileDTO dto);
		//게시판 삭제
		public void board_file_delete(Board_fileDTO dto);
		//게시판 수정
		public void board_file_update(Board_fileDTO dto);
		
		
		List<Board_fileDTO> listFile(int bf_pk);
		int uploadFile(Board_fileDataDTO dto);
		
		//자료실 filedata 조회
		public List<Board_fileDataDTO> board_filedata_detail(Board_fileDataDTO datadto);
		//유저이름
		public List<Board_fileDTO> board_file_name(Board_fileDTO dto);
		
		//
		Integer deleteFile(Board_fileDataDTO dto);
		
		Board_fileDataDTO downloadFile(Board_fileDataDTO dto);
		
	}

