<%@ page language="java" import="java.sql.*" %>

<%
    ResultSet rs=null;
    PreparedStatement ps=null;
    String msg=null;
    String id;
    Connection con=null;
%>

<html>
   <body>
      <center> data received from client </center>

    <%
       id= request.getParameter("id");
    %>

    username :<%=id%><br>

<%
    try
    {
        //load driver
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con = DriverManager.getConnection("jdbc:odbc:db2Table1","","");

        ps=con.prepareStatement("select * from Table1 where id=?");
        ps.setString(1,id);
        ps.executeQuery();
        rs=ps.getResultSet();
        if(rs==null)
        {
            msg="Available";
        }
        else
        {
            msg="Not available";
        }

        ps.close();
        con.close();
    }

    catch(Exception e)
    {
       e.printStackTrace();
    }
%>

</body>
</html>


