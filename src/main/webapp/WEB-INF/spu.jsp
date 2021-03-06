<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/1
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <base href="<%=basePath %>">--%>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>spu商品信息管理</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:true" style="height:50px">
            <div style="margin-top: 10px;margin-left:10px">

                一级分类：<select data-options='width:200' class="easyui-combobox" id="class_1_select" onchange="get_class_2(this.value)"><option>请选择分类</option></select>
                二级分类：<select data-options='width:200' class="easyui-combobox" id="class_2_select"><option>请选择分类</option></select>
                商标分类：<select data-options='width:200' class="easyui-combobox" id="class_tm_select"><option>请选择分类</option></select>
                <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="goto_spu_add()">添加商品信息</a>
            </div>
        </div>

        <div data-options="region:'center'">
            <table id="dg" title="My Users" class="easyui-datagrid" style="width:1000px;height: auto"
                   url="select_spu.do"
                   toolbar="#toolbar"
                   rownumbers="true" fitColumns="true" singleSelect="true">
                <thead>
                <tr>
                    <th field="id" width="50">id</th>
                    <th field="shp_mch" width="60">商品名称</th>
                    <th field="shp_msh" width="80">商品描述</th>
                    <th field="flbh1" width="20">分类编号1</th>
                    <th field="flbh2" width="20">分类编号2</th>
                    <th field="pp_id" width="20">商品id</th>
                    <th field="creat_time" width="50" >创建时间</th>
                </tr>
                </thead>
            </table>
            <div id="toolbar">
                <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editSpu()">修改</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroySpu()">删除</a>
            </div>

            <div id="spu-dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
                 closed="true" buttons="#spu-dlg-buttons">
                <div class="ftitle">商品信息修改</div>
                <form id="spu-fm" method="post">
                    <div class="fitem" style="width: auto;height: 40px">
                        <label>商品名称：</label>
                        <input name="shp_mch" class="easyui-validatebox" style="width: 270px;height: 35px" required="true">
                    </div>
                    <div class="fitem" style="width: auto;height: 60px">
                        <label>商品描述：</label>
                        <input name="shp_msh" class="easyui-validatebox" style="width: 270px;height: 35px" required="true">
                    </div>
                </form>
            </div>
            <div id="spu-dlg-buttons">
                <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveSpu()">保存</a>
                <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#spu-dlg').dialog('close')">取消</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            $('#class_1_select').combobox({
                url: 'js/json/class_1.js',
                valueField:'id',
                textField:'flmch1',
                onChange:function get_class_2() {
                    var class_1_id = $(this).combobox('getValue');
                    $('#class_2_select').combobox({
                        url: "js/json/class_2_"+class_1_id+".js",
                        valueField: 'id',
                        textField: 'flmch2'
                    });
                    $('#class_tm_select').combobox({
                        url: "js/json/tm_class_1_"+class_1_id+".js",
                        valueField: 'id',
                        textField: 'ppmch'
                    });
                }
            })
        });

        function destroySpu(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('通知','确定要删除当前选中的数据吗?',function(r){
                    if (r){
                        $.post('delete_spu.do',{id:row.id},function(result){
                            if (result){
                                $('#dg').datagrid('reload');    // reload the user data
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

        function editSpu(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#spu-dlg').dialog('open').dialog('setTitle','修改信息');
                $('#fm').form('load',row);
                url = 'update_spu.do?id='+row.id;
            } else {
                alert("请选择一条数据操作");
            }
        }

        function saveSpu(){
            console.log(url)
            $('#spu-fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    if (result){
                        $('#spu-dlg').dialog('close');		// close the dialog
                        $('#dg').datagrid('reload');	// reload the user data
                    } else {
                        $.messager.show({
                            title: 'Error',
                            msg: "操作失败"
                        });
                    }
                }
            });
        }

        function goto_spu_add() {
            var class_1_id = $("#class_1_select").combobox('getValue');
            var class_2_id = $("#class_2_select").combobox('getValue');
            var tm_id = $("#class_tm_select").combobox('getValue');
            if (tm_id === "请选择分类") {
                alert("请选择分类");
            }
            else {
                url = "goto_spu_add.do?flbh1=" +class_1_id
                    +"&flbh2=" +class_2_id
                    +"&pp_id=" +tm_id;
                add_tab(url,'SPU添加页面');
            }
        }
    </script>
</body>
</html>
