<%@ page language="java" import="java.sql.*"%>

<%
    int i,j;
    String x,y;
    ResultSet rs1=null,rs2=null;
    Statement st;
    PreparedStatement ps=null;
    Connection con=null;
%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Topics
        </title>
    </head>
    <body>
        <ol>

<%
    try
    {
        //load driver
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection("jdbc:odbc:database","","");
        st=con.createStatement();

        st.execute("select topicno from topic");
        rs1=st.getResultSet();

        while(rs1.next())
        {
             ps=con.prepareStatement("select topicname from topic where topicno=?");
             i=rs1.getInt(1);
             ps.setInt(1,i);
             ps.executeQuery();
             rs2=ps.getResultSet();
             rs2.next();
             x=rs2.getString(1);
             %><li>
             <a href="contents.jsp?topic=<%=x%>"><%=x%></a>
                   <ol>
                   <%
                       j=0;
                       ps=con.prepareStatement("select subname from subtopic where topicno=? order by subno");
                       ps.setInt(1,i);
                       ps.executeQuery();
                       rs2=ps.getResultSet();
                       while(rs2.next())
                       {
                           j++;
                           y=rs2.getString(1);
                           %>
                           <li>
                               <a href="display.jsp?topicno=<%=i%>&subno=<%=j%>" target="lower"><%=y%></a> </li>
                           <%
                       }
                   %>
                   </ol>
             </li> <%
         }
    }
    catch(Exception e)
    {
       e.printStackTrace();
    }
%>

        </ol>
    </body>
</html>
