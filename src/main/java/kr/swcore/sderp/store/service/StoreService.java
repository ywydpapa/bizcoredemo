package kr.swcore.sderp.store.service;

import kr.swcore.sderp.store.dto.StoreDTO;

import javax.servlet.http.HttpSession;
import java.util.List;
public interface StoreService {

    List<StoreDTO> listStore(HttpSession session,StoreDTO dto);

    int insertStore(HttpSession session, StoreDTO dto);

    List<StoreDTO> storeDetail(int storeNo);

	int updateStore(HttpSession session, StoreDTO dto);

	int deleteStore(HttpSession session, StoreDTO dto);

	List<StoreDTO> storeList(HttpSession session, StoreDTO dto);

	int insertStore2(HttpSession session, StoreDTO storeDto);

	int getLastStoreNo(HttpSession session, StoreDTO storeDto);

	int getStoreNo(HttpSession session, int productNo);

	int getCount(int productNo);

	int checkSerial(StoreDTO dto);


}
 