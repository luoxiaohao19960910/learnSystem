<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/12
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加试卷</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .main{
            width: 500px;
            height: 500px;
            margin: 0 auto;
        }
        form>p{

        }
    </style>
    <script src="../../lib/layui/layui.js"></script>
</head>
<body>
<div class="main">
<form action="/addPaper.html" method="post">
    <p>试卷名：<input type="text" name="paperName"></p>
    <p>出题人：<input type="text" name="userName"></p>
    <p>考试时限：<input type="text" name="paperTime"></p>
    <div class="layui-form-item">
        <label class="layui-form-label">开考时间：</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" id="bir" name="startTime" value="${user_info.birthday}" placeholder="请选择开考时间">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">结束时间:</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" id="bir2" name="endTime" value="${user_info.birthday}" placeholder="请选择开考时间">
        </div>
    </div>
    <p>单选：<input type="text" name="sinChoice"> 分数：<input type="text" name="sinScore"></p>
    <p>多选：<input type="text" name="mulChoice"> 分数：<input type="text" name="mulScore"></p>
    <p>判断：<input type="text" name="judge"> 分数：<input type="text" name="judScore"></p>
    <p>解答：<input type="text" name="answer"> 分数：<input type="text" name="ansScore"></p>
    <p>总分：<input type="hidden" name="score"></p>
    <p><input lay-filter="add" lay-submit
              type="submit" value="提交" style="margin:0 30px"><input type="reset" value="重置"></p>
</form>
</div>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#bir' //指定元素
        });
    });
    layui.use('laydate', function () {
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#bir2' //指定元素
        });
    });
</script>
</body>
<script>
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;
        form.on('submit(add)', function (data) {
            console.log(data);
            $.ajax({
                url:data.form.action,
                type:data.form.method,
                data:data.field,
                dataType: "json",
                success: function(data){
                    $.each(data,function(i,n){
                        console.log(n);//显示name和test
                    });
                }
            });
            layer.alert("添加成功", {icon: 6}, function () {
                // 获得frame索引
                window.parent.location.reload();
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
        });
    });
</script>
</html>
