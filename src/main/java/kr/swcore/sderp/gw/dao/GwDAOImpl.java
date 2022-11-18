package kr.swcore.sderp.gw.dao;

import kr.swcore.sderp.gw.dto.GwDTO;
import kr.swcore.sderp.gw.dto.GwFileDataDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.List;

@Repository
public class GwDAOImpl implements GwDAO{

    @Inject
    SqlSession sqlSession;

    @Override
    public List<GwDTO> listDoc(int compNo) {
        return sqlSession.selectList("gw.listDoc", compNo);
    }

    @Override
    public List<GwDTO> listUserAtt(int compNo) {
        return sqlSession.selectList("gw.listUserAtt", compNo);
    }

    @Override
    public List<GwDTO> listUserAttbyuser(int userNo) {
        return sqlSession.selectList("gw.listUserAttbyuser", userNo);
    }

    @Override
    public List<GwDTO> myList(int docCrUserNo) {
        return sqlSession.selectList("gw.myList", docCrUserNo);
    }
    
    @Override
    public List<GwDTO> myList(GwDTO dto) {
        return sqlSession.selectList("gw.mySearchList", dto);
    }
    
    @Override
    public List<GwDTO> myDocList(int compNo) {
        return sqlSession.selectList("gw.myDocList", compNo);
    }
    
    @Override
    public List<GwDTO> myDocList(GwDTO dto) {
        return sqlSession.selectList("gw.myDocSerchList", dto);
    }

    @Override
    public List<GwDTO> listEst(Integer compNo) {
        return sqlSession.selectList("gw.listest", compNo);
    }
    
    @Override
    public List<GwDTO> listEst(GwDTO dto) {
        return sqlSession.selectList("gw.listsearchest", dto);
    }

    @Override
    public List<GwDTO> listEstitems(GwDTO dto) {
        return sqlSession.selectList("gw.listestitems", dto);
    }
    
    @Override
    public List<GwDTO> titleGroupBy(GwDTO dto) {
        return sqlSession.selectList("gw.titleGroupBy", dto);
    }

    @Override
    public GwDTO detailEst(GwDTO dto) {
        return sqlSession.selectOne("gw.detailest", dto);
    }

    @Override
    public GwDTO detailUserAtt(int attendId) {
        return sqlSession.selectOne("gw.detailUserAtt", attendId);
    }

    @Override
    public GwDTO detailDoc(int docNo) {
        return sqlSession.selectOne("gw.detailDoc", docNo);
    }
    
    @Override
    public GwDTO detailDocApp(int docNo) {
        return sqlSession.selectOne("gw.detailDocApp", docNo);
    }
    
    @Override
    public List<GwDTO> detailDocData(int docNo) {
        return sqlSession.selectList("gw.detailDocData", docNo);
    }

    @Override
    public int insertDoc(GwDTO dto) {
        return sqlSession.insert("gw.insertDoc",dto);
    }
    
    @Override
    public int myDocCopyInsert(GwDTO dto) {
        return sqlSession.insert("gw.myDocCopyInsert", dto);
    }
    
    @Override
    public int myDocCopyInsertApp(GwDTO dto) {
        return sqlSession.insert("gw.myDocCopyInsertApp", dto);
    }
    
    @Override
    public int myDocCopyInsertData(GwDTO dto) {
        return sqlSession.insert("gw.myDocCopyInsertData", dto);
    }
    
    @Override
    public int insertDocApp(GwDTO dto) {
        return sqlSession.insert("gw.insertDocApp",dto);
    }
    
    @Override
    public int insertDocData(GwDTO dto) {
        return sqlSession.insert("gw.insertDocData",dto);
    }

    @Override
    public int insertUserAtt(GwDTO dto) {
        return sqlSession.insert("gw.insertUserAtt",dto);
    }

    @Override
    public int updateDoc(GwDTO dto) {
        return sqlSession.update("gw.updateDoc",dto);
    }
    
    @Override
    public int myDocListUpdate(GwDTO dto) {
        return sqlSession.update("gw.myDocListUpdate",dto);
    }

    @Override
    public int updateDocApp(GwDTO dto) {
        return sqlSession.update("gw.updateDocApp",dto);
    }
    
