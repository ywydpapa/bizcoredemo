package kr.swcore.sderp.gw.service;

import kr.swcore.sderp.gw.dto.GwDTO;
import kr.swcore.sderp.gw.dto.GwFileDataDTO;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;
import java.util.List;

public interface GwService {
    List<GwDTO> listDoc(HttpSession session);
    List<GwDTO> listUserAtt(HttpSession session);
    List<GwDTO> listUserAttbyuser(int userNo);
    List<GwDTO> myList(HttpSession session);
    List<GwDTO> myList(HttpSession session, GwDTO dto);
    List<GwDTO> myDocList(HttpSession session);
    List<GwDTO> myDocList(HttpSession session, GwDTO dto);
    List<GwDTO> listEst(HttpSession session);
    List<GwDTO> listEst(HttpSession session, GwDTO dto);
    List<GwDTO> listEstitems(GwDTO dto);
    List<GwDTO> titleGroupBy(GwDTO dto);
    GwDTO detailEst(GwDTO dto);
    GwDTO infoGetItem(GwDTO dto);
    GwDTO detailDoc(int docNo);
    GwDTO detailDocApp(int docNo);
    List<GwDTO> detailDocData(int docNo);
    GwDTO detailUserAtt(int attendId);
    int insertDoc(GwDTO dto);
    int myDocCopyInsert(GwDTO dto);
    int myDocCopyInsertApp(GwDTO dto);
    int myDocCopyInsertData(GwDTO dto);
    int insertDocApp(GwDTO dto);
    int insertDocData(GwDTO dto);
    int insertUserAtt(GwDTO dto);
    int updateDoc(GwDTO dto);
    int myDocListUpdate(GwDTO dto);
    int updateDocApp(GwDTO dto);
    int updateDocData(GwDTO dto);
    int updateUserAtt(GwDTO dto);
    int updateDocAppLvl(GwDTO dto);
    int Attallow(GwDTO dto);
    int Attreject(GwDTO dto);
    int deleteDoc(int docNo);
    int deleteUserAtt(int attendId);
    int insertEst(GwDTO dto);
    int estInfoInsert(GwDTO dto);
    int insertEstUpdate(HttpSession session, GwDTO dto);
    int updateEst(GwDTO dto);
    int estInfoUpdate(GwDTO dto);
    int deleteEst(String estId);
    int insertEstitems(GwDTO dto);
    int uploadFile(HttpSession session, int docNo, MultipartHttpServletRequest fileList) throws IOException;
    int uploadFileUpdate(HttpSession session, int docNo, MultipartHttpServletRequest fileList) throws IOException;
    GwFileDataDTO listFile(int docNo);
    GwFileDataDTO downloadFile(GwFileDataDTO dto);
    List<GwDTO> getEstSopp(HttpSession session, int soppNo);
    GwDTO selectVersion(HttpSession session, GwDTO dto);
    GwDTO selectVersionEst(HttpSession session, GwDTO dto);
    GwDTO comList(HttpSession session);
    List<GwDTO> allComList(HttpSession session);
    GwDTO allComList(int comInfoNo);
    int updateFile(GwFileDataDTO dto);
	void deletefile(int docNo);
	void uploadFile2(GwFileDataDTO dto);
	int docDrawUpdate(GwDTO dto);
	int docDrawDelete(GwDTO dto);
	
	int hrListApp(GwDTO dto);
	int hrListCom(GwDTO dto);
	List<GwDTO> userEmail(GwDTO dto);
	void update_estitems_Data(GwDTO dto);
	void update_estitems_Data_x(GwDTO dto);
	void update_save_data(GwDTO dto);
	void update_amount(GwDTO dto);
}
