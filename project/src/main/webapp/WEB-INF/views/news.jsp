<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groovy | 뉴스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/news.css">
    <script src="https://kit.fontawesome.com/8f808bece4.js" crossorigin="anonymous"></script>
</head>
<body>
    <!-- s : wrap -->
    <div id="wrap">
        <!-- s : header -->
        <%@ include file="header.jsp" %>
        <!-- e : header -->

        <!-- s : main -->
        <div id="main">
            <!-- s : news -->
            <div id="news">
                <!-- s : container -->
                <div class="container content_container">
                    <div class="news_contents">
                        <div class="news_content">
                            <div class="news_thum">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/images/album/news.webp" alt="">
                                </a>
                            </div>
                            <div class="news_body">
                                <div class="news_title">
                                    <a href="#">
                                        <h2>Meejah Release Music Video for “Jing (Thunder)” While on SK Tour</h2>
                                    </a>
                                </div>
                                <div class="news_date">
                                    2023.10.31
                                </div>
                                <div class="news_preview">
                                    Meejah release music video for Jing (Thunder) during their South Korean tour
                                </div>
                            </div>
                        </div>

                        <div class="news_content">
                            <div class="news_thum">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/images/album/news.webp" alt="">
                                </a>
                            </div>
                            <div class="news_body">
                                <div class="news_title">
                                    <a href="#">
                                        <h2>Meejah Release Music Video for “Jing (Thunder)” While on SK Tour</h2>
                                    </a>                                
                                </div>
                                <div class="news_date">
                                    2023.10.31
                                </div>
                                <div class="news_preview">
                                    Meejah release music video for Jing (Thunder) during their South Korean tour
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <%@ include file="aside.jsp" %>
                </div>
                <!-- e : container -->
            </div>
            <!-- e : news -->
        </div>
        <!-- e : main -->
        <!-- s : footer -->
        <%@ include file="footer.jsp" %>
        <!-- e : footer -->
    </div>
    <!-- e : wrap -->
</body>
</html>