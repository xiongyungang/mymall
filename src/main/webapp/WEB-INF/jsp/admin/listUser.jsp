<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/16 0016
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@include file="../include/admin/head.jsp" %>
<%@include file="../include/admin/navigation.jsp" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2">
            <a href="#" class="list-group-item active">用户管理</a>
            <a href="#" class="list-group-item">查看管理</a>
        </div>
        <div class="col-sm-10">
            <table class="table table-hover">
                <thead>
                    <th>客户编号</th>
                    <th>客户姓名</th>
                </thead>
                <c:forEach items="${us}" var="u" varStatus="s">
                    <tr>
                        <td>${Page.start+s.count}</td>
                        <td>${u.name}</td>
                    </tr>
                </c:forEach>
            </table>
            <div align="center">
            <%@include file="../include/admin/page.jsp"%>
            </div>
        </div>
    </div>
</div>

<%@include file="../include/admin/foot.jsp" %>

