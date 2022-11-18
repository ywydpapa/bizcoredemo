package kr.swcore.sderp.gw.service;

import kr.swcore.sderp.gw.dao.GwDAO;

import kr.swcore.sderp.gw.dto.GwDTO;
import kr.swcore.sderp.gw.dto.GwFileDataDTO;
import kr.swcore.sderp.util.SessionInfoGet;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@Service
public class GwServiceImpl implements GwService{

    @Inject
    GwDAO gwDao;

    @Override
    public List<GwDTO> listDoc(HttpSession session) {
    	int compNo = SessionInfoGet.getCompNo(session);
        return gwDao.listDoc(compNo);
    }

    @Override
    public List<GwDTO> listUserAtt(HttpSession session) {
        int compNo = SessionInfoGet.getCompNo(session);
        return gwDao.listUserAtt(compNo);
    }

    @Override
    public List<GwDTO> listUserAttbyuser(int userNo) {
        return gwDao.listUserAttbyuser(userNo);
    }

    @Override
    public List<GwDTO> myList(HttpSession session) {
        int docCrUserNo = SessionInfoGet.getUserNo(session);
        return gwDao.myList(docCrUserNo);
    }
    
    @Override
    public List<GwDTO> myList(HttpSession session, GwDTO dto) {
        int docCrUserNo = SessionInfoGet.getUserNo(session);
        dto.setDocCrUserNo(docCrUserNo);
        return gwDao.myList(dto);
    }
    
    @Override
    public List<GwDTO> myDocList(HttpSession session) {
    	int compNo = SessionInfoGet.getCompNo(session);
        return gwDao.myDocList(compNo);
    }
    
    @Override
    public List<GwDTO> myDocList(HttpSession session, GwDTO dto) {
    	int compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
        return gwDao.myDocList(dto);
    }

    @Override
    public List<GwDTO> listEst(HttpSession session) {
    	Integer compNo = SessionInfoGet.getCompNo(session);
        return gwDao.listEst(compNo);
    }

	@Override
	public List<GwDTO> listEst(HttpSession session, GwDTO dto) {
		Integer compNo = SessionInfoGet.getCompNo(session);
		String listDateFrom = SessionInfoGet.getlistDateFrom(session);
		dto.setListDateFrom(listDateFrom);
		dto.setCompNo(compNo);
		return gwDao.listEst(dto);
	}

    @Override
    public List<GwDTO> listEstitems(GwDTO dto) {

        return gwDao.listEstitems(dto);
    }
    
    @Override
    public List<GwDTO> titleGroupBy(GwDTO dto) {

        return gwDao.titleGroupBy(dto);
    }

    @Override
    public GwDTO detailEst(GwDTO dto) {

        return gwDao.detailEst(dto);
    }

    @Override
    public GwDTO detailDoc(int docNo) {
        return gwDao.detailDoc(docNo);
    }
    
    @Override
    public GwDTO detailDocApp(int docNo) {
        return gwDao.detailDocApp(docNo);
    }
    
    @Override
    public List<GwDTO> detailDocData(int docNo) {
        return gwDao.detailDocData(docNo);
    }

    @Override
    public GwDTO detailUserAtt(int attendId) {

        return gwDao.detailUserAtt(attendId);
    }

    @Override
    public int insertDoc(GwDTO dto) {

        return gwDao.insertDoc(dto);
    }
    
    @Override
    public int myDocCopyInsert(GwDTO dto) {
        return gwDao.myDocCopyInsert(dto);
    }
    
    @Override
    public int myDocCopyInsertApp(GwDTO dto) {
        return gwDao.myDocCopyInsertApp(dto);
    }
    
    @Override
    public int myDocCopyInsertData(GwDTO dto) {
        return gwDao.myDocCopyInsertData(dto);
    }
    
    @Override
    public int insertDocApp(GwDTO dto) {

        return gwDao.insertDocApp(dto);
    }
    
    @Override
    public int insertDocData(GwDTO dto) {

        return gwDao.insertDocData(dto);
    }

    @Override
    public int insertUserAtt(GwDTO dto) {
        return gwDao.insertUserAtt(dto);
    }

    @Override
    public int updateDoc(GwDTO dto) {
        return gwDao.updateDoc(dto);
    }
    
    @Override
    public int myDocListUpdate(GwDTO dto) {
        return gwDao.myDocListUpdate(dto);
    }
    
    @Override
    public int updateDocApp(GwDTO dto) {
        return gwDao.updateDocApp(dto);
    }
    
    @Override
    public int updateDocData(GwDTO dto) {
        return gwDao.updateDocData(dto);
    }

    @Override
    public int updateUserAtt(GwDTO dto) {
        return gwDao.updateUserAtt(dto);
    }

    @Override
    public int updateDocAppLvl(GwDTO dto) {

        return gwDao.updateDocAppLvl(dto);
    }

    @Override
    public int Attallow(GwDTO dto) {
        return gwDao.Attallow(dto);
    }

    @Override
    public int Attreject(GwDTO dto) {
        return gwDao.Attreject(dto);
    }

    @Override
    public int deleteDoc(int docNo) {

        return gwDao.deleteDoc(docNo);
    }

    @Override
    public int deleteUserAtt(int attendId) {
        return gwDao.deleteUserAtt(attendId);
    }

    @Override
    public int insertEst(GwDTO dto) {
        return gwDao.insertEst(dto);
    }
    
    @Override
    public int estInfoInsert(GwDTO dto) {
        return gwDao.estInfoInsert(dto);
    }

	@Override
	public int insertEstUpdate(HttpSession session, GwDTO dto) {
		int compNo = SessionInfoGet.getCompNo(session);
    	dto.setCompNo(compNo);
		return gwDao.insertEstUpdate(dto);
	}
    
