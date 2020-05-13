<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/1
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%String basePath = request.getScheme() + "://" + request.getServerName() + ":" +request.getServerPort() + request.getContextPath() + "/";%>--%>
<%String basePath = "localhost:8080/"; %>
<html>
<head>
<%--    <base href="<%=basePath %>">--%>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>spu商品信息管理</title>
</head>
<body>
    SPU商品信息管理页面
    <hr>
    一级分类：<select id="class_1_select" onchange="get_class_2(this.value)"><option>请选择分类</option></select>
    二级分类：<select id="class_2_select"><option>请选择分类</option></select>
    商标分类：<select id="class_tm_select"><option>请选择分类</option></select><br>
    查询<br>
    <a href="javascript:goto_spu_add();" >添加</a><br>
    删除<br>
    修改<br>
    <script type="text/javascript">
        $(function () {
            $.getJSON("js/json/class_1.js",function (data) {
                $(data).each(function (i,json) {
                    $("#class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
                });
            });
        });

        function get_class_2(class_1_id) {
            $.getJSON("js/json/class_2_"+class_1_id+".js",function (data) {
                $("#class_2_select").empty();
                $(data).each(function (i,json) {
                    $("#class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
                });
            });
            get_tm(class_1_id);
        }

        function get_tm(class_1_id) {
            $.getJSON("js/json/tm_class_1_"+class_1_id+".js",function (data) {
                $("#class_tm_select").empty();
                $(data).each(function (i,json) {
                    $("#class_tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>");
                });
            });
        }

        function goto_spu_add() {
            var class_1_id = $("#class_1_select").val();
            var class_2_id = $("#class_2_select").val();
            var tm_id = $("#class_tm_select").val();
            window.location.href="goto_spu_add.do?flbh1=" +class_1_id
                +"&flbh2=" +class_2_id
                +"&pp_id=" +tm_id;
        }
    </script>
</body>
</html>
