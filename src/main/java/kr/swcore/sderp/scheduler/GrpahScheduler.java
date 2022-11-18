package kr.swcore.sderp.scheduler;

import kr.swcore.sderp.salesTarget.service.SalesTargetGraph_Static;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;

@Component
public class GrpahScheduler {

    private static final Logger logger = LoggerFactory.getLogger(GrpahScheduler.class);

    /**
     * 10분 마다 수행
     * 회사별로 약 5초걸림
     */
    @Scheduled(fixedDelay=600000)
    public void graphCacheUpdate(){
        long nano = System.currentTimeMillis();
        logger.info("GrpahScheduler graph1CacheUpdate : " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(nano));
        SalesTargetGraph_Static.Update();
    }
}
