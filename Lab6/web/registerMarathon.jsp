<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Marathon Registration</title>
</head>
<body>
    <form action="processMarathon.jsp" method="POST">
        <fieldset style="width: 350px;">
            <legend>Marathon Registration</legend>
            <table border="0">
                <tr>
                    <td>IC No:</td>
                    <td><input type="text" name="icno" placeholder="E.g. 921110-10-2514" required /></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" placeholder="Enter your name" required /></td>
                </tr>
                <tr>
                    <td>Category (Category):</td>
                    <td>
                        <select name="category">
                            <option value="5 KM">5 KM</option>
                            <option value="7 KM">7 KM</option>
                            <option value="10 KM">10 KM</option>
                        </select>
                    </td>
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