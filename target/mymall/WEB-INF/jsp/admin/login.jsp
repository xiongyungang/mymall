<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/14 0014
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" language="java" %>
<%@include file="../include/admin/head.jsp"%>

<form action="find" method="post">
<div class="container">
    <div class="form row">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">登陆后台</h3><br>
            <div class="col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="Username" id="username" name="name" autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Password" id="password" name="password"/>
                </div>
                <div class="form-group">
                    <label class="checkbox">
                        <input type="checkbox" name="remember" value="1"/>记住我
                    </label>
                </div>
                <div class="form-group col-md-offset-9">
                    <input type="submit" class="btn btn-info pull-right" value="注册"><span class="pull-right">&nbsp&nbsp</span>
                    <button type="submit" class="btn btn-success pull-right">登录</button>
                </div>
            </div>
        </div>
    </div>
</div>
</form>

</body>
</html>
