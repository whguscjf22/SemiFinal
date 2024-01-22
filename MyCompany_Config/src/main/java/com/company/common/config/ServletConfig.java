package com.company.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.company.common.interceptor.SessionInterceptor;

@EnableWebMvc
@Configuration
@ComponentScan(basePackages = {"com.company.controller"})
public class ServletConfig implements WebMvcConfigurer {
	
	// void addResourceHandlers(ResourceHandlerRegistry registry)
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		//
		registry.addResourceHandler("/resources/**")
					.addResourceLocations("/resources/");
	}
	
	// void configureViewResolvers(ViewResolverRegistry registry)
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/", ".jsp");
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		return multipartResolver;
	}
	
	// void addInterceptors(InterceptorRegistry registry)
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new SessionInterceptor())
					.addPathPatterns("/dept/**")
					.addPathPatterns("/modify/**")
					.addPathPatterns("/logout")
					.excludePathPatterns("/login")
					.excludePathPatterns("/main");
	}
	
}
