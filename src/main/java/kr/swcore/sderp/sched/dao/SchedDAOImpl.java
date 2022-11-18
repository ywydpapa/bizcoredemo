package kr.swcore.sderp.sched.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.sched.dto.SchedDTO;

@Repository
public class SchedDAOImpl implements SchedDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<SchedDTO> listSched() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sched.listSched");
	}
	
	@Override
	public List<SchedDTO> listSched(SchedDTO dto) {
		return sqlSession.selectList("sched.listSched", dto);
	}

	@Override
	public int listSchedCnt(SchedDTO dto) {
		return sqlSession.selectOne("sched.listSchedCnt", dto);
	}

	@Override
	public List<SchedDTO> listconSched(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sched.listconSched", dto);
	}

	@Override
	public SchedDTO detailSched(int schedNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sched.detailSched", schedNo);
	}

	@Override
	public int insertSched(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sched.insertSched", dto);
	}

	@Override
	public int insertSchedauto(SchedDTO dto) {
		return sqlSession.insert("sched.insertSchedauto",dto);
	}

	@Override
	public int deleteSched(int schedNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("sched.deleteSched", schedNo);
	}

	@Override
	public int updateSched(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("sched.updateSched", dto);
	}

	@Override
	public List<SchedDTO> listSreport(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sched.listSreport", dto);
	}

	@Override
	public int insertSreport(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sched.insertSreport", dto);
	}

	@Override
	public List<SchedDTO> listMreport(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sched.listMreport", dto);
	}
	
	@Override
	public List<SchedDTO> listMreport2(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sched.listMreport2", dto);
	}

	@Override
	public SchedDTO detailAddtext(int sreportNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sched.detailAddtext", sreportNo);
	}

	@Override
	public List<SchedDTO> detailSreport(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sched.listSreport", dto);
	}

	@Override
	public SchedDTO myAddtext(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sched.myAddtext", dto);
	}
	
	@Override
	public SchedDTO myAddtext2(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sched.myAddtextNx", dto);
	}

	@Override
	public int updateSreport(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("sched.updateSreport", dto);
	}
	@Override
	public int updateSreport1(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("sched.updateSreport1", dto);
	}
	@Override
	public int updateSreport2(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("sched.updateSreport2", dto);
	}
	
	@Override
	public int insertSreport2(SchedDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sched.insertSreport2", dto);
	}

	

}
