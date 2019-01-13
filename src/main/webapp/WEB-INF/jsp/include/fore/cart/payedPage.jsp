<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/25 0025
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<div class="container">
    <div class="row">
        <div class="payedDiv">
            <div class="payedTextDiv">
                <h1>您已成功付款</h1>

            </div>
            <div class="payedAddressInfo">
                <ul>
                    <li>收货地址：${o.address} ${o.receiver} ${o.mobile }</li>
                    <li>实付款：<span class="payedInfoPrice">
            ￥<fmt:formatNumber type="number" value="${param.total}" minFractionDigits="2"/>
                    </li>
                    <li>预计06月08日送达    </li>
                </ul>


            </div>

            <div class="payedSeperateLine">
            </div>

        </div>
    </div>
</div>
