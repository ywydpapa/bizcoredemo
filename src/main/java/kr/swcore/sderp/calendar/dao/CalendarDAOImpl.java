package kr.swcore.sderp.calendar.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.calendar.dto.CalendarDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

@Repository
public class CalendarDAOImpl implements CalendarDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<CalendarDTO> listEvent() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("calendar.listEvent");
	}
	
	@Override
	public List<CalendarDTO> listEvent(CalendarDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("calendar.listEvent", dto);
	}

	@Override
	public CalendarDTO detailEvent(int eventNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("calendar.detailEvent", eventNo);
	}

	@Override
	public int deleteEvent(int eventNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("calendar.deleteEvent",eventNo);
	}

}
