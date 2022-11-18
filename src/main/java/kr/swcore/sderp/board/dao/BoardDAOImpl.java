package kr.swcore.sderp.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.board.dto.BoardDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> listboard() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.listBoard");
	}
	
	@Override
	public List<BoardDTO> listboard(SoppDTO soppDTO) {
		return sqlSession.selectList("board.listBoard", soppDTO);
	}

	@Override
	public BoardDTO detailBoard(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(BoardDTO dto) {
		return sqlSession.insert("board.insert", dto);
	}

	@Override
	public int updateBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
