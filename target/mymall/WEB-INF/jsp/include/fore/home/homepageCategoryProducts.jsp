<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/20 0020
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<div class="container">
    <div class="row">
        <div class="col-md-12 col-sm-12" style="padding-left: 10px;">
            <c:forEach items="${cs}" var="c">
                <div class="row">
        <span id="" style="font-size: 30px;padding-left:33px;">
                ${c.name}
        </span>
                </div>
                <div class="row">
                    <c:forEach items="${c.products}" var="p" varStatus="s">
                        <c:if test="${s.count<=6}">
                        <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                            <div class="productItem">
                                <a href="foreproduct?pid=${p.id}"><img width="100px"
                                                 src="img/productSingle_middle/${p.firstProductImage.id}.jpg"></a>
                                <a href="foreproduct?pid=${p.id}"><span class="productItemDesc">
                                        ${fn:substring(p.name,0,10)}
                                </span></a>
                                <span class="productPrice">
                                 ￥<fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="1"/>
                            </span>
                            </div>
                        </div>
                        </c:if>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>
    </div>
</div>