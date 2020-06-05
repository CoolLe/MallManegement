<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/6/3
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>商品订单信息</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'center'">
            <table id="order-dg" title="订单信息" class="easyui-datagrid" style="width:1000px;height: auto"
                   url="select_order.do"
                   toolbar="#order-toolbar"
                   rownumbers="true" fitColumns="true" singleSelect="true">
                <thead>
                <tr>
                    <th field="id" width="20">id</th>
                    <th field="user_id" width="20">用户id</th>
                    <th field="shp_id" width="20">商品id</th>
                    <th field="order_id" width="50">订单id</th>
                    <th field="count" width="20">商品数量</th>
                    <th field="create_time" width="30" >创建时间</th>
                    <th field="state" width="30" >订单状态</th>
                </tr>
                </thead>
            </table>
            <div id="order-toolbar">
                <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editOrder()">修改订单状态</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyOrder()">删除订单</a>
            </div>

            <div id="order-dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
                 closed="true" buttons="#order-dlg-buttons">
                <div class="ftitle">商品信息修改</div>
                <form id="fm" method="post">
                    <div class="fitem" style="width: auto;height: 40px">
                        <label>订单状态：</label>
                        <input name="state" class="easyui-validatebox" style="width: 270px;height: 35px" required="true">
                    </div>
                </form>
            </div>
            <div id="order-dlg-buttons">
                <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveOrder()">保存</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#order-dlg').dialog('close')">取消</a>
            </div>
        </div>
    </div>


    <script>
        function destroyOrder(){
            var row = $('#order-dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('通知','确定要删除当前选中的订单数据吗?',function(r){
                    if (r){
                        $.post('delete_order.do',{id:row.id},function(result){
                            if (result){
                                $('#order-dg').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: "删除失败"
                                });
                            }
                        },'json');
                    }
                });
            } else {
                alert("请选择一条数据操作")
            }
        }

        function editOrder(){
            var row = $('#order-dg').datagrid('getSelected');
            if (row){
                $('#order-dlg').dialog('open').dialog('setTitle','修改订单状态');
                $('#fm').form('load',row);
                url = 'update_order.do?id='+row.id;
            } else {
                alert("请选择一条数据操作");
            }
        }

        function saveOrder(){
            console.log(url)
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    if (result){
                        $('#order-dlg').dialog('close');		// close the dialog
                        $('#order-dg').datagrid('reload');	// reload the user data
                    } else {
                        $.messager.show({
                            title: 'Error',
                            msg: "操作失败"
                        });
                    }
                }
            });
        }
    </script>
</body>
</html>
