<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>

<%

  /*
    Date : 2022-07-02
    Notes : DB to JSP Test
  */

  request.setCharacterEncoding("utf-8");
  String userID = request.getParameter("userID");

  // DataBase 연결
  String url_mysql = "jdbc:mysql://localhost/education?serverTimeZone=UTC&characterEncoding=utf8&useSSl=false";
  String id_mysql = "root";
  String pw_mysql = "qwer1234";

  PreparedStatement ps = null;

  String query = "select scode , sname, sdept , sphone from student";
  JSONArray itemList = new JSONArray();

  try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql , id_mysql , pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();

    ResultSet rs = stmt_mysql.executeQuery(query);

    while(rs.next())
    {
      JSONObject tempJson = new JSONObject();
      tempJson.put("scode" , rs.getString(1));
      tempJson.put("sname" , rs.getString(2));
      tempJson.put("sdept" , rs.getString(3));
      tempJson.put("sphone" , rs.getString(4));
      itemList.add(tempJson);
    }
    conn_mysql.close();

    out.println(itemList);

  }catch(Exception ex){
    ex.printStackTrace();
  }finally{
  }
%>