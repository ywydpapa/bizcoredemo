package kr.swcore.sderp.allim;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.swcore.sderp.allim.dto.AllimDTO;
import kr.swcore.sderp.allim.service.AllimService;

@Controller
@RequestMapping("/allim/*")
public class AllimController {
	@Inject
	AllimService allimService; 
	
	@RequestMapping("insertAllim.do")
    public ResponseEntity<Object> insertAllim(HttpSession session, @ModelAttribute AllimDTO dto){
        Map<String,Object> param = new HashMap<>();
        int allimIns = allimService.insertAllim(dto);
        if(allimIns > 0){
            param.put("code","10001");
        }
        else {
            param.put("code", "20001");
        }
        return ResponseEntity.ok(param);
    }
	
	@RequestMapping("allimReadUpdate.do")
    public  ResponseEntity<?> allimReadUpdate(@ModelAttribute AllimDTO dto) {
         Map<String, Object> param = new HashMap<>();
         int allimUpdate = allimService.allimReadUpdate(dto);
         if (allimUpdate >0) {
             param.put("code","10001");
         } else {
             param.put("code","20001");
         }
         return ResponseEntity.ok(param);
    }
	
	@ResponseBody
    @RequestMapping("timeAllimSelect.do")
    public List<AllimDTO> timeAllimSelect(@ModelAttribute AllimDTO dto)
    {
		List<AllimDTO> allimList = allimService.timeAllimSelect(dto);
		
        return allimList;
    }
}
