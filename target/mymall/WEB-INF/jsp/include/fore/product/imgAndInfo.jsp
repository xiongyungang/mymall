<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/23 0023
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    $(function () {
//        监听购买和加入购物车,打开模态登陆
        $(".buyLink").click(function () {
            var page = "forecheckLogin";
            $.get(
                page,
                function (result) {
                    if ("success" == result) {
                        var num = $(".productNumberSetting").val();
                        //跳转url
                        location.href = $(".buyLink").attr("href") + "&num=" + num;
                    }
                    else {
                        $("#loginModal").modal('show');
                    }
                }
            );
            return false;
        });
        $(".addCartLink").click(function () {
            var page = "forecheckLogin";
            $.get(
                page,
                function (result) {
                    if ("success" == result) {
                        var num = $(".productNumberSetting").val();
                        var pid = ${p.id};
                        var addCart = "foreAddCart";
                        $.get(
                            addCart,
                            {"pid": pid, "num": num},
                            function (result) {
                                if ("success" == result) {
                                    $("#addCart").html("<span>已加入购物车<span>");
                                    $("#addCart").attr("class","btn btn-dafault");
                                    $("#addCart").attr("disabled","disabled");
                                } else {
                                    alert("fail");
                                }
                            }
                        );
                    }
                    else {
                        $("#loginModal").modal('show');
                    }
                }
            );
            return false;
        });
//        登陆信息验证
        $("button.loginSubmitButton").click(function () {
            var name = $("#name").val();
            var password = $("#password").val();
            if (0 == name.length || 0 == password.length) {
                $("span.errorMessage").html("请输入账号密码");
                $("div.loginErrorMessageDiv").show();
                return false;
            }
            var page = "foreloginAjax";
            $.get(
                page,
                {"name": name, "password": password},
                function (result) {
                    if ("success" == result) {
                        location.reload();
                    }
                    else {
                        $("span.errorMessage").html("账号密码错误");
                        $("div.loginErrorMessageDiv").show();
                    }
                }
            );
            return true;
        });
        $(".minus").click(function () {
            var num = $(".productNumberSetting").val();
            if (num > 1) {
                $(".productNumberSetting").val(--num);
            }

        });
        $(".plus").click(function () {
            var num = $(".productNumberSetting").val();
            $(".productNumberSetting").val(++num);
        });

    });

</script>
<div class="container">
    <div class="row">
        <div class="col-xs-4 ">
            <div class="singleDiv">
                <img class="img-thumbnail" src="img/productSingle/${p.firstProductImage.id}.jpg">
            </div>

            <c:forEach items="${p.productSingleImages}" var="pi">
                <img  src="img/productSingle_small/${pi.id}.jpg" bigImageURL="img/productSingle/${pi.id}.jpg">
            </c:forEach>
        </div>
        <div class="col-xs-8 ">
            <div class="productInfoDiv">
                <h4 class="productTitle">
                    ${p.name}
                    <small>${p.subTitle}</small>
                </h4>
                <br>
                <br>
                <div style="font-size: medium">价格：￥
                    <del>${p.originalPrice}</del>
                </div>
                <div><span class="price-lg">促销价：￥${p.promotePrice}</span></div>
                <br>
                <table>
                    <tr>
                        <th>数量:</th>
                    </tr>
                    <tr>
                        <td width="120px"></td>
                    </tr>
                    <td class="input-group">
                        <a href="#" class="input-group-addon minus">-</a>
                        <input type="text" readonly="readonly"
                               class="number form-control input-sm productNumberSetting" value="1"/>
                        <a href="#" class="input-group-addon plus">+</a>
                    </td>
                    </tr>
                </table>
                <br>
                <tr>
                    <a href="forebuyone?pid=${p.id}" class="buyLink">
                        <button class="btn btn-success">立即购买</button>
                    </a>
                    <a href="#" class="addCartLink">
                        <button class="btn btn-danger" id="addCart"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车
                        </button>
                    </a>
            </div>
        </div>
    </div>
</div>