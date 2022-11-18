package kr.swcore.sderp.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.board_file.dto.Board_fileDTO;
import kr.swcore.sderp.notice.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<NoticeDTO> listNotice() {
		return sqlSession.selectList("notice.listNotice");
	}

	@Override
	public List<NoticeDTO> listNotice(NoticeDTO dto) {
		return sqlSession.selectList("notice.listNotice", dto);
	}

	@Override
	public int listNoticeCnt(NoticeDTO dto) {
		return sqlSession.selectOne("notice.listNoticeCnt", dto);
	}

	@Override
	public int insertNotice(NoticeDTO dto) {
		return sqlSession.insert("notice.insertNotice",dto);
	}

	@Override
	public NoticeDTO detailNotice(int notiNo) {
		return sqlSession.selectOne("notice.detailNotice", notiNo);
	}

	@Override
	public int updateNotice(NoticeDTO dto) {
		return sqlSession.update("notice.updateNotice",dto);
	}

	@Override
	public int deleteNotice(int notiNo) {
		return sqlSession.delete("notice.deleteNotice",notiNo);
	}

	@Override
	public List<Board_fileDTO> listNotice1(Board_fileDTO dto) {
		return sqlSession.selectList("notice.listNotice1", dto);
	}

	@Override
	public int listNoticeCnt1(Board_fileDTO dto) {
		return sqlSession.selectOne("notice.listNoticeCnt1", dto);
	}
	
}
