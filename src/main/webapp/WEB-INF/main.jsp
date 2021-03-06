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
    <link rel="stylesheet" type="text/css" href="js/easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
    <script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
    <script>

        $(function () {
            var url = "${url}";
            var title = "${title}";
            if (url != "" && title != "") {
                add_tab(url,title);
            }
        });

        function add_tab(url,title) {
            var b = $('#tt').tabs('exists',title);
            if(!b) {
                $('#tt').tabs('add', {
                    title: title,
                    href: url,
                    closable: true,
                    tools: [{
                        iconCls: 'icon-mini-refresh',
                        handler: function () {
                            alert('refresh');
                        }
                    }]
                });
            } else {
                $('#tt').tabs('select', title);
            }
        }
    </script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">
        <h3>Mall后台管理系统</h3>
    </div>
    <div data-options="region:'west',split:true,title:'管理选择'" style="width:200px;padding:10px;">
        <div class="easyui-accordion" style="width:180px">
            <div title="商品信息模块" data-options="iconCls:'icon-ok'">
                <ul>
                    <li>
                        <a href="javascript:add_tab('goto_spu.do','商品信息管理')">商品信息管理</a>
                    </li>
                    <li>
                        <a href="javascript:add_tab('goto_attr.do','商品属性管理')">商品属性管理</a>
                    </li>
                    <li>
                        <a href="javascript:add_tab('goto_sku.do','商品库存单元管理')">商品库存单元管理</a>
                    </li>
                </ul>
            </div>
            <div title="用户信息模块" data-options="iconCls:'icon-ok'">
                <ul>
                    <li>
                        <a href="javascript:add_tab('goto_order.do','商品订单管理')">商品订单管理</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div data-options="region:'east',split:true,collapsed:true,title:'帮助'" style="width:100px;padding:10px;">
        east region
    </div>
    <div data-options="region:'center',title:'主页面'">
        <div id="tt" class="easyui-tabs" style="height: 500px">

        </div>
    </div>
</body>
</html>
