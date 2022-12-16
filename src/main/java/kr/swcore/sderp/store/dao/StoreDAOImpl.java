package kr.swcore.sderp.store.dao;

import kr.swcore.sderp.store.dto.StoreDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class StoreDAOImpl implements StoreDAO{

    @Inject
    SqlSession sqlSession;

    @Override
    public List<StoreDTO> listStore(StoreDTO dto) {
        return sqlSession.selectList("store.listStore", dto);
    }

    @Override
    public int insertStore(StoreDTO dto) {
        return sqlSession.insert("store.insertStore", dto);
    }

    @Override
    public int updateStore(StoreDTO dto) {
        return sqlSession.update("store.updateStore", dto);
    }

    @Override
    public int deleteStore(StoreDTO dto) {
        return sqlSession.delete("store.deleteStore", dto);
    }
}
