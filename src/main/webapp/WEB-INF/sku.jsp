<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/11
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理系统</title>
</head>
<body>
    sku商品信息管理
    <hr>
    一级分类：<select id="sku_class_1_select" onchange="get_class_2(this.value)"><option>请选择分类</option></select>
    二级分类：<select id="sku_class_2_select"><option>请选择分类</option></select>
    <br>
    查询<br>
    <a href="javascript:goto_sku_add();" >添加</a><br>
    删除<br>
    修改<br>
    <script>
        $(function () {
            $.getJSON("js/json/class_1.js",function (data) {
                $(data).each(function (i,json) {
                    $("#sku_class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
                });
            });
        });

        function get_class_2(class_1_id) {
            $.getJSON("js/json/class_2_"+class_1_id+".js",function (data) {
                $("#sku_class_2_select").empty();
                $(data).each(function (i,json) {
                    $("#sku_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
                });
            });
        }

        function goto_sku_add() {
            var class_1_id = $("#sku_class_1_select").val();
            var class_2_id = $("#sku_class_2_select").val();
            window.location.href="goto_sku_add.do?flbh1=" +class_1_id
                +"&flbh2=" +class_2_id;
        }
    </script>
</body>
</html>
