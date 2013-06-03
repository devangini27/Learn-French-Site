
<%@ page language="java"%>

<%
    String pname;
%>

<html>
   <head>
       <link rel="shortcut icon" href="images/flag.bmp" type="image/x-icon">
      <title>Signup
      </title>
   <link rel="stylesheet" type="text/css" href="style.css">
   
   <script type="text/javascript">

       function isEmpty(aTextField)
       {
              if ((aTextField.value.length==0) ||(aTextField.value==null))
              {
                  return true;
              }
              else
              {
                   return false;
              }
       }

       function check()
       {
             //check for empty fields

             if (isEmpty(name)==true)
                alert("name field should not be empty");

             return;
       }

   </script>

   </head>
   <body>

<%
   //get param
   pname=request.getParameter("name");
%>

     <h1>Signup</h1>
     <br>
     <br>
     <center>
     <form action="sign.jsp" method="post">
       <table>
          <tr>
             <td>Name<%=pname%>
             </td>
             <td>
                 <input type="text" size="20" name="name" value=<%=pname%>>
             </td>
          </tr>
          <tr>
             <td>Age
             </td>
             <td><input type="text" size="20" name="age">
             </td>
          </tr>
          <tr>
             <td>Id
             </td>
             <td><input type="text" size="20" name="id">
             </td>
             <td>
             </td>
          </tr>
          <tr>
             <td>Password
             </td>
             <td><input type="password" size="20" name="pwd">
             </td>
          </tr>
          <tr>
             <td>Re-type password
             </td>
             <td><input type="password" size="20" name="repwd">
             </td>
          </tr>
          <tr>
             <td><input type="submit" value="signup" onclick="check()">
             </td>
          </tr>
       </table>
     </form>
     </center>
   </body>
</html>