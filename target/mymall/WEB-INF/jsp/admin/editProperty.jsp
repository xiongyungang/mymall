<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/21 0021
  Time: 19:59
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
        <div class="col-sm-10" style="width: 50%;">
            <table>
                <form action="propertyupdate" method="post">
                    <tr>属性名：</tr>
                    <tr><input type="text" name="name" class="form-control" value="${pt.name}"></tr>
                    <input type="hidden" name="id" value="${pt.id}">
                    <input type="hidden" name="cid" value="${pt.cid}">
                    <tr><input type="submit" class="btn btn-info" value="更改"> </tr>
                </form>
            </table>
        </div>
    </div>
</div>

<%@include file="../include/admin/foot.jsp" %>