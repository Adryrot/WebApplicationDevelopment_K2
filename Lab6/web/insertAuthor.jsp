<%-- 
    Document   : insertAuthor
    Created on : 17 May 2026, 6:23:02 pm
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Lab 6 - Task 2</title>
</head>
<body>
    <h2>Lab 6 - Task 2 - Perform creating and retrieving records via JSP page</h2>
    <form action="processAuthor.jsp" method="POST">
        <fieldset style="width: 300px;">
            <legend>Author Registration</legend>
            <table border="0">
                <tr>
                    <td>Author No:</td>
                    <td><input type="text" name="authno" placeholder="E.g. UKXXXXX" required /></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" placeholder="Enter your name" required /></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" placeholder="Enter your address" required /></td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td><input type="text" name="city" placeholder="Enter your city" required /></td>
                </tr>
                <tr>
                    <td>State:</td>
                    <td><input type="text" name="state" placeholder="Enter your state" required /></td>
                </tr>
                <tr>
                    <td>Zip:</td>
                    <td><input type="text" name="zip" placeholder="Enter your zip" required /></td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <input type="submit" value="Submit" />
                        <input type="reset" value="Cancel" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
    <br>
</body>
</html>