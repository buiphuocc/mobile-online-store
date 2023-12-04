<%-- 
    Document   : staff
    Created on : Oct 6, 2023, 9:30:23 AM
    Author     : phuoc
--%>

<%@page import="java.util.List"%>
<%@page import="phuocbt.Mobile.MobileDTO"%>
<%@page import="phuocbt.User.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="staffStyle.css">
    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");   
            String search = (String) request.getAttribute("search");
            if(search == null){
                search = "";
            }
        %>
        <h1 style="text-align: center">Hello <%= user.getFullName()%></h1>
        
        <div class="wrapper">
            <div class="searchBlock">
                <div class="searchBox">
        <form action="MainController">
            <p style="color: black">Search product (id or name)</p><input type="text" name="search" value="<%= search%>"/><br>
            <input type="submit" value="Search" name="btnAction" class="button"/> 
        </form>

        <%
            
            String message = (String) request.getAttribute("SEARCH_MESSAGE");
            String error = (String) request.getAttribute("SEARCH_ERROR");
            if (message == null) {
                message = "";
            }
            if(error == null){
                error = "";
            }
        %>

        <p style="color: black"><%= message%></p>
        <p style="color: black"><%=error%></p>
                </div>
            </div>
        <div class="tableBlock">
            <%List<MobileDTO> listMobile = (List<MobileDTO>) request.getAttribute("LIST_MOBILE");
                if (listMobile != null) {
                    if (!listMobile.isEmpty()) {%>
            <table border='2' class="table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Mobile ID</th>
                        <th>Mobile Name</th>
                        <th>Description</th>
                        <th>Year of product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Not Sale</th>
                        <th>Delete</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 0;
                        for (MobileDTO mobile : listMobile) {%>
                <form action='MainController'>
                    <tr>
                        <td><%= ++count%></td>
                        <td><%= mobile.getMobileId()%></td>
                        <td><%= mobile.getMobileName()%></td>
                        <td><input type="text" value="<%= mobile.getDescription()%>" name="description"/> </td>
                        <td><%=mobile.getProductionYear()%></td>
                        <td><input type="text" value="<%=mobile.getPrice()%>" name="price"/></td>
                        <td><input type="text" value="<%=mobile.getQuantity()%>" name="quantity"/></td>
                        <td><input type="text" value="<%= mobile.isNotSale() %>" name="notSale"/></td>
                        <td>
                            <input type="submit" value="Delete" name="btnAction"/>
                            <input type="hidden" value="<%= mobile.getMobileName()%>" name="mobileName"/>
                            <input type="hidden" value="<%=search%>" name="search"/>
                        </td>
                        <td>
                            <input type="submit" value="Update" name="btnAction"/>
                            <input type="hidden" value="<%= mobile.getMobileName()%>" name="mobileName"/>
                            <input type="hidden" value="<%=search%>" name="search"/>
                        </td>
                    </tr>
                </form>
                <%}%>
                </tbody>
            </table>
            <%  }
                }

                
            %>
        </div>
        <%
            String updateFail = (String) request.getAttribute("UPDATE_FAIL");
            if(updateFail == null){
                updateFail = "";
            }
        %>
        <%=updateFail%>
        
        <div id="linkcontainer"><div style="background-color: white; padding: 1%;"><a href="LogoutController"style="text-decoration: none">Logout</a></div></div>
                </div>
    </body>
</html>
