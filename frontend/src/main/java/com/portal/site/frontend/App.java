package com.portal.site.frontend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.ApplicationPidFileWriter;

@SpringBootApplication
public class App {
    public static void main(String[] args) {
        SpringApplication springApplication = new SpringApplication(App.class);
        // 监控应用的PID，启动时可指定PID路径：--spring.pid.file=/home/app.pid
        // 或者在 application.yml 添加文件路径，方便 kill，kill `cat /home/app.pid`
        springApplication.addListeners(new ApplicationPidFileWriter());
        springApplication.run(args);
    }
}
