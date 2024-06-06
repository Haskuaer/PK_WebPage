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
        <p>Mathematical Operations</p>
        <form>
            <input type="radio" id="addition" name="operations" value="addition">
            <label for="addition">(+) Addition</label>
            <br>
            <input type="radio" id="division" name="operations" value="division">
            <label for="division">(/) Division</label>
            <br>
            <input type="radio" id="quadratic" name="operations" value="quadratic">
            <label for="quadratic">(ax²+bx+c) Quadratic Equation Roots</label>
            <br>
            <span id="operationData">
                            <input type="text" id="firstNumber" style="display:none">
                            <input type="text" id="secondNumber" style="display:none">
                            <input type="text" id="thirdNumber" style="display:none">
            </span>
            <br>
            <button type="button" onclick="calculate()">Calculate</button>
            <hr>
            <button type="button" onclick="clearResults()">Clear Results</button>
        </form>
        <br>
        <p>List of results</p>
        <table id="operations">
            <thead>
            <tr>
                <th>ID</th>
                <th>Operation</th>
                <th>Result</th>
            </tr>
            </thead>
            <tbody>
            <!-- Previous operations will be appended here -->
            </tbody>
        </table>
        </article>
    </section>
</main>
<footer>
    Footer
</footer>
<script src="js/myScript.js"></script>
</body>
</html>