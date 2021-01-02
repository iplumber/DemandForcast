<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/16
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DemandForcast.*"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%
  GetWeaterhDataFromDatabase weather = new GetWeaterhDataFromDatabase();
  Map<String,Double> sevenTemperature = new HashMap<>();
  weather.test(sevenTemperature);
  StringBuilder sb = new StringBuilder();
  for (String key :sevenTemperature.keySet()){
    sb.append(sevenTemperature.get(key) + ",");
  }
  sb.setLength(sb.length() - 1);
  String temperature = sb.toString();
  String date = null;
//  String temperature="3,23,5,4,8,3,8";
  int i = 200;
%>

<html>
  <head>
    <title>天气数据</title>
  </head>
  <body>
    </br>
    </br>
    <font face="仿宋" size="4" ><center>城市名称： </center> </font>

    <div id="test" style="height: 500px;"></div>
    <script src="https://cdn.jsdelivr.net/npm/echarts@4/dist/echarts.min.js?_v_=1607268016278"></script>
    <script>
      option = {
        xAxis: {
          type: 'category',
          data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun','Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', '1','2', '3', '4', '5', '6', '7']
        },
        yAxis: {
          type: 'value'
        },
        series: [{
          data: [<%=temperature%>],
          type: 'line'
        }]
      };
      var chart = echarts.init(document.getElementById('test'));
      chart.setOption(option);
    </script>
    <font face="行书" size="4"><center><%=i%> 日期 </center></font>
  </body>
</html>
