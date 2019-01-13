<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/23 0023
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         isELIgnored="false" pageEncoding="UTF-8" %>

<div class="modal " id="loginModal" tabindex="-1" role="dialog">
    <div class="modal-dialog loginDivInProductPageModalDiv">
        <div class="modal-content">
            <div class="loginDivInProductPage">
                <div class="loginErrorMessageDiv">
                    <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                        <span class="errorMessage"></span>
                    </div>
                </div>

                <h4>账号登陆</h4>
                <div class="loginInput ">
                    <span class=" glyphicon glyphicon-user"></span>
                    <input id="name" name="name" class="form-control" placeholder="手机/会员名/邮箱" type="text">
                </div>

                <div class="loginInput ">
                    <span class=" glyphicon glyphicon-lock"></span>
                    <input id="password" name="password" type="password" class="form-control" placeholder="密码"
                           type="text">
                </div>
                <div>
                    <a href="registerPage" class="pull-right">免费注册</a>
                </div>
                <div style="margin-top:20px">
                    <button class="btn btn-success loginSubmitButton" type="submit">登录</button>
                </div>
            </div>
        </div>
    </div>
</div>

<%--购物车删除--%>
<div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog">
    <div class="modal-dialog deleteConfirmModalDiv">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">确认删除？</h4>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                <button class="btn btn-primary deleteConfirmButton" id="submit" type="button">确认</button>
            </div>
        </div>
    </div>
</div>

</div>