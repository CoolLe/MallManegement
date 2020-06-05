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
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:true" style="height:50px">
            <div style="margin-top: 10px;margin-left:10px">
                一级分类：<select data-options='width:200' class="easyui-combobox" id="sku_class_1_select" onchange="get_class_2(this.value)"><option>请选择分类</option></select>
                二级分类：<select data-options='width:200' class="easyui-combobox" id="sku_class_2_select"><option>请选择分类</option></select>
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="goto_sku_add()">添加新的商品库存信息</a>
            </div>
        </div>

        <div data-options="region:'center'"></div>
    </div>

    <script>
        $(function () {
            $('#sku_class_1_select').combobox({
                url: 'js/json/class_1.js',
                valueField:'id',
                textField:'flmch1',
                onChange:function get_class_2() {
                    var class_1_id = $(this).combobox('getValue');
                    $('#sku_class_2_select').combobox({
                        url: "js/json/class_2_"+class_1_id+".js",
                        valueField: 'id',
                        textField: 'flmch2'
                    });
                }
            })
        });

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
            var class_1_id = $("#sku_class_1_select").combobox('getValue');
            var class_2_id = $("#sku_class_2_select").combobox('getValue');
            if (class_2_id === "请选择分类") {
                alert("请选择分类");
            }
            else {
                url = "goto_sku_add.do?flbh1=" +class_1_id
                    +"&flbh2=" +class_2_id;
                add_tab(url,"添加SKU属性");
            }
        }
    </script>
</body>
</html>
