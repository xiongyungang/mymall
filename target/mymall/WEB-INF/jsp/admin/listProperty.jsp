<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/21 0021
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@include file="../include/admin/head.jsp" %>
<%@include file="../include/admin/navigation.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2">

        </div>
        <div class="col-sm-10">
            <table class="table table-hover">
                <thead>
                    <th>属性编号</th>
                    <th>属性名称</th>
                    <th>操作</th>
                </thead>
                <c:forEach items="${pts}" var="pt" varStatus="s">
                    <tr>
                        <td>${s.count+page.start}</td>
                        <td width="50%">${pt.name}</td>
                        <td>
                            <div class="btn-group"><a href="propertyedit?id=${pt.id}" class="btn btn-default">编辑</a><a
                                    href="propertydel?id=${pt.id}" class="btn btn-danger">删除</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div align="center">
                <%@include file="../include/admin/page.jsp" %>
            </div>
        </div>
    </div>
</div>
<%@include file="../include/admin/foot.jsp" %>
