<%-- 
    Document   : order
    Created on : Nov 1, 2023, 5:00:20 PM
    Author     : phuoc
--%>

<%@page import="phuocbt.Shopping.Cart"%>
<%@page import="phuocbt.Shopping.Mobile"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="orderStyle.css">
    </head>
    <body>
        <h1 style="text-align: center">Thank You For Purchase</h1>
        <div class="tableBlock">
            <%
            Cart cart = (Cart) session.getAttribute("CART");
            if(cart!=null){
        %>
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
                    <th>Total</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <%
                        int count = 0;
                        float totalPrice = 0;
                        for (Mobile mobile : cart.getCart().values()) {
                            totalPrice += mobile.getQuantity() * mobile.getPrice();
                %>
            <form action='MainController'>
                <tr>
                    <td><%= ++count%></td>
                    <td><%= mobile.getMobileId()%></td>
                    <td><%= mobile.getMobileName()%></td>
                    <td><%= mobile.getDescription()%></td>
                    <td><%=mobile.getProductionYear()%></td>
                    <td><%=mobile.getPrice()%></td>
                    <td><%=mobile.getQuantity()%></td>
                    <td><%=mobile.getQuantity() * mobile.getPrice()%></td>
                    <td>
                        <input type="submit" value="Remove" name="btnAction"/>
                        <input type="hidden" value="<%= mobile.getMobileId()%>" name="mobileId"/>
                    </td>
                </tr>
            </form>
            <%}%>
        </tbody>
    </table>
        <h3>Total price: <%=totalPrice%></h3>
    <%
        }
%>
        </div>
        <div>
            <%String paymentMethod = (String) request.getAttribute("PAYMENT_METHOD");%>
    
            <h3 style="text-align: center">Payment Method: <%=paymentMethod%></h3>
        </div>
        <div id="linkcontainer"><div style="background-color: white; padding: 1%;"><a href="user.jsp" style="text-decoration: none">Back to Shopping</a></div></div>
    </body>
</html>
