<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/11
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>管理系统</title>
    </head>
    <body>
        <form action="sava_sku.do">
            <input type="hidden" value="${flbh1}" name="flbh1">
            <input type="hidden" value="${flbh2}" name="flbh2">

            品牌：<select data-options='width:200' class="easyui-combobox" id="sku_tm_select" name="pp_id" ><option>请选择分类</option></select>
            商品：<select data-options='width:200' class="easyui-combobox" id="spu_list" name="id"><option>请选择分类</option></select>
<%--            品牌：<select id="sku_tm_select" name="pp_id" onchange="get_spu_list(this.value)"></select>--%>
<%--            商品：<select id="spu_list" name="id"></select>--%>
            <hr>
            分类属性：<br>
            <c:forEach items="${list_attr}" var="attr" varStatus="status">
                <input value="${attr.id}" type="checkbox" name="list_attr[${status.index}].shxm_id" onclick="show_val(${attr.id},this.checked)"/>${attr.shxm_mch}:
            </c:forEach>
            <br>
            <c:forEach items="${list_attr}" var="attr" varStatus="status">
                <div id="val_${attr.id}" style="display: none;">
                    <c:forEach items="${attr.list_value}" var="val">
                        <input value="${val.id}" type="radio" name="list_attr[${status.index}].shxzh_id"/>${val.shxzh}${val.shxzh_mch}
                    </c:forEach>
                </div><br>
            </c:forEach>
            商品库存名称：<input type="text" name="sku_mch"/><br>
            商品库存数量：<input type="text" name="kc"/><br>
            商品库存价格：<input type="text" name="jg"/><br>
            商品库存地址：<input type="text" name="kcdz"/><br>
            <input type="submit" value="添加">
        </form>
        <script type="text/javascript">

            $(function () {
                var flbh1 = "${flbh1}";
                var flbh2 = "${flbh2}";
                $('#sku_tm_select').combobox({
                    url: "js/json/tm_class_1_"+flbh1+".js",
                    valueField: 'id',
                    textField: 'ppmch',
                    onChange:function get_spu_list() {
                        var pp_id = $(this).combobox('getValue');
                        $('#spu_list').combobox({
                            url: "get_spu_list.do?pp_id="+pp_id+"&flbh2="+flbh2,
                            valueField: 'id',
                            textField: 'shp_mch'
                        });
                    }
                })
            });

            $(function () {
                var flbh1 = "${flbh1}";
                $.getJSON("js/json/tm_class_1_"+flbh1+".js",function (data) {
                    $("#sku_tm_select").empty();
                    $(data).each(function (i,json) {
                        $("#sku_tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>");
                    });
                });
            });

            function get_spu_list(pp_id) {
                var flbh2 = "${flbh2}";
                $.post("get_spu_list.do", {pp_id: pp_id,flbh2:flbh2}, function (data) {
                    $("#spu_list").empty();
                    $(data).each(function (i, json) {
                        $("#spu_list").append("<option value="+json.id+">"+json.shp_mch+"</option>")
                    })
                });
            }

            function show_val(attr_id,checked) {
                if(checked) {
                    $("#val_"+attr_id).show();
                } else {
                    $("#val_"+attr_id).hide();
                }
            }
        </script>
    </body>
</html>
