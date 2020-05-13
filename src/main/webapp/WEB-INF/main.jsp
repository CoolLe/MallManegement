<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/1
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理系统</title>
    <meta charset="UTF-8">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
    <script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">
        north region
    </div>
    <div data-options="region:'west',split:true,title:'West'" style="width:150px;padding:10px;">
        <a href="goto_spu.do" target="_blank">商品信息管理</a><br>
        <a href="goto_attr.do" target="_blank">商品属性管理</a><br>
        <a href="goto_sku.do" target="_blank">商品库存单元管理</a><br>
        <a href="goto_spu.do" target="_blank">商品缓存管理</a><br>
    </div>
    <div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">
        east region
    </div>
    <div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">
        south region
    </div>
    <div data-options="region:'center',title:'Center'"></div>
</body>
</html>
