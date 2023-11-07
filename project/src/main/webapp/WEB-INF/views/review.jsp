<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groovy | 리뷰</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/review.css">
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
            <div id="review">
                <!-- s : container -->
                <div class="container content_container">
                    <div class="contents">
                        <div class="review_header">
                            <div class="review_header_title">
                                <h2>음악</h2>
                            </div>
                            <div class="review_header_genre">
                                <label for="all" class="checked-label">전체</label>
                                <label for="hiphop">힙합</label>
                                <label for="r&b">R&B</label>

                                <div class="hidden">
                                    <input type="radio" name="genre" id="all">
                                    <input type="radio" name="genre" id="hiphop">
                                    <input type="radio" name="genre" id="r&b">
                                </div>
                            </div>
                        </div>
                        <div class="review_body">
                            <div class="review_body_header">
                                <div class="review_body_sort">
                                    <ul>
                                        <li class="selected">최신순</li>
                                        <li>인기순</li>
                                    </ul>
                                    <div class="rate">평점</div>
                                </div>
                                <div class="review_lists">
                                    <c:forEach var="album" items="${ latestAlbums }">
                                    	<div class="review_list">
                                        <div class="album_thum">
	                                            <img src="${ album.images[0].url }" alt="">
	                                        </div>
	                                        <div class="album_info">
	                                            <div class="album_title">${ album.name }</div>
	                                            <div class="album_artist">${ album.artists[0].name }</div>
	                                            <div class="album_date">${ album.releaseDate }</div>
	                                            <div class="album_genre">
	                                            	${ album.albumType }
	                                            </div>
	                                        </div>
	                                        <div class="album_rate">
	                                            <span>3.5</span>
	                                        </div>
	                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%@ include file="aside.jsp" %>
                </div>
                <!-- e : container -->
            </div>
        </div>
        <!-- e : main -->

        <!-- s : footer -->
        <%@ include file="footer.jsp" %>
        <!-- e : footer -->
    </div>
    <!-- e : wrap -->
    <script>
        // 라디오 버튼 요소를 가져옵니다.
        const radioButtons = document.querySelectorAll('input[type="radio"]');

        // 라디오 버튼의 변경 이벤트를 감지하여 처리합니다.
        radioButtons.forEach(radioButton => {
            radioButton.addEventListener('change', function () {
                // 모든 레이블의 클래스를 초기화합니다.
                document.querySelectorAll('label').forEach(label => {
                    label.classList.remove('checked-label');
                });

                // 체크된 라디오 버튼과 연결된 레이블에 checked 클래스를 추가합니다.
                if (this.checked) {
                    document.querySelector(`label[for="$(this.id)"]`).classList.add('checked-label');
                }
            });
        });
        // <li> 요소들을 가져옵니다.
        const listItems = document.querySelectorAll('li');

        // 각 <li> 요소에 클릭 이벤트 리스너를 추가합니다.
        listItems.forEach(item => {
            item.addEventListener('click', function () {
                // 현재 선택된 <li> 요소에 selected 클래스를 추가합니다.
                this.classList.add('selected');

                // 다른 <li> 요소에서 selected 클래스를 제거합니다.
                listItems.forEach(otherItem => {
                    if (otherItem !== this) {
                        otherItem.classList.remove('selected');
                    }
                });
            });
        });
    </script>
</body>

</html>