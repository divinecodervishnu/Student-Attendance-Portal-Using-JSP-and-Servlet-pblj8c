import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AttendanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String status = request.getParameter("status");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school", "root", "yourpassword");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO attendance(student_name, date, status) VALUES(?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, date);
            ps.setString(3, status);
            ps.executeUpdate();

            out.println("<h3>Attendance marked successfully!</h3>");
            out.println("<a href='viewAttendance.jsp'>View Records</a>");
            con.close();

        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
}