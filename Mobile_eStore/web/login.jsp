<%-- 
    Document   : login
    Created on : Oct 3, 2023, 3:53:32 PM
    Author     : phuoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="loginStyle.css">
    </head>
    <body>
        <div class="wrapper">
            <div class="loginBlock">
                <h1 style="font-family: sans-serif">WELCOME</h1>
                <form action="MainController" class="loginForm">
                    User ID <br>
                    <input type="text" name="userId" class="textBox"/><br>
                    Password<br>
                    <input type="password" name="password" class="textBox"/><br>
                    <div class="btn_group">
                        <input type="submit" value="Login" name="btnAction" class="button"/>
                        <input type="reset" value="Reset" class="button" />
                    </div>
                </form>
                <%
                    String loginError = (String) request.getAttribute("LOGIN_ERROR");
                    if (loginError == null) {
                        loginError = "";
                    }
                %>
                <p style="color: red"><%=loginError%><p>
            </div>

        </div>
    </body>
</html>
