package com.example.demo;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.ApplicationRunner;
import com.google.cloud.spring.pubsub.core.*;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

	@Bean
    public ApplicationRunner cli(PubSubTemplate pubSubTemplate) {
        return (args) -> {
            pubSubTemplate.subscribe("messages-subscription-1",
                (msg) -> {
                    System.out.println(msg.getPubsubMessage()
                        .getData().toStringUtf8());
                    msg.ack();
                });
        };
    }

}
