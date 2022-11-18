package kr.swcore.sderp.gw;

import kr.swcore.sderp.gw.dto.GwDTO;

import kr.swcore.sderp.gw.dto.GwFileDataDTO;
import kr.swcore.sderp.gw.service.GwService;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/gw/*")
public class GwController {

@Inject
    GwService gwService;

    @RequestMapping("list.do")
    public ModelAndView docList(HttpSession session, ModelAndView mav) {
        mav.addObject("docList", gwService.listDoc(session));
        mav.setViewName("gware/list");
        return mav;
    }

    @RequestMapping("signpad.do")
    public ModelAndView signpad(HttpSession session, ModelAndView mav) {
        mav.setViewName("gware/signPad");
        return mav;
    }

    @RequestMapping("mylist.do")
    public ModelAndView myList(HttpSession session, ModelAndView mav,
    		@RequestParam(value = "custNo", required = false) Integer custNo,
			@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "vatSdate", required = false) String vatSdate,
			@RequestParam(value = "vatEdate", required = false) String vatEdate) 
    {
    	if(custNo != null || userName != null || vatSdate != null || vatEdate != null){
			GwDTO dto = new GwDTO();
    		if(custNo != null) dto.setCustNo(custNo);
    		if(userName != null) dto.setUserName(userName);
    		if(vatSdate != null) dto.setVatSdate(vatSdate);
    		if(vatEdate != null) dto.setVatEdate(vatEdate);
    		mav.addObject("mylist", gwService.myList(session, dto));
    	}else {
    		mav.addObject("mylist", gwService.myList(session));
    	}
    	
        mav.setViewName("gware/mylist");
        return mav;
    }
    
    @RequestMapping("mydoclist.do")
    public ModelAndView myDocList(HttpSession session, ModelAndView mav,
    		@RequestParam(value = "custNo", required = false) Integer custNo,
			@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "vatSdate", required = false) String vatSdate,
			@RequestParam(value = "vatEdate", required = false) String vatEdate,
			@RequestParam(value = "selectoption", required = false) Integer selectoption,
			@RequestParam(value = "withdraw_status", required = false) Integer withdraw_status
			) 
    {
    	if(custNo != null || userName != null || vatSdate != null || vatEdate != null || selectoption != null || withdraw_status != null){
			GwDTO dto = new GwDTO();
    		if(custNo != null) dto.setCustNo(custNo);
    		if(userName != null) dto.setUserName(userName);
    		if(vatSdate != null) dto.setVatSdate(vatSdate);
    		if(vatEdate != null) dto.setVatEdate(vatEdate);
    		if(selectoption != null) dto.setSelectoption(selectoption);
    		if(withdraw_status != null) dto.setWithdraw_status(withdraw_status);
    		
    		mav.addObject("mydoclist", gwService.myDocList(session, dto));
    	}else {
    		mav.addObject("mydoclist", gwService.myDocList(session));
    	}
        
        mav.setViewName("gware/mydoclist");
        return mav;
    }
    
    @RequestMapping("write.do")
    public ModelAndView docWrite(HttpSession session, ModelAndView mav) {
        mav.setViewName("gware/write");
        return mav;
    }
    
    @RequestMapping("detail/{docNo}")
    public ModelAndView docDetail(@PathVariable("docNo") int docNo, ModelAndView mav) {
    	mav.addObject("detailList", gwService.detailDoc(docNo));
    	mav.addObject("detailListApp", gwService.detailDocApp(docNo));
    	mav.addObject("detailListData", gwService.detailDocData(docNo));
    	mav.addObject("detailFile", gwService.listFile(docNo));
        mav.setViewName("gware/detail");
        return mav;
    }

    @RequestMapping("attlist.do")
    public ModelAndView hrdocList(HttpSession session, ModelAndView mav) {
        mav.addObject("list",gwService.listUserAtt(session));
        mav.setViewName("hr/attlist");
        return mav;
    }

    @RequestMapping("attdetail/{attendId}")
    public ModelAndView hrdocDetail(@PathVariable("attendId") int attendId, ModelAndView mav) {
        mav.addObject("list", gwService.detailUserAtt(attendId));
        mav.setViewName("hr/attdetail");
        return mav;
    }

    @RequestMapping("attwrite.do")
    public ModelAndView hrdocWrite(HttpSession session, ModelAndView mav) {
        mav.setViewName("hr/attwrite");
        return mav;
    }
    
    @ResponseBody
    @RequestMapping("selectVersion.do")
    public GwDTO selectVersion(HttpSession session, ModelAndView mav, @ModelAttribute GwDTO dto) 
    {
    	GwDTO getVersion = gwService.selectVersion(session, dto);
    	
    	return getVersion;
    }
    
    @ResponseBody
    @RequestMapping("selectVersionEst.do")
    public GwDTO selectVersionEst(HttpSession session, ModelAndView mav, @ModelAttribute GwDTO dto) 
    {
    	GwDTO getVersion = gwService.selectVersionEst(session, dto);
    	
    	return getVersion;
    }
    
    @ResponseBody
    @RequestMapping("selectComInfo/{comInfoNo}")
    public GwDTO selectVersionEst(@PathVariable("comInfoNo") int comInfoNo) 
    {
    	GwDTO allComList = gwService.allComList(comInfoNo);
    	
    	return allComList;
    }

    @RequestMapping("estlist.do")
    public ModelAndView estList(HttpSession session, ModelAndView mav,
    							@RequestParam(value = "custNo", required = false) Integer custNo,
    							@RequestParam(value = "userName", required = false) String userName) 
    {
    	if(custNo != null || userName != null){
    		GwDTO dto = new GwDTO();
    		if(custNo != null) dto.setCustNo(custNo);
    		if(userName != null) dto.setUserName(userName);
    		mav.addObject("list", gwService.listEst(session, dto));
    	}else {
    		GwDTO dto = new GwDTO();
    		mav.addObject("list", gwService.listEst(session, dto));
    	}
    	
        mav.setViewName("gware/estlist");
        return mav;
    }

    @RequestMapping("estwrite.do")
    public ModelAndView estwrite(HttpSession session, ModelAndView mav) {
    	mav.addObject("comList", gwService.comList(session));
    	mav.addObject("allComList", gwService.allComList(session));
    	mav.setViewName("gware/estwrite");
        return mav;
    }

    @RequestMapping("estdetail/{estId}/{estVer}")
    public ModelAndView estdetail(@PathVariable String estId, @PathVariable int estVer, HttpSession session, ModelAndView mav, GwDTO dto) {
        mav.setViewName("gware/estdetail");
        mav.addObject("detail",gwService.detailEst(dto));
        mav.addObject("list", gwService.listEstitems(dto));
        mav.addObject("infoItem", gwService.infoGetItem(dto));
        mav.addObject("comList", gwService.comList(session));
        mav.addObject("allComList", gwService.allComList(session));
        return mav;
    }
    
    @RequestMapping("estPdf/{estId}/{estVer}")
    public ModelAndView estPdf(HttpSession session, ModelAndView mav, GwDTO dto) {
    	mav.setViewName("form/estPdf");
    	mav.addObject("detail",gwService.detailEst(dto));
        mav.addObject("list",gwService.listEstitems(dto));
        mav.addObject("titleList", gwService.titleGroupBy(dto));
        mav.addObject("comList", gwService.comList(session));
        mav.addObject("infoItem", gwService.infoGetItem(dto));
    	return mav;
    }
    
    @RequestMapping("ordForm/{docNo}")
    public ModelAndView ordForm(@PathVariable("docNo") int docNo, HttpSession session, ModelAndView mav, GwDTO dto) {
    	mav.addObject("detailList", gwService.detailDoc(docNo));
    	mav.addObject("detailListApp", gwService.detailDocApp(docNo));
    	mav.addObject("detailListData", gwService.detailDocData(docNo));
    	mav.addObject("comList", gwService.comList(session));
        mav.setViewName("form/ordForm");
    	return mav;
    }
    
    @RequestMapping("purForm/{docNo}")
    public ModelAndView purForm(@PathVariable("docNo") int docNo, HttpSession session, ModelAndView mav, GwDTO dto) {
    	mav.addObject("detailList", gwService.detailDoc(docNo));
    	mav.addObject("detailListApp", gwService.detailDocApp(docNo));
    	mav.addObject("detailListData", gwService.detailDocData(docNo));
    	mav.addObject("comList", gwService.comList(session));
        mav.setViewName("form/purForm");
    	return mav;
    }
    
    @RequestMapping("treqForm/{docNo}")
    public ModelAndView treqForm(@PathVariable("docNo") int docNo, HttpSession session, ModelAndView mav, GwDTO dto) {
    	mav.addObject("detailList", gwService.detailDoc(docNo));
    	mav.addObject("detailListApp", gwService.detailDocApp(docNo));
    	mav.addObject("detailListData", gwService.detailDocData(docNo));
    	mav.addObject("comList", gwService.comList(session));
        mav.setViewName("form/treqForm");
    	return mav;
    }
    
    @RequestMapping("update.do")
    public  ResponseEntity<?> update(@ModelAttribute GwDTO dto) {
         Map<String, Object> param = new HashMap<>();
         int docUpdate = gwService.updateDoc(dto);
         if (docUpdate >0) {
             param.put("code","10001");
         } else {
             param.put("code","20001");
         }
         return ResponseEntity.ok(param);
    }
    
    @RequestMapping("docDrawUpdate.do")
    public  ResponseEntity<?> docDrawUpdate(@ModelAttribute GwDTO dto) {
         Map<String, Object> param = new HashMap<>();
         int docUpdate = gwService.docDrawUpdate(dto);
         if (docUpdate >0) {
             param.put("code","10001");
         } else {
             param.put("code","20001");
         }
         return ResponseEntity.ok(param);
    }
    
    @RequestMapping("docDrawDelete.do")
    public  ResponseEntity<?> docDrawDelete(@ModelAttribute GwDTO dto) {
         Map<String, Object> param = new HashMap<>();
         int docUpdate = gwService.docDrawDelete(dto);
         if (docUpdate >0) {
             param.put("code","10001");
         } else {
             param.put("code","20001");
         }
         return ResponseEntity.ok(param);
    }
    
    @RequestMapping("myDocListUpdate.do")
    public  ResponseEntity<?> myDocListUpdate(@ModelAttribute GwDTO dto) {
         Map<String, Object> param = new HashMap<>();
         int docUpdate = gwService.myDocListUpdate(dto);
         if (docUpdate >0) {
             param.put("code","10001");
         } else {
             param.put("code","20001");
         }
         return ResponseEntity.ok(param);
    }

    @RequestMapping("insert.do")
    public ResponseEntity<?> insert(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docInsert = gwService.insertDoc(dto);
        param.put("getId", dto.getGetId());
        if (docInsert >0) {
            param.put("code","10001");
        }
        	else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @ResponseBody
    @RequestMapping("myDocCopyInsert.do")
    public int myDocCopyInsert(@ModelAttribute GwDTO dto, GwFileDataDTO dtoa) throws InterruptedException {
        gwService.myDocCopyInsert(dto);
        System.out.println("dto.getGetId() ===============================" + dto.getGetId());
        System.out.println(dto.getDocNo());
        dtoa.setDocNo(dto.getDocNo());
        dtoa.setUpdateNo(dto.getGetId());
        int estUpdate = gwService.updateFile(dtoa);
        
        return dto.getGetId();
    }
    
    @RequestMapping("myDocCopyInsertApp.do")
    public ResponseEntity<?> myDocCopyInsertApp(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docInsert = gwService.myDocCopyInsertApp(dto);
        if (docInsert >0) {
            param.put("code","10001");
        }
        	else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("myDocCopyInsertData.do")
    public ResponseEntity<?> myDocCopyInsertData(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docInsert = gwService.myDocCopyInsertData(dto);
        if (docInsert >0) {
            param.put("code","10001");
        }
        	else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("attinsert.do")
    public ResponseEntity<?> attinsert(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docInsert = gwService.insertUserAtt(dto);
        if (docInsert >0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    
    @RequestMapping("insertApp.do")
    public ResponseEntity<?> insertApp(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docInsert = gwService.insertDocApp(dto);
        if (docInsert >0) {
            param.put("code","10001");
        }
        	else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("insertData.do")
    public ResponseEntity<?> insertData(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docInsert = gwService.insertDocData(dto);
        if (docInsert >0) {
            param.put("code","10001");
        }
        	else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("insertData1.do")
    public ResponseEntity<?> insertData1(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        System.out.println("        dto.getDocAmount()" +         dto.getDocAmount());
        
        gwService.update_amount(dto);
        
        
        
        return ResponseEntity.ok(param);
    }
    
   @RequestMapping("updateApp.do")
   public  ResponseEntity<?> updateDocApp(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docUpdate = gwService.updateDocApp(dto);
        if (docUpdate >0) {
            param.put("code","10001");
        } else {
            param.put("code","20001");
        }
        return ResponseEntity.ok(param);
   }
   
   @RequestMapping("updateData.do")
   public ResponseEntity<?> updateDocData(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int docUpdate = gwService.updateDocData(dto);
        if (docUpdate >0) {
            param.put("code","10001");
        } else {
            param.put("code","20001");
        }
        return ResponseEntity.ok(param);
   }


    @RequestMapping("delete/{docNo}")
    public  ResponseEntity<?> delete(@PathVariable("docNo") int docNo) {
        Map<String, Object> param = new HashMap<>();
        int docDelete = gwService.deleteDoc(docNo);
        if (docDelete >0) {
            param.put("code","10001");
        } else {
            param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("insertEst.do")
    public ResponseEntity<?> insertEst(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int estInsert = gwService.insertEst(dto);
        param.put("getId", dto.getGetId());
        if (estInsert >0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("estInfoInsert.do")
    public ResponseEntity<?> estInfoInsert(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int estInfoInsert = gwService.estInfoInsert(dto);
        if (estInfoInsert >0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("update_estitems_Data.do")
    public ResponseEntity<?> update_estitems_Data(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        gwService.update_estitems_Data(dto);
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("update_estitems_Data_x.do")
    public ResponseEntity<?> update_estitems_Data_x(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        gwService.update_estitems_Data_x(dto);
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("estInfoUpdate.do")
    public ResponseEntity<?> estInfoUpdate(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int estInfoUpdate = gwService.estInfoUpdate(dto);
        if (estInfoUpdate > 0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("inserEstUpdate.do")
    public  ResponseEntity<?> inserEstUpdate(HttpSession session, @ModelAttribute GwDTO dto) {
         Map<String, Object> param = new HashMap<>();
         int estInserUpdate = gwService.insertEstUpdate(session, dto);
         if (estInserUpdate > 0) {
             param.put("code","10001");
         } else {
             param.put("code","20001");
         }
         return ResponseEntity.ok(param);
    }
    
    @RequestMapping("updateEst.do")
    public  ResponseEntity<?> updateEst(@ModelAttribute GwDTO dto) {
         Map<String, Object> param = new HashMap<>();
         int estUpdate = gwService.updateEst(dto);
         if (estUpdate >0) {
             param.put("code","10001");
         } else {
             param.put("code","20001");
         }
         return ResponseEntity.ok(param);
    }
    
    @RequestMapping("deleteEst/{estId}")
    public  ResponseEntity<?> deleteEst(@PathVariable("estId") String estId) {
        Map<String, Object> param = new HashMap<>();
        int docDelete = gwService.deleteEst(estId);
        if (docDelete >0) {
            param.put("code","10001");
        } else {
            param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("attallow.do")
    public ResponseEntity<?> attallow(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int allow = gwService.Attallow(dto);
        if (allow >0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("attreject.do")
    public ResponseEntity<?> attreject(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int allow = gwService.Attreject(dto);
        if (allow >0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }

    @RequestMapping("insertEstitems.do")
    public ResponseEntity<?> insertEstitems(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int itemInsert = gwService.insertEstitems(dto);
        if (itemInsert >0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("/uploadfile/{docNo}")
	public ResponseEntity<?> uploadFile(HttpSession session, @PathVariable("docNo") int docNo,  MultipartHttpServletRequest fileList) throws IOException {
		int uploadFile = gwService.uploadFile(session, docNo, fileList);
		Map<String, Object> param = new HashMap<>();
		if(uploadFile > 0) {
			param.put("code", "10001");
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}
    
    @RequestMapping("/uploadfile2/{docNo}/{lastdocNo}")
	public void uploadFile2(@PathVariable("docNo") int docNo, @PathVariable("lastdocNo") int lastdocNo, GwFileDataDTO dto){
    	dto.setDocNo(docNo);
    	dto.setLastdocNo(lastdocNo);
    	System.out.println(dto.getDocNo());
    	System.out.println(dto.getLastdocNo());
		gwService.uploadFile2(dto);	
	}
    
    @RequestMapping("/deleteoldfile/{docNo}")
	public void uploadFile2(@PathVariable("docNo") int docNo){
    	gwService.deletefile(docNo);
	}
    
    @RequestMapping("/uploadfileUpdate/{docNo}")
	public ResponseEntity<?> uploadfileUpdate(HttpSession session, @PathVariable("docNo") int docNo, MultipartHttpServletRequest fileList) throws IOException {
    	gwService.deletefile(docNo);
		int uploadFile = gwService.uploadFile(session, docNo, fileList);
		Map<String, Object> param = new HashMap<>();
		if(uploadFile > 0) {
			param.put("code", "10001");
		} else {
			param.put("code", "20001");
		}
		return ResponseEntity.ok(param);
	}
    
    @RequestMapping("/downloadfile")
	public ResponseEntity<?> downloadFile(HttpSession session, HttpServletResponse response, @ModelAttribute GwFileDataDTO dto) throws IOException {
    	GwFileDataDTO gwFile = gwService.downloadFile(dto);
		String fileName = gwFile.getFileName();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.add("Content-Disposition", new String(fileName.getBytes("UTF-8"), "ISO-8859-1"));
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(gwFile.getFileContent(), headers, HttpStatus.OK);
		
		return entity;
	}
    
    @RequestMapping("updateFile.do")
    public  ResponseEntity<?> updateFile(@ModelAttribute GwFileDataDTO dto) {
         Map<String, Object> param = new HashMap<>();
         int estUpdate = gwService.updateFile(dto);
         if (estUpdate >0) {
             param.put("code","10001");
         } else {
             param.put("code","20001");
         }
         return ResponseEntity.ok(param);
    }
    
    @RequestMapping("hrListApp.do")
    public ResponseEntity<?> hrListApp(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int itemUpdate = gwService.hrListApp(dto);
        if (itemUpdate >0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("hrListCom.do")
    public ResponseEntity<?> hrListCom(@ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        int itemUpdate = gwService.hrListCom(dto);
        if (itemUpdate >0) {
            param.put("code","10001");
        }
        else {param.put("code","20001");
        }
        return ResponseEntity.ok(param);
    }
    
    @RequestMapping("user_email.do")
    public ResponseEntity<?> user_email(HttpSession session, @ModelAttribute GwDTO dto) {
        Map<String, Object> param = new HashMap<>();
        List<GwDTO> userEmail = gwService.userEmail(dto);
        param.put("data", userEmail);
        
        return ResponseEntity.ok(param);
    }
    //update_save_data
    @RequestMapping("update_save_data.do")
    public  ResponseEntity<?>  update_save_data(HttpSession session, @ModelAttribute GwDTO dto) {
    	Map<String, Object> param = new HashMap<>();
    	
    	gwService.update_save_data(dto);
    
    	return ResponseEntity.ok(param);
    }
}
