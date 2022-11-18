package kr.swcore.sderp.sales.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.swcore.sderp.sales.dto.SalesDTO;
import kr.swcore.sderp.sopp.dto.SoppDTO;

@Repository
public class SalesDAOImpl implements SalesDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<SalesDTO> listSales() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.listSales");
	}
	
	@Override
	public List<SalesDTO> listSales(SoppDTO soppDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.listSales", soppDto);
	}

	@Override
	public List<SalesDTO> listSales(SalesDTO dto) {
		return sqlSession.selectList("sales.listSales", dto);
	}

	@Override
	public int listSalesCnt(SalesDTO dto) {
		return sqlSession.selectOne("sales.listSalesCnt", dto);
	}

	@Override
	public List<SalesDTO> listconSales(SalesDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.listconSales", dto);
	}

	@Override
	public SalesDTO detailSales(int salesNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sales.detailSales", salesNo);
	}

	@Override
	public int updateSales(SalesDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("sales.updateSales",dto);
	}

	@Override
	public int deleteSales(int salesNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("sales.deleteSales",salesNo);
	}

	@Override
	public int insertSales(SalesDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("sales.insertSales",dto);
	}

	@Override
	public List<SalesDTO> listSalesinsopp(SoppDTO soppDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.listSalesinsopp", soppDto);
	}
}
