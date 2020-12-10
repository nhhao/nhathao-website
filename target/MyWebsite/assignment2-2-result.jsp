<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet"
        />
        <link rel="stylesheet" href="./normalize.css" />
        <link rel="stylesheet" href="./style.css" />

        <title>Asignment 1 - result | nhathao</title>
    </head>
    <body>
        <header>
            <div class="logo">
                <a href="./index.html">nhathao<span>.tech</span></a>
            </div>
            <nav>
                <ul>
                    <li><a href="./index.html">Home</a></li>
                    <li><a href="" class="active">About me</a></li>
                </ul>
            </nav>
        </header>
        
        <main class="assignment assignment2-2-result">
            <% String[] drinks;
            drinks = request.getParameterValues("drinks"); %>
            <p class="description">
                <% if(drinks == null) { %>
                    <p>Please choose some drinks, it's free to you ^^</p>
                <% } else { %>
                    <p>Your drinks:</p>
                    <ul>
                        <% for(int i = 0; i < drinks.length; i++) { %>
                            <li><%= drinks[i] %></li> <% } %>
                    </ul>
                    <% String moreSugar = request.getParameter("more-sugar"); %>
                    <% String moreIce = request.getParameter("more-ice"); %>
                    <% String straws = request.getParameter("straws"); %>
                    <% if(moreSugar != null || moreIce != null || straws != null) { %>
                            <p>With these add ons:</p>
                            <ul>
                                <% if(moreSugar != null) { %>
                                    <li>More sugar</li>
                                <% } %>
                                <% if(moreIce != null) { %>
                                    <li>More ice</li>
                                <% } %>
                                <% if(straws != null) { %>
                                    <li>One more straw</li>
                                <% } %>
                            </ul>
                    <% } %>
                    <p>Payed <%= request.getParameter("payment-method") %> will be sent soon. Thanks for waiting us ^^</p>
                <% } %>
                <a href="./index.html" class="back-to-home">Back to home</a>
            </p>

        </main>
    </body>
</html>
