package com.xyg.mall.interceptor;


import com.xyg.mall.service.CategoryService;
import com.xyg.mall.service.OrderItemService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor  extends HandlerInterceptorAdapter {
    @Autowired
    CategoryService categoryService;
    @Autowired
    OrderItemService orderItemService;

    public boolean prehandle(HttpServletRequest request, HttpServletResponse response,Object handler) {
        HttpSession session = request.getSession();
        String contextPath = session.getServletContext().getContextPath();
        String[] NeedAuthPage = new String[]{
            "foreCart",
                ""
        };
        String uri = request.getRequestURI();
        uri = StringUtils.remove(uri, contextPath);

        return true;
     }

}
