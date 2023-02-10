package kr.swcore.sderp.store.service;

import kr.swcore.sderp.product.dto.ProductDTO;
import kr.swcore.sderp.store.dto.StoreDTO;
import kr.swcore.sderp.store.dao.StoreDAO;
import kr.swcore.sderp.util.SessionInfoGet;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class StoreServiceImpl implements StoreService{

    @Inject
    StoreDAO storeDao;

    @Override
    public List<StoreDTO> listStore(HttpSession session, StoreDTO dto) {
        Integer compNo = SessionInfoGet.getCompNo(session);
        dto.setCompNo(compNo);
        return storeDao.listStore(dto);
    }

    @Override
    public int insertStore(HttpSession session, StoreDTO dto) {
        Integer compNo = SessionInfoGet.getCompNo(session);
        Integer userNo = SessionInfoGet.getUserNo(session);
        dto.setCompNo(compNo);
        dto.setUserNo(userNo);
        return storeDao.insertStore(dto);
    }

    @Override
    public int updateStore(HttpSession session,StoreDTO dto) {
        return storeDao.updateStore(dto);
    }

    @Override
    public int deleteStore(HttpSession session, StoreDTO dto) {
        return storeDao.deleteStore(dto);
    }

	@Override
	public StoreDTO storeDetail(int storeNo) {
	    return storeDao.getDetail(storeNo);
	
	}

	
	
}
