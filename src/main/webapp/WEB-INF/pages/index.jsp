<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>PK</title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body class="<%= session.getAttribute("theme") != null ? session.getAttribute("theme") : "standard" %>">
<header>
    Header
</header>
<main>
    <nav>
        <img src="images/logo.png" alt="logo_pk"/>
        <br>D
        <button class="showButton" onclick="showMenu()">
            <span class="menu-logo"></span>
        </button>
        <br>
        <jsp:include page="<%= session.getAttribute(\"user\") != null ? \"logged.jsp\" : \"menu.jsp\" %>"/>
        <br>
        <p id="date">DATE: TODO</p>
        <br>
        <p id="time">TIME: TODO</p>
    </nav>
    <section>
        <article>
            <h3>Article 1</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Officia, dolorum. Harum ad accusamus, aspernatur corporis, ratione atque sunt similique ab modi exercitationem sint doloribus, vel numquam est ullam! Rerum, officiis! Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem dolor debitis exercitationem voluptates. Perspiciatis, accusamus explicabo ut sequi error doloribus neque nisi recusandae. Temporibus quasi vel perferendis omnis a error!</p>
        </article>
        <hr>
        <article>
            <h3>Article 2</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Officia, dolorum. Harum ad accusamus, aspernatur corporis, ratione atque sunt similique ab modi exercitationem sint doloribus, vel numquam est ullam! Rerum, officiis! Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem dolor debitis exercitationem voluptates. Perspiciatis, accusamus explicabo ut sequi error doloribus neque nisi recusandae. Temporibus quasi vel perferendis omnis a error!</p>
        </article>
        <hr>
        <article>
            <h3>Article 3</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Officia, dolorum. Harum ad accusamus, aspernatur corporis, ratione atque sunt similique ab modi exercitationem sint doloribus, vel numquam est ullam! Rerum, officiis! Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem dolor debitis exercitationem voluptates. Perspiciatis, accusamus explicabo ut sequi error doloribus neque nisi recusandae. Temporibus quasi vel perferendis omnis a error!</p>
        </article>
        <hr>
        <article>
            <h3>Article 4</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Officia, dolorum. Harum ad accusamus, aspernatur corporis, ratione atque sunt similique ab modi exercitationem sint doloribus, vel numquam est ullam! Rerum, officiis! Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem dolor debitis exercitationem voluptates. Perspiciatis, accusamus explicabo ut sequi error doloribus neque nisi recusandae. Temporibus quasi vel perferendis omnis a error!</p>
        </article>
        <hr>
        <article>
            <h3>Article 5</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Officia, dolorum. Harum ad accusamus, aspernatur corporis, ratione atque sunt similique ab modi exercitationem sint doloribus, vel numquam est ullam! Rerum, officiis! Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem dolor debitis exercitationem voluptates. Perspiciatis, accusamus explicabo ut sequi error doloribus neque nisi recusandae. Temporibus quasi vel perferendis omnis a error!</p>
        </article>
        <hr>
        <article>
            <h3>Article 6</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Officia, dolorum. Harum ad accusamus, aspernatur corporis, ratione atque sunt similique ab modi exercitationem sint doloribus, vel numquam est ullam! Rerum, officiis! Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem dolor debitis exercitationem voluptates. Perspiciatis, accusamus explicabo ut sequi error doloribus neque nisi recusandae. Temporibus quasi vel perferendis omnis a error!</p>
        </article>
    </section>
</main>
<footer>
    Footer
</footer>
<script src="js/myScript.js"></script>
</body>
</html>