<%--
  Created by IntelliJ IDEA.
  User: 谈一乐
  Date: 2020/5/1
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
        function click_image(index) {

            //从选择图片开始，主线程会继续往下执行，该处函数会阻塞
            $("#file_"+index).click();
        }
        
        function replace_image(index) {
            //获得图片
            var blob_image = $("#file_"+index)[0].files[0];
            var url = window.URL.createObjectURL(blob_image);

            //替换image
            $("#image_"+index).attr("src",url);

            var length = $(":file").length;
            if((index+1) == length) {
                add_image(index);
            }


        }

        function add_image(index) {
            var div_begin = '<div id="d_'+(index+1)+'" style="float: left;margin-left: 10px;border: 1px greenyellow solid;">';
            var input = '<input id="file_'+(index+1)+'" type="file" name="files" style="display: none" onchange="replace_image('+(index+1)+')"/>';
            var img = '<img id="image_'+(index+1)+'" onclick="click_image('+(index+1)+')" style="cursor: pointer;" src="image/upload.jpg" width="100px"/>';
            var div_end = '</div>'
            $("#d_"+index).after(div_begin+input+img+div_end);
        }
    </script>
    <title>Title</title>
</head>
<body>
    spu信息添加页面${spu.flbh1}-${spu.flbh2}-${spu.pp_id}
    <form action="spu_add.do" enctype="multipart/form-data" method="post">
        <input type="hidden" name="flbh1" value="${spu.flbh1}"/>
        <input type="hidden" name="flbh2" value="${spu.flbh2}"/>
        <input type="hidden" name="pp_id" value="${spu.pp_id}"/>
        商品名称:<input name="shp_mch" type="text" /><br>
        商品描述:<textarea  name="shp_msh" rows="10" cols="50"></textarea><br>
        商品图片:<br>
        <div id="d_0" style="float: left;margin-left: 10px;border: 1px greenyellow solid;">
            <input id="file_0" type="file" name="files" style="display: none" onchange="replace_image(0)"/>
            <img id="image_0" onclick="click_image(0)" style="cursor: pointer;" src="image/upload.jpg" width="100px"/>
        </div>

        <input type="submit" value="提交"/><br>
    </form>
</body>
</html>
