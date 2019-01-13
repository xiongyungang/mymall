<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/14 0014
  Time: 22:02
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
        <div class="col-sm-10">
            <form action="admin_product_update" method="post">
                <table>
                    <tr><input type="hidden" value="${p.id}" name="id"></tr>
                    <tr><input type="hidden" value="${p.cid}" name="cid"></tr>
                    <tr>
                        <input type="text" name="name" class="form-control" value="${p.name}">
                    </tr>
                    <tr>
                        <input type="text" name="subTitle" class="form-control" value="${p.subTitle}">
                    </tr>
                    <tr>
                        <input type="text" name="originalPrice" class="form-control" value="${p.originalPrice}">
                    </tr>
                    <tr>
                        <input type="text" name="promotePrice" class="form-control" value="${p.promotePrice}">
                    </tr>
                    <tr>
                        <input type="text" name="stock" class="form-control" value="${p.stock}">
                    </tr>
                    <tr>
                        <input type="submit" value="更新" class="btn btn-info">
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>

<%@include file="../include/admin/foot.jsp"%>

