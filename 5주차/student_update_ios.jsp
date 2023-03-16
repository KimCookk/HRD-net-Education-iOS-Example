<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>title</title>
    </head>
    <body>
        <%
          request.setCharacterEncoding("utf-8");
          String code = request.getParameter("code");
          String name = request.getParameter("name");
          String dept = request.getParameter("dept");
          String phone = request.getParameter("phone");


          // DataBase 연결
          String url_mysql = "jdbc:mysql://localhost/education?serverTimeZone=UTC&characterEncoding=utf8&useSSl=false";
          String id_mysql = "root";
          String pw_mysql = "qwer1234";

          PreparedStatement ps = null;

          try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn_mysql = DriverManager.getConnection(url_mysql , id_mysql , pw_mysql);
            Statement stmt_mysql = conn_mysql.createStatement();

            String query = "update student set sname = ? , sdept = ? , sphone = ? where scode = ?";
            ps = conn_mysql.prepareStatement(query);
            ps.setString(1 , name);
            ps.setString(2 , dept);
            ps.setString(3 , phone);
            ps.setString(4 , code);
            ps.executeUpdate();

            conn_mysql.close();
          }catch(Exception ex){
            ex.printStackTrace();
          }finally{
            out.println("수정 되었습니다.");
          }
        %>
    </body>
</html>
