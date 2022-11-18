package kr.swcore.sderp.sopp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.sopp.dto.SoppdataDTO;

@Repository
public class SoppdataDAOImpl implements SoppdataDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<SoppdataDTO> listSoppdata01(int soppNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSoppdata01", soppNo);
	}

	@Override
	public int deleteSoppdata01(int soppdataNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("sopp.deleteSoppdata01", soppdataNo);
	}

	@Override
	public int insertSoppdata01(SoppdataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sopp.insertSoppdata01",dto);
	}

	@Override
	public List<SoppdataDTO> listSoppdata02(int soppNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sopp.listSoppdata02",soppNo);
	}

}
