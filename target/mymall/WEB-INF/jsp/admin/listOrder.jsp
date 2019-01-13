<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/16 0016
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@include file="../include/admin/head.jsp" %>
<%@include file="../include/admin/navigation.jsp" %>
<script>
    $(function(){
        $("input.detail").click(function(){
            var oid = $(this).attr("oid");
            $("tr.orderPageOrderItemTR[oid="+oid+"]").toggle();
        });
    });

</script>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2">
            <a href="#" class="list-group-item active">订单管理</a>
            <a href="#" class="list-group-item">查看订单</a>
        </div>
        <div class="col-sm-10">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>状态</th>
                    <th>金额</th>
                    <th width="100px">商品数量</th>
                    <th width="100px">买家名称</th>
                    <th>创建时间</th>
                    <th>支付时间</th>
                    <th>发货时间</th>
                    <th>确认收货时间</th>
                    <th width="120px">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${os}" var="o" varStatus="s">
                    <tr>
                        <td>${page.start+s.count}</td>
                        <td>${o.statusDesc}</td>
                        <td>${o.total}</td>
                        <td>${o.totalNumber}</td>
                        <td>${o.user.name}</td>
                        <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td><fmt:formatDate value="${o.deliveryDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td><fmt:formatDate value="${o.confirmDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>
                            <input type="button" class="btn btn-primary btn-xs detail" oid="${o.id}" value="查看详细">
                            <c:if test="${o.status=='waitDelivery'}">
                                <a href="admin_order_delivery?id=${o.id}"> <input type="button"  class="btn btn-success btn-xs" value="发货"></a>
                            </c:if>
                        </td>
                    </tr>
                    <tr class="orderPageOrderItemTR"  oid=${o.id}>
                        <td colspan="10" align="center">

                            <div  class="orderPageOrderItem">
                                <table width="800px" align="center" class="orderPageOrderItemTable">
                                    <c:forEach items="${o.orderItems}" var="oi">
                                        <tr>
                                            <td align="left">
                                                <img width="40px" height="40px" src="img/productSingle/${oi.product.firstProductImage.id}.jpg">
                                            </td>

                                            <td>
                                                <a href="foreproduct?pid=${oi.product.id}">
                                                    <span>${oi.product.name}</span>
                                                </a>
                                            </td>
                                            <td align="right">

                                                <span class="text-muted">${oi.number}个</span>
                                            </td>
                                            <td align="right">

                                                <span class="text-muted">单价：￥${oi.product.promotePrice}</span>
                                            </td>

                                        </tr>
                                    </c:forEach>

                                </table>
                            </div>

                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div align="center">
                <%@include file="../include/admin/page.jsp" %>
            </div>
        </div>
    </div>
</div>

<%@include file="../include/admin/foot.jsp" %>
