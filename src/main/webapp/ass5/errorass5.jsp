<%-- 
    Document   : error
    Created on : Nov 4, 2020, 12:56:32 AM
    Author     : hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error page</title>
    </head>
    <body>
        <form name="meo1" action="servletass5" method="post">
            
            <%
                String quantity_i = request.getParameter("quantity");
                String customerName_i = request.getParameter("customerName");
                String customerPhone_i = request.getParameter("customerPhone");
                String customerEmail_i = request.getParameter("customerEmail");
                String CreditNum_i = request.getParameter("CreditNum");
                String expMonthCredit_i = request.getParameter("expMonthCredit");
                String expYearCredit_i = request.getParameter("expYearCredit");
                String processor = request.getParameter("processor");
                if(processor == null) processor = "Celeron D";
                
                String listname_pa = request.getParameter("listname");
                if(listname_pa == null) listname_pa = "Camera";
                
                String checkbox_pa = request.getParameter("monitor");
            %>
            
            <h2>Enter Your Information</h2>
            
            <table cellspacing="5">
                <tr>
                    <td align="right">
                        Number to purchase:<br>
                        (at least 1)
                    </td>
                    <td><input type="number" name="quantity" min="1" required="required" value=<%= quantity_i %>>*</td>
                </tr>
                <tr>
                    <td align="right">Your name:</td>
                    <td><input type="text" name="customerName" required="required" value=<%= customerName_i %>>*</td>
                </tr>
                <tr>
                    <td align="right">
                        Your phone:<br>
                        (in format xxx-xxx-xxxx)
                    </td>
                    <td>
                        <input type="text" name="customerPhone" maxlength="12" required="required" value=<%= customerPhone_i %>>
                        * <%= request.getAttribute("Phone_error") %>.
                    </td>
                </tr>
                <tr>
                    <td align="right">Your email:</td>
                    <td>
                        <input type="text" name="customerEmail" value=<%= customerEmail_i %>><i>(optional)</i> 
                        <%= request.getAttribute("Email_error") %>
                    </td>
                </tr>
                <tr>
                    <td rowspan="2">Credit Information</td>
                    <td>
                        Number:<input type="text" name ="CreditNum" required="required" maxlength="16" value=<%= CreditNum_i %>>
                        * <%= request.getAttribute("CreditNum_error") %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Expiration Date:
                        <input type="number" name="expMonthCredit" min="1" max="12" required="required" value=<%= expMonthCredit_i %>>
                        <input type ="number" name="expYearCredit" min="2000" max="2100" required="required" value=<%= expYearCredit_i %>>
                        <%= request.getAttribute("cal_error") %>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th>Processor</th>
                    <th>Accessories</th>
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="processor" value="Celeron D" <% if(processor.equals("Celeron D")){ %> checked <% } %>>
                        Celeron D<br>
                        <input type="radio" name="processor" value="Pentium IV" <% if(processor.equals("Pentium IV")){ %> checked <% } %>>
                        Pentium IV<br>
                        <input type="radio" name="processor" value="Pentium D" <% if(processor.equals("Pentium D")){ %> checked <% } %>>
                        Pentium D
                    </td>
                    <td>
                        <input type="checkbox" name="monitor" <% if(checkbox_pa != null){ %> checked="checked" <% } %>>
                        Monitor
                        <br>
                        <select name="listname" size="3">
                            <option value="Camera" <% if(listname_pa.equals("Camera")){ %> selected="selected" <% } %>>Camera</option>
                            <option value="Printer" <% if(listname_pa.equals("Printer")){ %> selected="selected" <% } %>>Printer</option>
                            <option value="Scanner" <% if(listname_pa.equals("Scanner")){ %> selected="selected" <% } %>>Scanner</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><br><br><input type="submit" value="Configure"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
