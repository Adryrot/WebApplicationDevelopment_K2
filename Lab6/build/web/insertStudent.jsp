<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
</head>
<body>
    <form action="processStudent.jsp" method="POST">
        <fieldset style="width: 350px;">
            <legend>Student Registration</legend>
            <table border="0">
                <tr>
                    <td>Student No:</td>
                    <td><input type="text" name="stuno" placeholder="E.g.: UKXXXXX" required /></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" placeholder="Enter your name" required /></td>
                </tr>
                <tr>
                    <td>Program:</td>
                    <td>
                        <select name="program">
                            <option value="BSc. Soft. Eng.">BSc. Soft. Eng.</option>
                            <option value="BSc. with IM">BSc. with IM</option>
                            <option value="BSc. in Networking">BSc. in Networking</option>
                            <option value="BSc. in Robotics">BSc. in Robotics</option>
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