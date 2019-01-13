<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/21 0021
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@include file="../include/admin/head.jsp" %>
<%@include file="../include/admin/navigation.jsp" %>

<div align="center">
    <table>
        <tr>
            <!--左边-->
            <td>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        产品图片
                    </div>
                    <div class="panel-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <form action="productImageAdd" method="post" enctype="multipart/form-data">
                                    <input type="file" name="image" accept="image/*">
                                    <input type="hidden" name="type" value="type_single">
                                    <input type="hidden" name="pid" value="${p.id}">
                                    <input type="submit" value="提交" class="btn btn-xs btn-default">
                                </form>
                            </div>
                        </div>



                        <table class="table table-hover">
                            <c:forEach items="${pisSingle}" var="pi">
                            <tr onclick="location.href='img/productSingle/${pi.id}.jpg';">
                                <td><img src="img/productSingle/${pi.id}.jpg" height="50px"></td>
                                <td><a href="productImageDelete?id=${pi.id}" ><span class="glyphicon glyphicon-trash"></span></a> </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </td>




            <!--右边-->
            <td>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        产品详细图片
                    </div>
                    <div class="panel-body">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <form action="productImageAdd" method="post" enctype="multipart/form-data">
                                    <input type="file" name="image" accept="image/*">
                                    <input type="hidden" name="type" value="type_detail">
                                    <input type="hidden" name="pid" value="${p.id}">
                                    <input type="submit" value="提交" class="btn btn-xs btn-default">
                                </form>
                            </div>
                        </div>



                        <table class="table table-hover">
                            <c:forEach items="${pisDetail}" var="pi">
                                <tr onclick="location.href='img/productDetail/${pi.id}.jpg';">
                                    <td><img src="img/productDetail/${pi.id}.jpg" height="50px"></td>
                                    <td><a href="productImageDelete?id=${pi.id}" ><span class="glyphicon glyphicon-trash"></span></a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</div>

<%@include file="../include/admin/foot.jsp" %>

