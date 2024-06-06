
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String theme;

    if(session.getAttribute("theme")!=null)  theme = session.getAttribute("theme").toString();
    else theme = "standard";
%>
<ul class="<%= theme%>-menu hidden" id="hidden-item" onload="setTheme('<%= theme %>')">

    <a href="pk?page=user-home">
        <li>User Home</li>
    </a>
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
<div class="<%= theme%>-login-message-p">Zalogowano!<br>
    <a href='pk?action=logout'><button class='<%= theme%>-button'>Log out</button></a>
</div>
