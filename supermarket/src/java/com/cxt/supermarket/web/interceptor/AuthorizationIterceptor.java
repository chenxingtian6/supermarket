package com.cxt.supermarket.web.interceptor;

import com.cxt.supermarket.entity.User;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 权限验证拦截器
 */
public class AuthorizationIterceptor extends HandlerInterceptorAdapter {
    /**
     * 在控制器处理之前调用，如果返回true，继续调用下个拦截器或者最终到达控制器，否者终止请求处理
     *
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        HandlerMethod handlerMethod= (HandlerMethod) handler;
//        ((HandlerMethod) handler).getMethodAnnotation(RequestMapping.class);
        //获取URI
        String reqUri = request.getRequestURI();
        if(reqUri.indexOf("login")!=-1||reqUri.indexOf("register")!=-1||reqUri.indexOf("logout")!=-1){
            return true;
        }
        //验证是否登录
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("loginedUser");
        if (user == null) {
            response.sendRedirect(request.getContextPath()+"../../jsp/login.jsp");
            return false;

        }
        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
