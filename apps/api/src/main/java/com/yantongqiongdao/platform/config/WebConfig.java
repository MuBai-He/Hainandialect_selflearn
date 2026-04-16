package com.yantongqiongdao.platform.config;

import java.util.Arrays;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final String audioDatasetRoot;
    private final String[] allowedOrigins;

    public WebConfig(
            @Value("${audio.dataset-root:./data/audio-dataset/}") String audioDatasetRoot,
            @Value("${app.cors.allowed-origins:http://localhost:5173,http://127.0.0.1:5173,http://localhost:5174}")
            String allowedOrigins
    ) {
        String normalizedRoot = audioDatasetRoot.replace("\\", "/");
        this.audioDatasetRoot = normalizedRoot.endsWith("/") ? normalizedRoot : normalizedRoot + "/";
        this.allowedOrigins = Arrays.stream(allowedOrigins.split(","))
                .map(String::trim)
                .filter(origin -> !origin.isEmpty())
                .toArray(String[]::new);
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                .allowedOrigins(allowedOrigins)
                .allowedMethods("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS")
                .allowedHeaders("*");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/media/audio/**")
                .addResourceLocations("file:" + audioDatasetRoot);
    }
}
