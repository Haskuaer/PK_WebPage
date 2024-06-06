<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String theme;

    if(session.getAttribute("theme")!=null)  theme = session.getAttribute("theme").toString();
    else theme = "standard";
%>
<ul class="<%= theme %>-menu hidden" id="hidden-item">
    <a href="pk?page=index">
        <li>Home</li>
    </a>
    <a href="pk?page=calculator">
        <li>Calculator</li>
    </a>
    <a href="https://www.google.pl/?hl=pl">
        <li>Google</li>
    </a>
</ul>
<br>
<form class="login-box hidden" id="hidden-form" action="pk" method="post">
    <label for="login">Login:</label>
    <br>
    <input type="text" name="login" id="login" required>
    <br>
    <label for="password">Password:</label>
    <br>
    <input type="password" name="password" id="password" required>
    <br>
    <button class="<%= theme %>-sign-button" type="submit">Sign in</button>
    <p class="login-message-f">Login: FAILED</p>
</form>