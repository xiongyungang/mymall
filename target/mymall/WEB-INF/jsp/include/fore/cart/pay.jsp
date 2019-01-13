<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/25 0025
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         isELIgnored="false" pageEncoding="UTF-8" %>
<div class="container">
    <div class="row">
        <div align="center">
            <div><span class="price" STYLE="font-size: 22px">￥${param.total}</span></div>
            <img class="aliPayImg" src="img/site/alipay2wei.png"><br><a href="forepayed?oid=${param.oid}&total=${param.total}">
            <button class="btn btn-info btn-lg">支付完成</button>
        </a>
        </div>

    </div>
</div>
