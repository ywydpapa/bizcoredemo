package kr.swcore.sderp.salesTarget.service;

import kr.swcore.sderp.code.dto.CodeDTO;
import kr.swcore.sderp.code.service.CodeService;
import kr.swcore.sderp.salesTarget.dao.SalesTargetDAO;
import kr.swcore.sderp.salesTarget.dto.SalesTargetDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;

@Service
public class SalesTargetGraph_Static {

    @Inject
    SalesTargetDAO salesTargetDAO;
    static SalesTargetDAO salesTargetDAOStatic;

    @Inject
    CodeService codeService;
    static CodeService codeServiceStatic;

    private static final Logger logger = LoggerFactory.getLogger(SalesTargetGraph_Static.class);
    private static HashMap<Integer, Object> graph1Cache = null;

    private SalesTargetGraph_Static() { }

    @PostConstruct
    private void initialize() {
        salesTargetDAOStatic = salesTargetDAO;
        codeServiceStatic = codeService;
    }

    public static HashMap<Integer, Object> Get(){
        logger.info("SalesTargetDTO_Static Get");
        if(graph1Cache == null){
            SalesTargetGraph_Static.Update();
        }
        return graph1Cache;
    }

    public static Object GetWithCompNo(Integer compNo){
        logger.info("SalesTargetDTO_Static GetWithCompNo");
        if (graph1Cache == null){
            SalesTargetGraph_Static.Update();
        }
        return graph1Cache.get(compNo);
    }

    public static void Update(){
        logger.info("SalesTargetDTO_Static update");
        List<CodeDTO> codeDTOList = codeServiceStatic.listComp();

        graph1Cache = new HashMap<Integer, Object>();
        for(CodeDTO t : codeDTOList){
            Integer compNo = t.getCompNo();
            SalesTargetDTO dto = new SalesTargetDTO();
            dto.setCompNo(compNo);
            dto = salesTargetDAOStatic.listViewGraphData01CompnayMonth(dto);

            graph1Cache.put(compNo, dto);
        }
    }
}
