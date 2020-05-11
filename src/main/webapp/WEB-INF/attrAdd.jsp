<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/10
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script>

    </script>
    <title>管理系统</title>
</head>
<body>
    添加商品属性页面
    <hr>
    <form action="attr_add.do">
        <input type="hidden" value="${flbh2}" name="flbh2">
        <table border="1" width="800px">
            <tr><td>属性名：<input type="text" name="list_attr[0].shxm_mch"/></td><td></td><td>添加属性值</td></tr>
            <tr><td>属性值：<input type="text" name="list_attr[0].list_value[0].shxzh"/></td><td>单位：<input type="text" name="list_attr[0].list_value[0].shxzh_mch"/></td><td>删除</td></tr>
            <tr><td>属性值：<input type="text" name="list_attr[0].list_value[1].shxzh"/></td><td>单位：<input type="text" name="list_attr[0].list_value[1].shxzh_mch"/></td><td>删除</td></tr>
        </table>
        <table border="1" width="800px">
            <tr><td>属性名：<input type="text" name="list_attr[1].shxm_mch"/></td><td></td><td>添加属性值</td></tr>
            <tr><td>属性值：<input type="text" name="list_attr[1].list_value[0].shxzh"/></td><td>单位：<input type="text" name="list_attr[1].list_value[0].shxzh_mch"/></td><td>删除</td></tr>
            <tr><td>属性值：<input type="text" name="list_attr[1].list_value[1].shxzh"/></td><td>单位：<input type="text" name="list_attr[1].list_value[1].shxzh_mch"/></td><td>删除</td></tr>
        </table>
        添加：<input type="submit" value="提交">
    </form>

</body>
</html>
