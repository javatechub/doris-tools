package cn.cloud.onetech.doris.tools;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.LocalDateTime;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * @author heguanhui
 * @desc
 * @date 2024/11/8 16:07
 */
public class DataGenStarter {

    private static Logger logger = LoggerFactory.getLogger(DataGenStarter.class);

    private static ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);
    public static void main(String[] args) {
        System.out.println("DataGenStarter execute");
        logger.info("this is info level log");
        if (logger.isDebugEnabled()) {
            logger.debug("this is debug level log");
        }
        logger.warn("this is warn level log");
        executor.scheduleAtFixedRate(() -> {
            logger.info("this is info level log {}", LocalDateTime.now());
            logger.debug("this is debug level log {}", LocalDateTime.now());
            logger.warn("this is warn level log {}", LocalDateTime.now());
        }, 0, 1, TimeUnit.SECONDS);
    }

}
