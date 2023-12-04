<%-- 
    Document   : user
    Created on : Oct 6, 2023, 9:29:53 AM
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
        <link rel="stylesheet" href="user.css">
    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");

        %>
        <h1 id="greeting">Hello <%= user.getFullName()%></h1>

        <div id="searchBox">
            <div id="wrapper">
            <form action="MainController">
                <p style="color: white">Search Product </p><input type="text" name="search" class="searchText"/><br>
                <p style="color: white">Price Range </p>
            <input type="number" value="200" name="minPrice" min="200" max="10000" /> 
            <input type="number" value="200" name="maxPrice" min="200" max="10000" />
            <input type="submit" value="Search" name="btnAction" class="button"/> 
        </form>

        <%
            
            String message = (String) request.getAttribute("SEARCH_MESSAGE");
            if (message == null) {
                message = "";
            }
        %>

        <%--<%= message%>--%>
        
        </div>
        </div>

        <div class="tableBlock">
            <%List<MobileDTO> listMobile = (List<MobileDTO>) session.getAttribute("LIST_MOBILE");
                if (listMobile != null) {
                    if (!listMobile.isEmpty()) {%>
            <table border='1' class="table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Mobile ID</th>
                        <th>Mobile Name</th>
                        <th>Description</th>
                        <th>Year of product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Add to Cart</th>
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
                        <td><%= mobile.getDescription() %></td>
                        <td><%=mobile.getProductionYear()%></td>
                        <td><%=mobile.getPrice()%></td>
                        <td><input type="number" value="1" min="1" name="quantity"/></td>
                        <td>
                            <input type="submit" value="AddToCart" name="btnAction"/>
                            <input type="hidden" value="<%= mobile.getMobileId()%>" name="mobileId"/>
                            <input type="hidden" value="<%= mobile.getMobileName() %>" name="mobileName"/>
                            <input type="hidden" value="<%= mobile.getDescription()%>" name="description"/>
                            <input type="hidden" value="<%= mobile.getProductionYear() %>" name="productionYear"/>
                            <input type="hidden" value="<%= mobile.getPrice()%>" name="price"/>
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
            <%String shoppingMessage = (String) request.getAttribute("SHOPPING_MESSAGE");
                if(shoppingMessage == null){
                    shoppingMessage = "";
                }%>
                <p style="text-align: center; font-family: sans-serif; color: orange"><%= shoppingMessage %></p>
        <div id="otherOptions">
            <div class="otherOptionWrapper"><a href="viewcart.jsp" style="text-decoration: none">View Cart</a></div>
            <div class="otherOptionWrapper"><a href="LogoutController"style="text-decoration: none">Logout</a></div>
            
        </div>
    </body>
</html>
