<%@ page language="java" import="java.sql.*"%>

<%
    String msg="";
%>

<html>
   <head>
      <link rel="shortcut icon" href="images/flag.bmp" type="image/x-icon">
      <link rel="stylesheet" type="text/css" href="style.css">
      <title>French
      </title>
   </head>

   <body>

    <%
       if(request.getParameter("msg")!=null)
          msg=msg+request.getParameter("msg");
    %>

    <h1>
      Le Francais
    </h1>
   <table>
    <form action="login.jsp" method="post">

    <tr>
       <td>
         <label>ID</label>
       </td>
       <td>
       <input type="text" size="20" name="id">
       </td>
    </tr>
    <tr>
       <td>
       <label>PASSWORD</label>
       </td>
       <td>
       <input type="password" size="20" name="pwd">
       </td>
    <tr>
       <td>
       <input type="Submit" value="Login">
       </td>
       <td> <%=msg%>
       </td>
    </tr>
    <tr>
    </tr>
    <tr>
      <td>
         <a href="signup.jsp?name=&id=&age=&pwd=">Signup</a>
      </td>
    </tr>

    </form>
   </table>
    <img src="images/eiffel.bmp" style="position:absolute;top:240;left:20;heigth:500;width:230"1 alt="pic not available">

    <img src="images/cat.bmp" style="position:absolute;top:120;left:260;heigth:420;width:400"1 alt="pic not available">

    <img src="images/bonjour.bmp" style="position:absolute;top:120;left:680;heigth:200;width:300"1 alt="pic not available">

    <img src="images/snail.bmp" style="position:absolute;top:370;left:680;heigth:300;width:300"1 alt="pic not available">
   </body>
</html>
