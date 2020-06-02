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
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:true" style="height:50px">
            <div style="margin-top: 10px;margin-left:10px">
                一级分类：<select data-options='width:200' class="easyui-combobox" id="attr_class_1_select" onchange="get_attr_class_2(this.value)"><option>请选择分类</option></select>
                二级分类：<select data-options='width:200' class="easyui-combobox" id="attr_class_2_select" ><option>请选择分类</option></select>
            </div>
        </div>
        <div data-options="region:'west',split:true" style="width:100px">
            查询<br>
            <a href="javascript:goto_attr_add();" >添加</a><br>
            <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyAttr()">删除</a><br>
            修改<br>
        </div>
        <div data-options="region:'center'">
            <div id="attrListInner" class="easyui-datagrid"></div>
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            $('#attr_class_1_select').combobox({
                url: 'js/json/class_1.js',
                valueField:'id',
                textField:'flmch1',
                onChange:function get_attr_class_2() {
                    var class_1_id = $(this).combobox('getValue');
                    $('#attr_class_2_select').combobox({
                        url: "js/json/class_2_"+class_1_id+".js",
                        valueField: 'id',
                        textField: 'flmch2',
                        onChange:function () {
                            var flbh2 = $(this).combobox('getValue');
                            get_attr_list_json(flbh2);
                        }
                    });
                }
            })
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
            var class_2_id = $("#attr_class_2_select").combobox('getValue');
            console.log(class_2_id);
            //window.location.href="goto_attr_add.do?flbh2=" +class_2_id;
            add_tab("goto_attr_add.do?flbh2=" +class_2_id,"添加属性");
        }

        // function get_attr_list(flbh2) {
        //     异步查询
        //     $.post("get_attr_list.do",{flbh2:flbh2},function (data) {
        //         $("#attrListInner").html(data);
        //     })
        // }
        function get_attr_list_json(flbh2) {
            //异步查询
            $('#attrListInner').datagrid({
                url:'get_attr_list_json.do',
                queryParams:{
                    flbh2:flbh2
                },
                columns:[[
                    {field:'id',title:'id',width:100},
                    {field:'shxm_mch',title:'属性名',width:100},
                    {field:'list_value',title:'属性值',width:100,
                        formatter:function (value,row,index) {
                            var str = "";
                            $(value).each(function (i,json) {
                                str = str + json.shxzh + json.shxzh_mch + " ";
                            });
                            return str;
                        }},
                    {field: 'creat_time', title: '创建时间', width: 100,
                        formatter: function (value, row, index) {
                            var d = new Date(value);
                            var str = d.toLocaleString();
                            return str;
                        }
                    }
                ]]
            });
        }

        function destroyAttr(){
            var row = $('#attrListInner').datagrid('getSelected');
            if (row){
                $.messager.confirm('通知','确定要删除当前选中的数据吗?',function(r){
                    if (r){
                        $.post('delete_attr.do',{id:row.id},function(result){
                            if (result){
                                $('#attrListInner').datagrid('reload');    // reload the user data
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

    </script>
</body>
</html>
