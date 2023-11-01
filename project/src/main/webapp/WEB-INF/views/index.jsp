<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groovy</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/style.css">
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
            <!-- s : content_review -->
            <div id="content_review">
                <div class="container">
                    <div class="review_header">
                        <h2>리뷰</h2>
                    </div>
                    <div class="review_body">
                        <div class="review_album">
                            <div class="thum">
                                <img src="images/album/Taylor-Swift-1989-Taylors-Version.webp" alt="">
                            </div>
                        </div>
                        <!-- 데이터베이스 연동 (랜덤 / 최신) -->
                        <div class="review_review">
                            <div class="review_review_header">
                                <div class="genre">팝/R&B</div>
                                <div class="title">
                                    <h2>1989 (Taylor’s Version)</h2>
                                </div>
                                <div class="artist">
                                    <h3>Taylor Swift</h3>
                                </div>
                            </div>
                            <div class="review_review_body">
                                <div class="profile">
                                    <img src="#" alt="">
                                    <p>Review by name</p>
                                </div>
                                <div class="rank">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star-half-stroke"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                                <div class="review_text">
                                    Kristin Hayter's artistic acumen is unlike anybody else working today.

                                    I fear that people will look uncharitably at her shift in sound and style, and see it as
                                    a downgrade of sorts from Lingua Ignota. While I'll miss Lingua Ignota, there is a part
                                    of me who finds comfort in her retirement. For this, I cite two reasons. (1) While I
                                    feel an incomparable gravitas to Kristin's performances, to me, it is obviously
                                    unsustainable for one to--on command--slip in and out of such an intense state of grief.
                                    I, for one, don't want to see Kristin burn out or ruin her body because of the physical
                                    and emotional ordeals that Lingua Ignota demands. (2) With All Bitches Die, Caligula,
                                    and Sinner Get Ready, Kristin has used Lingua Ignota to dive in, investigate her grief,
                                    and, at the end of the final record, find peace. To me, that is a perfect conclusion and
                                    there is no reason to take the project even further.

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- e : content_review -->

            <!-- s : latest_album -->
            <div id="latest_album">
                <div class="container">
                    <div class="latest_album_header">
                        <h2>최신 앨범</h2>
                    </div>
                    <div class="latest_album_body">
                        <!-- 데이터 베이스 연동 최신 기준 -->
                        <ul>
                            <a href="#">
                                <li>
                                    <div class="thum">
                                        <img src="images/album/Taylor-Swift-1989-Taylors-Version.webp" alt="">
                                    </div>
                                    <div class="info">
                                        <div class="title">1989 (Taylor’s Version)</div>
                                        <div class="artist">Taylor Swift</div>
                                    </div>
                                </li>
                            </a>
                            <a href="#">
                                <li>
                                    <div class="thum">
                                        <img src="images/album/Taylor-Swift-1989-Taylors-Version.webp" alt="">
                                    </div>
                                    <div class="info">
                                        <div class="title">1989 (Taylor’s Version)</div>
                                        <div class="artist">Taylor Swift</div>
                                    </div>
                                </li>
                            </a>
                            <a href="#">
                                <li>
                                    <div class="thum">
                                        <img src="images/album/Taylor-Swift-1989-Taylors-Version.webp" alt="">
                                    </div>
                                    <div class="info">
                                        <div class="title">1989 (Taylor’s Version)</div>
                                        <div class="artist">Taylor Swift</div>
                                    </div>
                                </li>
                            </a>
                            <a href="#">
                                <li>
                                    <div class="thum">
                                        <img src="images/album/Taylor-Swift-1989-Taylors-Version.webp" alt="">
                                    </div>
                                    <div class="info">
                                        <div class="title">1989 (Taylor’s Version)</div>
                                        <div class="artist">Taylor Swift</div>
                                    </div>
                                </li>
                            </a>
                            <a href="#">
                                <li>
                                    <div class="thum">
                                        <img src="images/album/Taylor-Swift-1989-Taylors-Version.webp" alt="">
                                    </div>
                                    <div class="info">
                                        <div class="title">1989 (Taylor’s Version)</div>
                                        <div class="artist">Taylor Swift</div>
                                    </div>
                                </li>
                            </a>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- e : latest_album -->

            <!-- s : news -->
            <div id="news">
                <div class="container">
                    <div class="news_main">
                        <a href="#">
                            <div class="news_thum">
                                <img src="images/album/news.jpg" alt="">
                            </div>
                            <div class="news_text">
                                
                                    <div class="category">NEWS</div>
                                    <div class="title">
                                        <h3>슈가 비츠, 티아이 & 풀 스윗 영입</h3>
                                    </div>
                                    <div class="date">2023.10.30</div>
                            </div>
                        </a>   
                    </div>
                    <div class="news_sub">
                        <ul>
                            <a href="#">
                                <li>
                                    <div class="news_sub_title">폴 블랑코, 정규 1집 선공개 싱글 "Do" 발표</div>
                                    <div class="news_sub_date">2020.10.30</div>
                                </li>
                            </a>
                            <a href="#">
                                <li>
                                    <div class="news_sub_title">헤콥, 스트릿 베이비와 함께한 싱글 "The Fuck" 발표</div>
                                    <div class="news_sub_date">2020.10.30</div>
                                </li>
                            </a>
                            <a href="#">
                                <li>
                                    <div class="news_sub_title">헤콥, 스트릿 베이비와 함께한 싱글 "The Fuck" 발표</div>
                                    <div class="news_sub_date">2020.10.30</div>
                                </li>
                            </a>
                        </ul>
                    </div>
                </div>
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