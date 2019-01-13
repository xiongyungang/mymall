<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/13 0013
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@include file="../include/admin/head.jsp" %>
<%@include file="../include/admin/navigation.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script>
    $(function () {
        $("#addCategory").click(function () {
            $("#newTr").show();
        });
    });
</script>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2">
            <a href="#" class="list-group-item active">分类管理</a>
            <a href="#" class="list-group-item" id="addCategory"><span class="glyphicon glyphicon-plus"></span> 添加分类</a>
            <a href="#" class="list-group-item"><span class="glyphicon glyphicon-tags"></span> 属性管理</a>
        </div>
        <div class="col-sm-10">
            <table class="table table-hover" width="100%">
                <thead>
                <th>分类编号</th>
                <th>分类图片</th>
                <th width="30%">分类名称</th>
                <th>属性管理</th>
                <th>操作</th>
                </thead>
                <c:forEach items="${cs}" var="c" varStatus="starus">
                    <tr onclick="location.href='admin_product_list?cid=${c.id}';">
                        <td>${page.start+starus.count}</td>
                        <td><img style="height: 45px;"  class="img-thumbnail"  src="img/category/${c.id}.jpg"></td>
                        <td>${c.name}</td>
                        <td><a href="adminpropertylist?cid=${c.id}"><span class="glyphicon glyphicon-th-list"></span></a> </td>
                        <td>
                            <div class="btn-group"><a href="admin_category_edit?id=${c.id}" class="btn btn-default">编辑</a><a
                                    href="admin_category_delete?id=${c.id}" class="btn btn-default">删除</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <tr id="newTr" style="display: none;background-color:#FAF9F9">
                    <form action="admin_category_add" method="post" enctype="multipart/form-data">
                        <td></td>
                        <td><input type="file" name="image" accept="image/*"></td>
                        <td><input type="text" class="form-control" name="name"></td>
                        <td><input type="submit" class="btn" value="添加"></td>
                        <td></td>
                    </form>
                </tr>
            </table>

            <div align="center">
                <%@include file="../include/admin/page.jsp" %>
            </div>
        </div>
        <div>
            <div>
<%@include file="../include/admin/foot.jsp" %>