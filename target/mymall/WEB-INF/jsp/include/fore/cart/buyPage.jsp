<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/24 0024
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         isELIgnored="false" pageEncoding="UTF-8" %>

<div class="container">
    <div class="row">
        <form action="forecreateOrder" method="post">
            <div class="address">
                <div class="addressTip">输入收货地址</div>
                <div>

                    <table class="addressTable">
                        <tr>
                            <td class="firstColumn">详细地址<span class="redStar">*</span></td>

                            <td><textarea name="address" class="form-control" placeholder="建议您如实填写详细收货地址，例如接到名称，门牌好吗，楼层和房间号等信息"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>邮政编码</td>
                            <td><input name="post" class="form-control" placeholder="如果您不清楚邮递区号，请填写000000" type="text"></td>
                        </tr>
                        <tr>
                            <td>收货人姓名<span class="redStar">*</span></td>
                            <td><input name="receiver" class="form-control" placeholder="长度不超过25个字符" type="text"></td>
                        </tr>
                        <tr>
                            <td>手机号码 <span class="redStar">*</span></td>
                            <td><input name="mobile" class="form-control" placeholder="请输入11位手机号码" type="text"></td>
                        </tr>
                    </table>

                </div>
            </div>


            <table class="table table-hover">
                <thead>
                <tr>
                    <th>名称</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>小计</th>
                    <th>配送方式</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${ois}" var="oi">
                    <tr>
                        <td>${oi.product.name}</td>
                        <td>${oi.product.promotePrice}</td>
                        <td>${oi.number}</td>
                        <td>${oi.number*oi.product.promotePrice}</td>
                        <td>免邮</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="well m-t"><h4>注意：</h4>请确认商品无误后提交订单！
            </div>
            <input type="submit" class="btn btn-success pull-right btn-lg" value="提交订单">
            <span class="price-lg pull-right">实付款:￥${total} </span>

        </form>
    </div>
</div>
