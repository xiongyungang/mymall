<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/24 0024
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         isELIgnored="false" pageEncoding="UTF-8" %>
<script>
    var deleteOrderItem = false;
    var deleteOrderItemId = 0;//要删除的订单项id
    $(function () {
        $(".minus").click(function () {
            var pid = $(this).attr("pid");
            var price = $("span.price[pid=" + pid + "]").text();
            var num = $(".input-sm[pid=" + pid + "]").val();
            if (num > 0) {
                num--;
            }
            syncPrice(pid, price, num);

        });
        $(".plus").click(function () {
            var pid = $(this).attr("pid");
            var price = $("span.price[pid=" + pid + "]").text();
            var num = $(".input-sm[pid=" + pid + "]").val();
//            库存判断
            num++;
            syncPrice(pid, price, num);
        });

        //删除订单项
        //打开模态窗口
        $(".deleteOi").click(function () {
            deleteOrderItemId = $(this).attr("oiid");
            $("#deleteConfirmModal").modal('show');
        });
        //关闭模态窗口
        $("button.deleteConfirmButton").click(function () {
            deleteOrderItem = true;
            $("#deleteConfirmModal").modal('hide');
        });
        //删除操作
        $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
            if (deleteOrderItem) {
                var page = "foredeleteOrderItem";
                $.post(
                    page,
                    {"oiid": deleteOrderItemId},
                    function (result) {
                        if ("success" == result) {
                            $("tr.orderItemTR[oiid=" + deleteOrderItemId + "]").hide();
                        }
                        else {
                            location.href = "loginPage";
                        }
                    }
                );
            }
        });
        //选择订单项
        $("img.cartProductItemIfSelected").click(function(){
            $("button.createOrder").removeAttr("disabled");
            var selectit = $(this).attr("selectit")
            if("selectit"==selectit){
                $(this).attr("src","img/site/cartNotSelected.png");
                $(this).attr("selectit","false")
                $(this).parents("tr.cartProductItemTR").css("background-color","#fff");
            }
            else{
                $(this).attr("src","img/site/cartSelected.png");
                $(this).attr("selectit","selectit")
                $(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
            }
            syncSelect();
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();
        });
        //选择所有订单项
        $("img.selectAllItem").click(function(){
            $("button.createOrder").removeAttr("disabled");
            var selectit = $(this).attr("selectit");
            if("selectit"==selectit){
                $("img.selectAllItem").attr("src","img/site/cartNotSelected.png");
                $("img.selectAllItem").attr("selectit","false")
                $(".cartProductItemIfSelected").each(function(){
                    $(this).attr("src","img/site/cartNotSelected.png");
                    $(this).attr("selectit","false");
                    $(this).parents("tr.cartProductItemTR").css("background-color","#fff");
                });
            }
            else{
                $("img.selectAllItem").attr("src","img/site/cartSelected.png");
                $("img.selectAllItem").attr("selectit","selectit")
                $(".cartProductItemIfSelected").each(function(){
                    $(this).attr("src","img/site/cartSelected.png");
                    $(this).attr("selectit","selectit");
                    $(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
                });
            }
            syncCreateOrderButton();
            calcCartSumPriceAndNumber();

        });
        //提交订单项
        $("button.createOrder").click(function () {
            var params = "";
            $(".cartProductItemIfSelected").each(function(){
                if("selectit"==$(this).attr("selectit")){
                    var oiid = $(this).attr("oiid");
                    params += "&oiid="+oiid;
                }
            });
            params = params.substring(1);
            location.href="forebuy?"+params;
        });
    });

    //增减操作的更新
    function syncPrice(pid, price, num) {
        $(".input-sm[pid=" + pid + "]").val(num);
        var total = (price * num).toFixed(1);//保留1位小数
        $(".total[pid=" + pid + "]").html("￥" + total);

        var page = "forechangeOrderItem";
        $.get(
            page,
            {"pid": pid, "num": num},
            function (result) {
                if (result != "success")
                    alert("登陆已经失效，请重新登陆");
            }
        );
    }
    /*结算按钮的可效*/
    function syncCreateOrderButton(){
        var selectAny = false;
        $(".cartProductItemIfSelected").each(function(){
            if("selectit"==$(this).attr("selectit")){
                selectAny = true;
            }
        });

        if(selectAny){
            $("button.createOrderButton").removeAttr("disabled");
        }
        else{
            $("button.createOrderButton").attr("disabled","disabled");
        }

    }
</script>

<div class="container">
    <div class="row">
        <table class="table table-hover">
            <thead>
            <th class="selectAndImage">
                <img selectit="false" class="selectAllItem" src="img/site/cartNotSelected.png">
                全选
            </th>
            <th></th>
            <th>商品信息</th>
            <th>单价</th>
            <th style="width:120px;">数量</th>
            <th>金额</th>
            <th>操作</th>
            </thead>
            <tbody>
            <c:forEach items="${ois}" var="oi">
                <tr oiid="${oi.id}" class="orderItemTR">
                    <td>
                        <img selectit="false" oiid="${oi.id}" class="cartProductItemIfSelected"
                             src="img/site/cartNotSelected.png">
                        <a style="display:none" href="#nowhere"><img src="img/site/cartSelected.png"></a>
                    </td>
                    <td>
                        <img src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg" height="50px">
                    </td>
                    <td>${oi.product.name}</td>
                    <td><span class="price" pid="${oi.product.id}">${oi.product.promotePrice}</span></td>
                        <%--购物车增减操作--%>
                    <td class="input-group">
                        <a href="#" pid="${oi.product.id}" class="input-group-addon minus">-</a>
                        <input type="text" pid="${oi.product.id}" readonly="readonly"
                               class="number form-control input-sm" value="${oi.number}"/>
                        <a href="#" pid="${oi.product.id}" class="input-group-addon plus">+</a>
                    </td>
                    <td class="subtotal number small-bold-red"><span class="total"
                                                                     pid="${oi.product.id}">￥${oi.number*oi.product.promotePrice}</span>
                    </td>
                    <td><a href="#" oiid="${oi.id}" class="btn btn-danger btn-group-sm deleteOi">删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="cartFoot">
            <button class="btn btn-success btn-lg pull-right createOrder" disabled="disabled">结算</button>
        </div>
        <div class="well m-t"><h4>注意：</h4>请确认商品无误后提交订单！
        </div>
    </div>
</div>
