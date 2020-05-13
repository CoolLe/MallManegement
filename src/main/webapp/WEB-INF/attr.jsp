<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/10
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>商城管理系统</title>
</head>
<body>
    商品属性信息管理页面
    <hr>
    一级分类：<select id="attr_class_1_select" onchange="get_attr_class_2(this.value)"><option>请选择分类</option></select>
    二级分类：<select id="attr_class_2_select" onchange="get_attr_list(this.value)"><option>请选择分类</option></select><br>
    查询<br>
    <a href="javascript:goto_attr_add();" >添加</a><br>
    删除<br>
    修改<br>
    <hr>
    <div id="attrListInner"></div>
    <script type="text/javascript">
        $(function () {
            $.getJSON("js/json/class_1.js",function (data) {
                $(data).each(function (i,json) {
                    $("#attr_class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
                });
            });
        });

        function get_attr_class_2(attr_class_1_id) {
            $.getJSON("js/json/class_2_"+attr_class_1_id+".js",function (data) {
                $("#attr_class_2_select").empty();
                $(data).each(function (i,json) {
                    $("#attr_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
                });
            });
        }

        function goto_attr_add() {
            var class_2_id = $("#attr_class_2_select").val();
            window.location.href="goto_attr_add.do?flbh2=" +class_2_id;
        }

        function get_attr_list(flbh2) {
            //异步查询
            $.post("get_attr_list.do",{flbh2:flbh2},function (data) {
                $("#attrListInner").html(data);
            })
        }
    </script>
</body>
</html>
