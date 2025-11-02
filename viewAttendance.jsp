<%@ page import="java.sql.*" %>
<html>
<head><title>Attendance Records</title></head>
<body>
<h2>Attendance Records</h2>
<table border="1">
<tr><th>ID</th><th>Name</th><th>Date</th><th>Status</th></tr>
<%
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
      "jdbc:mysql://localhost:3306/school", "root", "yourpassword");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM attendance");
    while (rs.next()) {
%>
<tr>
  <td><%=rs.getInt("id")%></td>
  <td><%=rs.getString("student_name")%></td>
  <td><%=rs.getDate("date")%></td>
  <td><%=rs.getString("status")%></td>
</tr>
<%
    }
    con.close();
  } catch (Exception e) { out.println(e); }
%>
</table>
</body>
</html>