<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<body>
	<!-- s : header -->
	<div id="header">
		<div class="container">
			<div class="header_logo">
				<div class="logo">
					<a href='<c:url value="/" />'>
						<h2>Groovy</h2>
					</a>
				</div>
			</div>
			<div class="header_menu">
				<div class="nav">
					<ul>
						<a href="news.html">
							<li>뉴스</li>
						</a>
						<a href="review.html">
							<li>리뷰</li>
						</a>
						<a href="#">
							<li>추천</li>
						</a>
						<a href="#">
							<li>차트</li>
						</a>
						<a href="<c:url value='/board' />">
							<li>커뮤니티</li>
						</a>
					</ul>
				</div>
				<div class="account">
					<ul>
						<c:choose>
							<c:when test="${ empty sessionScope.id }">
								<a href='<c:url value="/login" />'>
									<li>로그인</li>
								</a>
								<a href='<c:url value="/register" />'>
									<li>회원가입</li>
								</a>
							</c:when>
							<c:otherwise>
								<a href='<c:url value="/logout" />'>
									<li>로그아웃</li>
								</a>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- e : header -->
</body>
</html>