<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Latest Album List</title>
</head>
<body>
    <h1>Albums</h1>
    <ul>
        <c:forEach var="album" items="${ latestAlbums }">
        	<li>
        		<p>${ album }</p>
        		<img alt="" src="${ album.images[2].url }">
	            <h2>${ album.name }</h2>
	            <p>${album.artists[0].name}</p>
        	</li>
        </c:forEach>
    </ul>
</body>
</html>