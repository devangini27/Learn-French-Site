<%@ page language="java" import="java.sql.*" %>

<%
    ResultSet rs=null;
    PreparedStatement ps=null;
    String msg=null;
    String id;
    String pwd;
    Connection con=null;
%>

<html>
   <body>
      <center> data recieved from client <center>

    <%
       id= request.getParameter("t1");
       pwd= request.getParameter("t2");
    %>

    username :<%=id%><br>
    password :<%=pwd%>

<%
    try
    {
        //load driver
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con = DriverManager.getConnection("jdbc:odbc:db2Table1","","");

        ps=con.prepareStatement("insert pwd from Table1 where id=?");
        ps.setString(1,id);
        ps.executeQuery();
        rs=ps.getResultSet();

        if(rs==null)
        {
            msg="No such id";
        }
        else
        {
            rs.next();
            String pwdd=rs.getString(1);
            if(pwdd.equals(pwd))
            {
                msg="Welcome to website";
            }
            else
            {
                msg="Unsuccessful login";
            }
        }
        ps.close();
        con.close();
    }

    catch(Exception e)
    {
       e.printStackTrace();
    }
%>

<%=msg%>

</body>
</html>

