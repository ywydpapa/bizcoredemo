package kr.swcore.sderp.store.service;

import kr.swcore.sderp.store.dto.StoreDTO;

import javax.servlet.http.HttpSession;
import java.util.List;
public interface StoreService {

    List<StoreDTO> listStore(HttpSession session,StoreDTO dto);

    int insertStore(HttpSession session, StoreDTO dto);

    int updateStgore(StoreDTO dto);

    int deleteStgore(StoreDTO dto);

	StoreDTO storeDetail(int storeNo);


}
