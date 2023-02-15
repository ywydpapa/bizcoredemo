package kr.swcore.sderp.store.service;

import kr.swcore.sderp.store.dto.StoreInoutDTO;

import javax.servlet.http.HttpSession;
import java.util.List;
public interface StoreInoutService {

    List<StoreInoutDTO> listStore(HttpSession session,StoreInoutDTO dto);

    int insertInoutStore(StoreInoutDTO dto);

    List<StoreInoutDTO> storeDetail(int prodcutNo);

	int updateStore(HttpSession session, StoreInoutDTO dto);

	int deleteStore(HttpSession session, StoreInoutDTO dto);

	List<StoreInoutDTO> getInoutStoreList(int prodcutNo);

	List<StoreInoutDTO> getAllList(HttpSession session, StoreInoutDTO dto);


}
 