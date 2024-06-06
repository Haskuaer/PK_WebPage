<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String theme;

    if(session.getAttribute("theme")!=null)  theme = session.getAttribute("theme").toString();
    else theme = "standard";
%>
<p>User list</p>
<form method="post" action="pk">
    <%= request.getAttribute("createTable") != null ? request.getAttribute("createTable").toString() : "No data available" %>
    <br>
    <button type="submit" name="action" value="changeRights" class="<%= theme %>-button">Change status</button>
    <% if(request.getParameter("statusError") != null) { %>
    <p class="login-message-f">At least one administrator user is needed</p>
    <% } %>
</form>