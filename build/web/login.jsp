<%@ page language="java" import="java.sql.*"%>

<%
    ResultSet rs=null;
    PreparedStatement ps=null;
    String id;
    String pwd;
    Connection con=null;
%>

<html>
   <body>
      <center> data received from client </center>

    <%
       id=request.getParameter("id");
       pwd=request.getParameter("pwd");
    %>

<%
    try
    {
        //load driver
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con = DriverManager.getConnection("jdbc:odbc:database","","");

        ps=con.prepareStatement("select pwd from login where id=?");
        ps.setString(1,id);
        ps.executeQuery();
        rs=ps.getResultSet();

        if(rs!=null)
        {
            rs.next();
            String pwdd=rs.getString(1);
            if(pwdd.equals(pwd))
            {
                //redirection to main page
                response.sendRedirect("main.html");
            }
            else
                response.sendRedirect("index.jsp?msg=wrong id or password");
        }
        ps.close();
        con.close();
        
    }

    catch(Exception e)
    {
        response.sendRedirect("index.jsp?msg=wrong id or password");
       e.printStackTrace();
    }
%>

</body>
</html>


