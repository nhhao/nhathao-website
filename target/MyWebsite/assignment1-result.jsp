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
                    <li><a href="./about-me.html" class="active">About me</a></li>
                </ul>
            </nav>
        </header>
        <main class="assignment">
            <p class="description">
                Thanks, you ordered <%= request.getParameter("order") %> grams
                of tomatoes.
                <a href="./index.html" class="back-to-home">Back to home</a>
            </p>
        </main>
    </body>
</html>
