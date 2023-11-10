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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/review.css">
<script src="https://kit.fontawesome.com/8f808bece4.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>

<body>
	<!-- s : wrap -->
	<div id="wrap">
		<!-- s : header -->
		<%@ include file="header.jsp"%>
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
								<label for="all" class="checked-label">전체</label> <label
									for="hiphop">힙합</label> <label for="r&b">R&B</label>

								<div class="hidden">
									<input type="radio" name="genre" id="all"> <input
										type="radio" name="genre" id="hiphop"> <input
										type="radio" name="genre" id="r&b">
								</div>
							</div>
						</div>
						<div class="review_body">
							<div class="review_body_header">
								<form name="sortForm" class="review_body_sort" action='<c:url value="/review/list" />'>
									<input type="hidden" value="latest" name="order" />
									<ul>
										<li class="${ param.order == 'latest' ? 'selected' : '' }" data-order="latest">최신순</li>
										<li class="${ param.order == 'popular' ? 'selected' : '' }" data-order="popular">인기순</li>
									</ul>
									<div class="rate">평점</div>
								</form>
								<div class="review_lists">
									<c:forEach var="album" items="${ latestAlbums }">
										<div class="review_list">
											<div class="album_thum">
												<img src="${ album.images[0].url }" alt="">
											</div>
											<div class="album_info">
												<div class="album_title">
													<a href='<c:url value="/review/review?id=${ album.id }" />'>${ album.name }</a>
												</div>
												<div class="album_artist">${ album.artists[0].name }</div>
												<div class="album_date">${ album.releaseDate }</div>
												<div class="album_genre">${ album.albumType }</div>
											</div>
											<div class="album_rate">
												<span>3.5</span>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div id="page">
							<c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
								<a href='<c:url value="/review/list${ ph.sc.getQueryString(i) }"/>'
									class="${ ph.sc.page == i ? 'active' : '' }">${ i }</a>
							</c:forEach>
						</div>
					</div>
					<%@ include file="aside.jsp"%>
				</div>
				<!-- e : container -->
			</div>
		</div>
		<!-- e : main -->

		<!-- s : footer -->
		<%@ include file="footer.jsp"%>
		<!-- e : footer -->
	</div>
	<!-- e : wrap -->
	<script>
        const radioButtons = document.querySelectorAll('input[type="radio"]');

        radioButtons.forEach(radioButton => {
            radioButton.addEventListener('change', function () {
                document.querySelectorAll('label').forEach(label => {
                    label.classList.remove('checked-label');
                });

                if (this.checked) {
                    document.querySelector(`label[for="$(this.id)"]`).classList.add('checked-label');
                }
            });
        });
        const listItems = document.querySelectorAll('li');

        listItems.forEach(item => {
            item.addEventListener('click', function () {
                this.classList.add('selected');

                listItems.forEach(otherItem => {
                    if (otherItem !== this) {
                        otherItem.classList.remove('selected');
                    }
                });
                
                let order = $(this).attr('data-order');
                console.log(order);
                
                $("input[name=order]").val(order);
                sortForm.submit();
            });
        });
    </script>
</body>

</html>