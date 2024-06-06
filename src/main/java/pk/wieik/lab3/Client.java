package pk.wieik.lab3;

public class Client {

    private String login;
    private String password;
    private String status = "normal";
    private String theme = "standard";

    public Client(String login, String password) {

        this.login = login;
        this.password = password;
    }

    public Client(String login, String password, String status) {

        this.login = login;
        this.password = password;
        this.status = status;
    }

    public Client(String login, String password, String status, String theme) {

        this.login = login;
        this.password = password;
        this.status = status;
        this.theme = theme;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getLogin(){
        return login;
    }

    public String getPassword(){
        return password;
    }

    public String getStatus(){
        return status;
    }

    public String getTheme(){
        return theme;
    }
}
