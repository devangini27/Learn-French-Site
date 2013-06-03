<%@ page language="java" import="java.sql.*"%>

<%
    int topicno,subno;
    String x;
    int i,j=0,rows,cols=4,values=0,temp,engopt;
    ResultSet rs=null;
    PreparedStatement ps=null,ps1=null,ps2=null;
    Connection con=null;
%>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Display
        </title>
    </head>
    <body>
       <table cellspacing="13">

<%
    topicno=Integer.parseInt(request.getParameter("topicno"));
    subno=Integer.parseInt(request.getParameter("subno"));
    
    try
    {
        //load driver
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection("jdbc:odbc:database","","");

        ps=con.prepareStatement("select imgortext from subtopic where topicno=? and subno=?");
        ps.setInt(1,topicno);
        ps.setInt(2,subno);
        ps.executeQuery();
        rs=ps.getResultSet();
        rs.next();
        x=rs.getString(1);

        if(x.equals("i"))
        {
            ps=con.prepareStatement("select engopt from images where topicno=? and subno=?");
            ps.setInt(1,topicno);
            ps.setInt(2,subno);
            ps.executeQuery();
            rs=ps.getResultSet();
            rs.next();
            if(rs.getString(1).equals("y"))
                engopt=1;
            else
                engopt=0;

            ps=con.prepareStatement("select imgno from images where topicno=? and subno=?");
            ps.setInt(1,topicno);
            ps.setInt(2,subno);
            ps.executeQuery();
            rs=ps.getResultSet();
            while(rs.next()) //get max imgno from table
            {
               if(values==0)
                   values=rs.getInt(1);
               else if((temp=rs.getInt(1))>values)
                   values=temp;
            }
            rows=values/cols+1;
            ps=con.prepareStatement("select src from images where topicno=? and subno=? and imgno=?");
            ps.setInt(1,topicno);
            ps.setInt(2,subno);
            ps2=con.prepareStatement("select french from images where topicno=? and subno=? and imgno=?");
            ps2.setInt(1,topicno);
            ps2.setInt(2,subno);

            if(engopt==1)
            {
                 ps1=con.prepareStatement("select name from images where topicno=? subno=? and imgno=?");
                 ps1.setInt(1,topicno);
                 ps1.setInt(2,subno);
            }
            for(i=0;i<rows;i++)
            {
                %> <tr>
                <%
                for(j=0;j<cols;j++)
                {
                    if(i*4+j+1<=values)
                    {
                       ps.setInt(3,i*4+j+1);
                       ps.executeQuery();
                       rs=ps.getResultSet();
                       rs.next();
                       x=rs.getString(1);
                       %>
                       <td><img src="images/<%=x%>.bmp" height="175" width="175" alt="pic not avail">
                       </td>
                       <%
                    }
                }
                %>
                </tr>
                <tr>
                <%
                    for(j=0;j<cols;j++)
                    {
                        if(4*i+j<=values)
                        {
                            ps2.setInt(3,4*i+j+1);
                            ps2.executeQuery();
                            rs=ps2.getResultSet();
                            rs.next();
                            %><td><center><label><%=rs.getString(1)%></label></center></td>
                            <%
                        }
                    }
                %>
                </tr>
                <%
                if(engopt==1)
                {
                    %><tr>
                    <%
                        for(j=0;j<cols;j++)
                        {
                            if(4*i+j+1<=values)
                            {
                                 ps1.setInt(3,4*i+j+1);
                                 ps1.executeQuery();
                                 rs=ps1.getResultSet();
                                 rs.next();
                    %><td><label><%=rs.getString(1)%></label></td>
                                 <%
                            }
                        }
                     %></tr>
                     <%
                }
            }
        }
        else //if(x.equals("t"))
        {
            ps=con.prepareStatement("select textno from text where topicno=? and subno=?");
            ps.setInt(1,topicno);
            ps.setInt(2,subno);
            ps.executeQuery();
            rs=ps.getResultSet();
            values=0;
            while(rs.next()) //get max textno from table
            {
               if(values==0)
                   values=rs.getInt(1);
               else if((temp=rs.getInt(1))>values)
                   values=temp;
            }%><%=values%><h1>hello</h1><%
            ps=con.prepareStatement("select eng,french from text where topicno=? and subno=? and textno=?");
            ps.setInt(1,topicno);
            ps.setInt(2,subno);
            
            for(i=0;i<values;i++)
            {
                %> <tr>
                <%
                    ps.setInt(3,i+1);
                    ps.executeQuery();
                    rs=ps.getResultSet();
                    rs.next();
                %><td><label><%=rs.getString(1)%></label>></td>
                <td><label><%=rs.getString(2)%></label>></td>
                    <%
                %>
                </tr><%
            }
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>
       </table>
    </body>
</html>