    @Override
    public int updateEst(GwDTO dto) {
        return gwDao.updateEst(dto);
    }
    
    @Override
    public int estInfoUpdate(GwDTO dto) {
        return gwDao.estInfoUpdate(dto);
    }
    
    @Override
    public int deleteEst(String estId) {
        return gwDao.deleteEst(estId);
    }

    @Override
    public int insertEstitems(GwDTO dto) {

        return gwDao.insertEstitems(dto);
    }
    
    @Override
	public int uploadFile(HttpSession session, int docNo, MultipartHttpServletRequest fileList) throws IOException {
		MultipartFile file = fileList.getFile("file");
		GwFileDataDTO gwFile = new GwFileDataDTO();
		gwFile.setFileId(UUID.randomUUID().toString());
		gwFile.setFileName(file.getOriginalFilename());
		Path mimeType_base = Paths.get("D:/"+ file.getOriginalFilename());
		String mimeType = Files.probeContentType(mimeType_base);
		gwFile.setFileExtention(mimeType);
		gwFile.setFileSize(fileList.getParameter("fileSize"));
		gwFile.setFileContent(file.getBytes());
		gwFile.setFileDesc(fileList.getParameter("fileDesc"));
		gwFile.setDocNo(docNo);
		gwFile.setUserNo(Integer.valueOf((String)session.getAttribute("userNo")));
		
		return gwDao.uploadFile(gwFile);
	}
    
    @Override
	public int uploadFileUpdate(HttpSession session, int docNo, MultipartHttpServletRequest fileList) throws IOException {
		MultipartFile file = fileList.getFile("file");
		GwFileDataDTO gwFile = new GwFileDataDTO();
		gwFile.setFileId(UUID.randomUUID().toString());
		gwFile.setFileName(file.getOriginalFilename());
		Path mimeType_base = Paths.get("D:/"+ file.getOriginalFilename());
		String mimeType = Files.probeContentType(mimeType_base);
		gwFile.setFileExtention(mimeType);
		gwFile.setFileSize(fileList.getParameter("fileSize"));
		gwFile.setFileContent(file.getBytes());
		gwFile.setFileDesc(fileList.getParameter("fileDesc"));
		gwFile.setDocNo(docNo);
		gwFile.setUserNo(Integer.valueOf((String)session.getAttribute("userNo")));
		
		return gwDao.uploadFileUpdate(gwFile);
	}

	@Override
	public GwFileDataDTO listFile(int docNo) {
		return gwDao.listFile(docNo);
	}
	
	@Override
	public GwFileDataDTO downloadFile(GwFileDataDTO dto) {
		// TODO Auto-generated method stub
		return gwDao.downloadFile(dto);
	}

	@Override
	public List<GwDTO> getEstSopp(HttpSession session, int soppNo) {
		// TODO Auto-generated method stub
		GwDTO dto = new GwDTO();
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		dto.setSoppNo(soppNo);
		return gwDao.getEstSopp(dto);
	}

	@Override
	public GwDTO selectVersion(HttpSession session, GwDTO dto) {
		// TODO Auto-generated method stub
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return gwDao.selectVersion(dto);
	}
	
	@Override
	public GwDTO selectVersionEst(HttpSession session, GwDTO dto) {
		// TODO Auto-generated method stub
		int compNo = SessionInfoGet.getCompNo(session);
		dto.setCompNo(compNo);
		return gwDao.selectVersionEst(dto);
	}

	@Override
	public GwDTO comList(HttpSession session) {
		// TODO Auto-generated method stub
		int compNo = SessionInfoGet.getCompNo(session);
		return gwDao.comList(compNo);
	}
	
	@Override
	public GwDTO infoGetItem(GwDTO dto) {
		// TODO Auto-generated method stub
		return gwDao.infoGetItem(dto);
	}

	@Override
	public List<GwDTO> allComList(HttpSession session) {
		// TODO Auto-generated method stub
		return gwDao.allComList();
	}

	@Override
	public GwDTO allComList(int comInfoNo) {
		// TODO Auto-generated method stub
		return gwDao.allComList(comInfoNo);
	}

	@Override
	public int updateFile(GwFileDataDTO dto) {
		return gwDao.updateFile(dto);
	}

	@Override
	public void deletefile(int docNo) {
		// TODO Auto-generated method stub
		gwDao.deletefile(docNo);
	}

	@Override
	public void uploadFile2(GwFileDataDTO dto) {
		// TODO Auto-generated method stub
		gwDao.uploadFile2(dto);
	}

	@Override
	public int docDrawUpdate(GwDTO dto) {
		return gwDao.docDrawUpdate(dto);
	}

	@Override
	public int docDrawDelete(GwDTO dto) {
		return gwDao.docDrawDelete(dto);
	}

	@Override
	public int hrListApp(GwDTO dto) {
		return gwDao.hrListApp(dto);
	}
	
	@Override
	public int hrListCom(GwDTO dto) {
		return gwDao.hrListCom(dto);
	}

	@Override
	public List<GwDTO> userEmail(GwDTO dto) {
		return gwDao.userEmail(dto);
	}

	@Override
	public void update_estitems_Data(GwDTO dto) {
		// TODO Auto-generated method stub
		gwDao.update_estitems_Data(dto);
	}

	@Override
	public void update_estitems_Data_x(GwDTO dto) {
		// TODO Auto-generated method stub
		gwDao.update_estitems_Data_x(dto);
	}

	@Override
	public void update_save_data(GwDTO dto) {
		// TODO Auto-generated method stub
		gwDao.update_save_data(dto);
	}

	@Override
	public void update_amount(GwDTO dto) {
		// TODO Auto-generated method stub
		gwDao.update_amount(dto);
	}
}
