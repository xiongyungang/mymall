<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/14 0014
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@include file="../include/admin/head.jsp"%>
<%@include file="../include/admin/navigation.jsp"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2">

        </div>
        <div class="col-sm-10" style="width: 50%;">
            <form action="admin_category_update" method="post" enctype="multipart/form-data">
                <table>
                    <tr>分类名称</tr>
                    <tr><input type="text" name="name" value="${c.name}" class="form-control"></tr><br>
                    <tr>分类图片</tr>
                    <tr><input type="file" accept="image/*" name="image"> </tr>
                    <tr><input type="hidden" name="id" value="${c.id}"></tr><br>
                    <tr><input type="submit" class="btn btn-info" value="更改"></tr>
                </table>
            </form>
        </div>
        <div>
            <div>
<%@include file="../include/admin/foot.jsp"%>
