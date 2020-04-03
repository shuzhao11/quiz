package com.zhao.quiz.component;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * @author zhao
 * 拦截器
 */
@Configuration
public class LoginHanderInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object user = request.getSession().getAttribute("loger");
        Object userd = request.getSession().getAttribute("logerd");
        if(user!=null||userd!=null){
            return true;
        }else {
            request.setAttribute("msg", "没有权限先登录");
//            request.getRequestDispatcher("/").forward(request, response);
            response.sendRedirect(request.getContextPath()+"/");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
