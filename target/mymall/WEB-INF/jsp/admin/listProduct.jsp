<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/13 0013
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" import="java.util.*" %>
<%@include file="../include/admin/head.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/admin/navigation.jsp" %>
<script>
    $(function () {
        $("#addProduct").click(function () {
            $("#newTr").show();
        });
    });
</script>

<div class="container-fluid">
    <div class="row">
        <!--左侧主体-->
        <div class="col-sm-2">
            <a href="#" class="list-group-item active">选择分类</a>
            <a href="#" id="addProduct" class="list-group-item accordion"><span class="glyphicon glyphicon-plus"></span></a>
            <c:forEach items="${cs}" var="c">
                <a href="admin_product_list?cid=${c.id}" class="list-group-item">${c.name}</a>
            </c:forEach>
        </div>

        <!--右侧主体-->
        <div class="col-sm-10">
            <table class="table table-hover">
                <thead>
                <th>产品编号</th>
                <th>图片</th>
                <th>产品名称</th>
                <th>产品标题</th>
                <th>产品原价</th>
                <th>产品折后</th>
                <th>产品库存</th>
                <th>图片管理</th>
                <th>操作</th>
                </thead>

                <c:forEach items="${ps}" var="p" varStatus="s">
                    <tr>
                        <td>${s.count+page.start}</td>
                        <td><img src="img/productSingle/${p.firstProductImage.id}.jpg" width="40px"></td>
                        <td>${p.name}</td>
                        <td>${p.subTitle}</td>
                        <td>${p.originalPrice}</td>
                        <td>${p.promotePrice}</td>
                        <td>${p.stock}</td>
                        <td>
                            <a href="productImageList?id=${p.id}">
                                <span class="glyphicon glyphicon-picture"></span>
                            </a>
                        </td>
                        <td>
                            <div class="btn-group">
                                <a href="admin_product_edit?id=${p.id}" class="btn btn-default">修改</a><a href="#"
                                                                                                         class="btn btn-default">下架</a><a
                                    href="admin_product_delete?id=${p.id}" class="btn btn-danger">删除</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${ps.size()==0}">
                    <tr></tr>
                    <tr></tr>
                    <tr>
                        <td>此分类没有商品，请添加商品！</td>
                    </tr>
                </c:if>
                <tr id="newTr" style="display: none;background-color:#FAF9F9">
                    <form action="admin_product_add" method="post">
                        <td><input type="hidden" name="cid" value="${cid}"></td>
                        <td><input type="text" class="form-control" name="name"></td>
                        <td><input type="text" class="form-control" name="subTitle"></td>
                        <td><input type="text" class="form-control" name="originalPrice"></td>
                        <td><input type="text" class="form-control" name="promotePrice"></td>
                        <td><input type="text" class="form-control" name="stock"></td>
                        <td><input type="submit" class="btn" value="添加"></td>
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