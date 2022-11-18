package kr.swcore.sderp.board.dao;

import java.util.List;

import kr.swcore.sderp.board.dto.BoardDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

public interface BoardDAO {

	List<BoardDTO> listboard();
	List<BoardDTO> listboard(SoppDTO soppDTO);
	BoardDTO detailBoard(int boardNo);
	int insertBoard(BoardDTO dto);
	int updateBoard(int boardNo);
	
	
}
