<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/20 0020
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <link href="css/fore/mystyle.css" rel="stylesheet">

    <script>

    </script>
</head>
<body>
<div class="container" style="margin-top: 10px">
    <div class="container">
        <div class="row">
            <h1>Mymall<small> simple shopping</small></h1>
            <nav class="navbar navbar-inverse" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="home"><span class="glyphicon glyphicon-home"></span></a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">手机数码</a></li>
                    <li><a href="#">鞋靴箱包</a></li>
                    <li><a href="foreCart"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="foreCart">购物车</a></li>
                            <li class="divider"></li>
                            <li><a href="#">交易记录</a></li>
                            <li class="divider"></li>
                            <li><a href="#">退出</a></li>
                        </ul>
                    </li>
                </ul>

                <div  class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="男装">
                    </div>
                    <button type="submit" class="btn btn-danger btn">搜索</button>
                    <span>&nbsp;&nbsp;&nbsp;</span>
                </div>

            </nav>
        </div>
    </div>
</div>
