package kr.swcore.sderp.board.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.swcore.sderp.board.dto.BoardDTO;

public interface BoardService {
	
	List<BoardDTO> listboard();
	List<BoardDTO> listboard(HttpSession session);
	BoardDTO detailBoard(int boardNo);
	int insertBoard(BoardDTO dto);
	int insertBoard(HttpSession session, BoardDTO dto);
	int updateBoard(int boardNo);
	
}