    @Override
    public int updateDocData(GwDTO dto) {
        return sqlSession.update("gw.updateDocData",dto);
    }
    
    @Override
    public int updateUserAtt(GwDTO dto) {
        return sqlSession.update("gw.updateUserAtt", dto);
    }

    @Override
    public int updateDocAppLvl(GwDTO dto) {
        return sqlSession.update("gw.updateDocAppLvl", dto);
    }

    @Override
    public int Attallow(GwDTO dto) {
        return sqlSession.update("gw.Attallow", dto);
    }

    @Override
    public int Attreject(GwDTO dto) {
        return  sqlSession.update("gw.Attreject", dto);
    }

    @Override
    public int deleteDoc(int docNo) {
        return sqlSession.update("gw.deleteDoc",docNo);
    }

    @Override
    public int deleteUserAtt(int attendId) {
        return sqlSession.update("gw.deleteUserAtt", attendId);
    }

    @Override
    public int insertEst(GwDTO dto) {
        return sqlSession.insert("gw.insertest",dto);
    }
    
    @Override
    public int estInfoInsert(GwDTO dto) {
        return sqlSession.insert("gw.estInfoInsert",dto);
    }
    
    @Override
    public int insertEstUpdate(GwDTO dto) {
        return sqlSession.update("gw.insertEstUpdate", dto);
    }
    
    @Override
    public int updateEst(GwDTO dto) {
        return sqlSession.update("gw.updateest",dto);
    }
    
    @Override
    public int estInfoUpdate(GwDTO dto) {
        return sqlSession.update("gw.estInfoUpdate",dto);
    }
    
    @Override
    public int deleteEst(String estId) {
        return sqlSession.update("gw.deleteest", estId);
    }

    @Override
    public int insertEstitems(GwDTO dto) {
        return sqlSession.insert("gw.insertestitems",dto);
    }
    
    @Override
	public int uploadFile(GwFileDataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("gw.uploadFile", dto);
	}
    
    @Override
	public int uploadFileUpdate(GwFileDataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("gw.uploadFileUpdate", dto);
	}

    @Override
	public GwFileDataDTO listFile(int docNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("gw.listFile", docNo);
	}
    
    @Override
	public GwFileDataDTO downloadFile(GwFileDataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("gw.downloadFile", dto);
	}

	@Override
	public List<GwDTO> getEstSopp(GwDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("gw.getEstSopp", dto);
	}

	@Override
	public GwDTO selectVersion(GwDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("gw.selectVersion", dto);
	}
	
	@Override
	public GwDTO selectVersionEst(GwDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("gw.selectVersionEst", dto);
	}

	@Override
	public GwDTO comList(int compNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("gw.comList", compNo);
	}

	@Override
	public GwDTO infoGetItem(GwDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("gw.infoGetItem", dto);
	}

	@Override
	public List<GwDTO> allComList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("gw.allComList");
	}

	@Override
	public GwDTO allComList(int comInfoNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("gw.allComList", comInfoNo);
	}

	@Override
	public int updateFile(GwFileDataDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("gw.updateFile", dto);
	}

	@Override
	public void deletefile(int docNo) {
		// TODO Auto-generated method stub
		sqlSession.delete("gw.deletefile", docNo);
	}

	@Override
	public void uploadFile2(GwFileDataDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("gw.uploadFile2", dto);
	}

	@Override
	public int docDrawUpdate(GwDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("gw.docDrawUpdate", dto);
	}

	@Override
	public int docDrawDelete(GwDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("gw.docDrawDelete", dto);
	}

	@Override
	public int hrListApp(GwDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("gw.hrListApp", dto);
	}
	
	@Override
	public int hrListCom(GwDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("gw.hrListCom", dto);
	}

	@Override
	public List<GwDTO> userEmail(GwDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("gw.userEmail", dto);
	}

	@Override
	public void update_estitems_Data(GwDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("gw.update_estitems_Data", dto);
	}

	@Override
	public void update_estitems_Data_x(GwDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("gw.update_estitems_Data_x", dto);
	}

	@Override
	public void update_save_data(GwDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("gw.update_save_data", dto);
	}

	@Override
	public void update_amount(GwDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.update("gw.update_amount", dto);
	}
}
