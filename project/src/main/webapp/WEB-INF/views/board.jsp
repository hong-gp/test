<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groovy | 커뮤니티</title>
    <link rel="stylesheet" href="css/board.css">
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
            <!-- s : contents -->
            <div id="contents">
                <div class="container">
                    <!-- s : board -->
                    <div id="board">
                        <h2>커뮤니티</h2>
                        <form id="board_nav" method="get" action="./board">
                            <div id="category">
                                <label for="all" class="checked">전체</label>
                                <label for="music" class="">음악</label>
                                <label for="review" class="">리뷰</label>
                                <!-- <label for="lyrics">가사 해석</label> -->
                                <div id="hidden">
                                    <input type="radio" name="category" id="all" value="all" >
                                    <input type="radio" name="category" id="music" value="music" >
                                    <input type="radio" name="category" id="review" value="review" >
                                    <!-- <input type="radio" name="category" id="lyrics" value="lyrics" /> -->
                                </div>
                            </div>
                            <div id="search_area">
                                <select name="searchField" id="searchField">
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                    <option value="name">작성자</option>
                                </select>
                                <input type="text" name="searchWord" id="searchWord" placeholder="검색어를 입력하세요." value="${ empty param.searchWord ? '' : param.searchWord }"/>
                                <button id="searchBtn" type="submit">
                                    <i class="fa-solid fa-magnifying-glass fa-lg"></i>
                                </button>
                            </div>
                        </form>
                        <div id="list">
                            <table>
                                <tr class="theader">
                                    <td width="5%">번호</td>
                                    <td width="10%">카테고리</td>
                                    <td width="50%">제목</td>
                                    <td width="10%">이름</td>
                                    <td width="10%">날짜</td>
                                    <td width="10%">조회수</td>
                                    <td width="5%">좋아요</td>
                                </tr>
                                <c:choose>
                                    <c:when test="${ empty boardLists }">
                                        <tr class="tbody">
                                            <td id="empty_board" colspan="7">등록된 게시물이 없습니다.</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="dto" items="${ boardLists }">
                                            <c:choose>
                                                <c:when test="${ not empty param.searchWord }">
                                                    <c:url value="view" var="viewUrl">
                                                        <c:param name="num" value="${ dto.num }" />
                                                        <c:param name="category" value="${ param.category != 'all' ? param.category : 'all' }" />
                                                        <c:param name="searchField" value="${ empty param.searchField ? 'title' : param.searchField }" />
                                                        <c:param name="searchWord" value="${ param.searchWord }"></c:param>
                                                        <c:param name="page" value="${ empty param.page ? 1 : param.page }" />
                                                    </c:url>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:url value="view" var="viewUrl">
                                                        <c:param name="page" value="${ empty param.page ? 1 : param.page }" />
                                                        <c:param name="num" value="${ dto.num }" />
                                                        <c:param name="category" value="${ param.category != 'all' ? param.category : 'all' }" />
                                                    </c:url>
                                                </c:otherwise>
                                            </c:choose>
                                            <tr class="tbody">
                                                <td></td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </table>
                        </div>
                        <div id="write_btn_area">
                            <button type="button" id="write_btn" onclick="location.href = './write'">글쓰기</button>
                        </div>
                        <div id="page">
                            <c:if test="${ ph.showPrev }" >
                                <a href="#">&laquo;</a>
                                <a href ="#" >&lt;</a>
                            </c:if>
                            <c:forEach var="i" begin="${ph.beginPage }" end="${ph.endPage }">
                                <a class="#" >${ i }</a>
                            </c:forEach>
                            <c:if test="${ ph.showNext }" >
                                <a href ="#" >&gt;</a>
                                <a href="#">&raquo;</a>
                            </c:if> 
                        </div>
                    </div>
                    <!-- e : board -->
                </div>
            </div>
            <!-- e : contents -->
            </div>
        </div>
        <!-- e : main -->

        <!-- s : footer -->
        <%@ include file="footer.jsp" %>
        <!-- e : footer -->
    </div>
    <!-- e : wrap -->
</body>

</html>