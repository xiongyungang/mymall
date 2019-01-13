<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/23 0023
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
 isELIgnored="false" pageEncoding="UTF-8" %>
<div class="container">
    <div class="row">
        <c:forEach items="${p.productDetailImages}" var="image">
            <div class="detailDIV" align="center">
                <img class="detailIMG" src="img/productDetail/${image.id}.jpg">
            </div>
        </c:forEach>
    </div>
</div>

