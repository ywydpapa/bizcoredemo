package kr.swcore.sderp.board.Service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import kr.swcore.sderp.HomeController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.swcore.sderp.board.dao.BoardDAO;
import kr.swcore.sderp.board.dto.BoardDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;
import kr.swcore.sderp.util.SessionInfoGet;

@Service
public class BoardServiceImpl implements BoardService {

	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);

	@Inject
	BoardDAO boardDao;

	@PostConstruct
	public void init(){
		logger.info("BoardServiceImpl Init");
	}
	
	@Override
	public List<BoardDTO> listboard() {
		// TODO Auto-generated method stub
		return boardDao.listboard();
	}
	
	@Override
	public List<BoardDTO> listboard(HttpSession session) {
		SoppDTO soppdto = SessionInfoGet.getCompNoDto(session);
		return boardDao.listboard(soppdto);
	}

	@Override
	public BoardDTO detailBoard(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(BoardDTO dto) {
		// TODO Auto-generated method stub
		return boardDao.insertBoard(dto);
	}

	@Override
	public int insertBoard(HttpSession session, BoardDTO dto) {
		Integer compNo = Integer.valueOf((String) session.getAttribute("compNo"));
		dto.setCompNo(compNo);
		
		int schedInsert = 0;
		schedInsert = boardDao.insertBoard(dto);
		
		if (schedInsert > 0) schedInsert = 10001;
		else schedInsert = 20001; 
		
		return schedInsert;
	}
	
	@Override
	public int updateBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}	
	

}
