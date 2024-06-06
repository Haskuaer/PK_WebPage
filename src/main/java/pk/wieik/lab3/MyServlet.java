package pk.wieik.lab3;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class MyServlet extends HttpServlet {

    ArrayList<Client> clients = new ArrayList<Client>();

    @Override
    public void init() throws ServletException {

        super.init();
        clients.add(new Client("admin", "admin", "admin"));
        clients.add(new Client("user1", "123", "standard"));
        clients.add(new Client("user2", "321", "standard"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //System.out.println(showUsers(clients));

        String action = request.getParameter("action");
        String theme = request.getParameter("theme");

        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String path = uri.substring(contextPath.length());

        String currentURL = null;
        String page = request.getParameter("page");

        if(page != null) {

            currentURL = page;
            System.out.println("CurrentURL: " + currentURL);

            Cookie cookie = new Cookie("lastPage", currentURL);
            cookie.setMaxAge(3600);
            cookie.setPath(contextPath);
            response.addCookie(cookie);

            if(page.equals("user-home")){

                HttpSession session = request.getSession(false);

                if(session != null && session.getAttribute("status").equals("admin")) {

                    request.setAttribute("createTable", generateTable());
                }
            }
        }


        if("logout".equals(action)){
            HttpSession session = request.getSession(false);
            if(session != null){
                session.invalidate();
            }
            response.sendRedirect(contextPath+"/pk");
            return;
        }

        if("dark".equals(theme)){

            HttpSession session = request.getSession(false);
            if(session != null && session.getAttribute("user") != null){
                String login = session.getAttribute("user").toString();
                Client client = getUser(login);
                session.setAttribute("theme", theme);
                client.setTheme(theme);
            }

            response.sendRedirect(contextPath+"/pk?page=user-home");
            return;

        } else if("standard".equals(theme)){

            HttpSession session = request.getSession(false);
            if(session != null && session.getAttribute("user") != null){
                String login = session.getAttribute("user").toString();
                Client client = getUser(login);
                session.setAttribute("theme", theme);
                client.setTheme(theme);
            }
            response.sendRedirect(contextPath+"/pk?page=user-home");
            return;
        }

        if (path.startsWith("/pk")) {
            serveDynamicPage(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
        }
    }

    protected void serveDynamicPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String page = request.getParameter("page");
        Cookie[] cookies = request.getCookies();
        String lastPage = null;

        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("lastPage")){
                    lastPage = cookie.getValue();
                    break;
                }
            }
        }

        if(lastPage != null && page == null){
            page = lastPage;
        } else {
            if(page == null){
                page = "index";
            }
        }

        String path = "/WEB-INF/pages/"+page+".jsp";
        String realPath = request.getServletContext().getRealPath(path);

        if(Files.exists(Paths.get(realPath))){
            request.getRequestDispatcher(path).forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Resource not found");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        if(login != null && password != null){

            Client client = getUser(login);

            if(client != null && password.equals(client.getPassword())){

                HttpSession session = request.getSession();
                session.setAttribute("user", client.getLogin());
                session.setAttribute("status", client.getStatus());
                session.setAttribute("theme", client.getTheme());

                serveDynamicPage(request, response);
                return;

            } else {

                String contextPath = request.getContextPath();
                response.sendRedirect(contextPath +  "/pk?page=index&loginFailed=true");
                return;
            }
        }

        HttpSession session = request.getSession(false);
        if(session != null && session.getAttribute("user") != null){

            String loginChange = request.getParameter("login-change");
            String passwordChange = request.getParameter("password-change");

            if(loginChange != null || passwordChange != null){

                String currentUser = session.getAttribute("user").toString();
                Client currentClient = getUser(currentUser);

                if(currentClient != null){

                    if(loginChange != null && !loginChange.isEmpty()){

                        currentClient.setLogin(loginChange);
                        session.setAttribute("user", loginChange);
                    }

                    if(passwordChange != null && !passwordChange.isEmpty()){

                        currentClient.setPassword(passwordChange);
                        currentClient.setPassword(passwordChange);
                    }

                    serveDynamicPage(request, response);
                }
            }
        }

        if(session != null && session.getAttribute("user") != null){

            ArrayList<Client> updatedClients = new ArrayList<>(clients);
            int adminCount = 0;

            for(Client client : updatedClients){
                if(client.getStatus().equals("admin")){
                    adminCount++;
                }
            }

            System.out.println("Liczba administratorów: " + adminCount);

            for(Client client:updatedClients){
                String newStatus = request.getParameter("rights-"+client.getLogin());
                if(newStatus != null && !newStatus.equals(client.getStatus())){
                    if(newStatus.equals("standard")){
                        adminCount--;
                    }
                    client.setStatus(newStatus);
                }
            }

            System.out.println("Liczba administratorów po zmianie: " + adminCount);

            if(adminCount == 0){
                String contextPath = request.getContextPath();
                response.sendRedirect(contextPath + "/pk?page=user-home&statusError");
            } else {
                clients = updatedClients;
                serveDynamicPage(request, response);
            }
        }
    }

    private Client getUser(String login) {

        for(Client client:clients){
            if(client.getLogin().equals(login))
                return client;
        }
        return null;
    }

    private boolean checkAdminStatus(ArrayList<Client> clients){

        for(Client client:clients){
            if(client.getStatus().equals("admin")){
                return true;
            }
        }
        return false;
    }

    private String showUsers(ArrayList<Client> clients){

        StringBuilder sb = new StringBuilder();

        for(Client client:clients){
            sb.append(client.getLogin()).append(" ");
            sb.append(client.getPassword()).append(" ");
            sb.append(client.getStatus()).append(" ");
            sb.append(client.getTheme()).append(" ");
        }

        sb.append("\n");
        return sb.toString();
    }

    protected String generateTable(){

        StringBuilder table = new StringBuilder();

        table.append("<table>");
        table.append("<thead>");
        table.append("<tr>");
        table.append("<th rowspan=\"2\">Username</th>");
        table.append("<th colspan=\"2\">Access right</th>");
        table.append("</tr>");
        table.append("<tr>");
        table.append("<th>Admin</th>");
        table.append("<th>User</th>");
        table.append("</tr>");
        table.append("</thead>");
        table.append("<tbody>");

        for(Client client:clients){
            String username = client.getLogin();
            table.append("<tr>");
            table.append("<td>").append(client.getLogin()).append("</td>");
            if(client.getStatus().equals("admin")) {
                table.append("<td><input type='radio' id='").append(username).append("' name='rights-").append(username).append("' value='admin' checked></td>");
                table.append("<td><input type='radio' id='").append(username).append("' name='rights-").append(username).append("' value='standard'></td>");
            } else if(client.getStatus().equals("standard")) {
                table.append("<td><input type='radio' id='").append(username).append("' name='rights-").append(username).append("' value='admin'></td>");
                table.append("<td><input type='radio' id='").append(username).append("' name='rights-").append(username).append("' value='standard' checked></td>");
            }
            //table.append("<td>").append(client.getStatus()).append("</td>");
            table.append("</tr>");
        }

        table.append("</tbody>");
        table.append("</table>");

        return table.toString();
    }
}