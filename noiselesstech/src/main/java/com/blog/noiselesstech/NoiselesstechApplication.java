package com.blog.noiselesstech;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.concurrent.TimeUnit;

@SpringBootApplication
public class NoiselesstechApplication implements CommandLineRunner {

    private static Logger LOG = LoggerFactory
            .getLogger(NoiselesstechApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(NoiselesstechApplication.class, args);
    }

    @Override
    public void run(String... args) throws InterruptedException {
        LOG.info("Running NoiselessTech Cron for a few seconds");

        try {
            TimeUnit.SECONDS.sleep(10);
        } catch (InterruptedException exception) {
            throw new InterruptedException("Interrupt error");
        }

        LOG.info("NoiselessTech APP Finished");
    }

}
