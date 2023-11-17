<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Album List</title>
</head>
<body>
    <h1>Albums</h1>
    <ul>
    
    </ul>
</body>
<script>
	let strObj = `${ str }`;
	let obj = JSON.parse(strObj);
	console.log(obj);
	
	let toHtml = function(search) {
		let tmp = "<li>";
		search.albums.items.forEach(function(album) {
			tmp += '<img src="' + album.images[2].url + '">'
			tmp += album.name + "<br>";
		});
		tmp += "</li>";
		return tmp;
	}
	
	document.addEventListener("DOMContentLoaded", function() {
		document.querySelector('ul').innerHTML = toHtml(obj);
	});
</script>
</html>