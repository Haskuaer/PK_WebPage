<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String theme;

    if(session.getAttribute("theme")!=null)  theme = session.getAttribute("theme").toString();
    else theme = "standard";
%>
<hr>
<h3>You can change your account settings here:</h3>
<form method="post" action="pk">
    <label for="username">Username:</label>
    <input type="text" name="login-change" id="username"/><br>
    <label for="password">Password:</label>
    <input type="password" name="password-change" id="password"/><br>
    <button type="submit" class='<%= theme%>-button'>Change Settings</button>
</form>