package com.zhao.quiz.config;

import com.zhao.quiz.component.LoginHanderInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

/*开发时可以注销*/
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Autowired
    private LoginHanderInterceptor loginHanderInterceptor;

    @Override
    public void configurePathMatch(PathMatchConfigurer configurer) {
        configurer.setUseSuffixPatternMatch(false);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //添加对用户是否登录的拦截器，并添加过滤项、排除项
        registry.addInterceptor(loginHanderInterceptor).addPathPatterns("/**")
                .excludePathPatterns("/index.html","/","/static","/asserts/**","/webjars/**")//排除样式、脚本、图片等资源文件
                .excludePathPatterns("/")//排除登录页面
//                .excludePathPatterns("/index")//排除登录页面
                .excludePathPatterns("/foreLogin")//排除登录操作
                .excludePathPatterns("/backLogin")//排除登录操作
                .excludePathPatterns("/backLogin/check")//排除登录操作
                .excludePathPatterns("/foreCheck/check")//排除登录操作
                .excludePathPatterns("/prexam/toAddStudent")//排除注册页面
                .excludePathPatterns("/prexam/AddStudent");//排除注册页面
//                .excludePathPatterns("/countdownPage");//排除倒计时页面
    }
}
