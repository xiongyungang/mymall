<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/14 0014
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">
                <img src="" height="100%"/>
            </a>
        </div>
        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li id="l1"><a class="icon-bar" href="#">个人中心</a>
                </li>
                <li id="l2"><a href="admin_category_list">分类管理</a>
                </li>
                <li id="l3"><a href="admin_product_list?cid=0">商品管理</a>
                </li>
                <li id="l4"><a href="admin_user_list">用户管理</a>
                </li>
                <li id="l5"><a href="admin_order_list">订单管理</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a>欢迎您,admin</a>
                </li>
                <li><a href="#">安全退出</a>
                </li>
            </ul>
        </div>
    </div>
</nav>