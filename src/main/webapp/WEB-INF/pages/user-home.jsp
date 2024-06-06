<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>PK</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<%
    String theme;

    if(session.getAttribute("theme")!=null)  theme = session.getAttribute("theme").toString();
    else theme = "standard";
%>
<body class="<%= theme %>">
<header>
    Header
</header>
<main>
    <nav>
        <img src="images/logo.png" alt="logo_pk"/>
        <br>
        <button class="showButton" onclick="showMenu()">
            <span class="menu-logo"></span>
        </button>
        <br>
        <%
            boolean logged = session.getAttribute("user") != null;

            if(logged){

        %>
        <jsp:include page="logged.jsp"/>
        <%
        } else {
        %>
        <jsp:include page="menu.jsp"/>
        <%
            }
        %>
        <br>
        <p id="date">DATE: TODO</p>
        <br>
        <p id="time">TIME: TODO</p>
    </nav>
    <section>
        <%
            if(logged){

                String user = session.getAttribute("user").toString();
                String status = session.getAttribute("status").toString();
        %>
        <h3>Witaj, <%= user %>!</h3>
        <jsp:include page="account-settings.jsp"/>
        <%
            if("admin".equals(status)){
        %>
        <hr>
        <h3>Set page theme:</h3>
        <form id="setTheme" method="get" action="pk">
            <input type="radio" id="standard" name="theme" value="standard" <% if ("standard".equals(theme)) { %> checked <% }  %>>
            <label for="standard">Standard</label><br>
            <input type="radio" id="dark" name="theme" value="dark" <% if ("dark".equals(theme)) { %> checked <% }  %> >
            <label for="dark">Dark</label><br>
            <button class="<%= theme %>-button" type="submit">Change Theme</button>
        </form>
        <hr>
        <jsp:include page="user-list.jsp" />
        <%
            }
        } else {
        %>
        <h3>Witaj!</h3>
        <%
            }
        %>
    </section>
</main>
<footer>
    Footer
</footer>
<script src="js/myScript.js"></script>
</body>
</html>