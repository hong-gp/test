<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groovy | 추천</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/recommend.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://kit.fontawesome.com/8f808bece4.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>

<body>
    <!-- s : wrap -->
    <div id="wrap">
        <!-- s : header -->
        <%@ include file="header.jsp" %>
        <!-- e : header -->

        <!-- s : main -->
        <div id="main">
            <div id="section">
                <div class="container content_container">
                    <div class="recommend">
                        <div class="recom_title">
                            <h2>추천</h2>
                        </div>
                        <form class="recom_header" action='<c:url value="/recommend/result" />' method='get'>
                        	<div class="choose_artist">
                        		<div class="choose_artist_header">
                        			<h2>아티스트를 선택해주세요</h2>
                        		</div>
                        		<div class="choose_artist_body">
                        			<div class="search_artist_box">
                        				<input type="text" name="artist_search" class="input_artist" />
                        				<button type="button" class="searchBtn" data-type='artist'>검색</button>
                        			</div>
                        			<div class="search_artist_result">
                        				
                        			</div>
                        		</div>
                        	</div>
                            <div class="choose_genre">
                                <div class="choose_genre_header">
                                    <h2>장르를 선택해주세요</h2>
                                </div>
                                <div class="choose_genre_body">
                                    <ul>
                                        <li class="genre" data-genre="acoustic">
                                            <div class="genre_image">
                                                <img src="${pageContext.request.contextPath}/images/album/Taylor-Swift-1989-Taylors-Version.webp" alt="">
                                                <span>acoustic</span>
                                            </div>
                                        </li>
                                        <li class="genre" data-genre="alternative">
                                            <div class="genre_image">
                                                <img src="${pageContext.request.contextPath}/images/album/Taylor-Swift-1989-Taylors-Version.webp" alt="">
                                                <span>alternative</span>
                                            </div>
                                        </li>
                                        <li class="genre" data-genre="anime">
                                            <div class="genre_image">
                                                <img src="${pageContext.request.contextPath}/images/album/Taylor-Swift-1989-Taylors-Version.webp" alt="">
                                                <span>anime</span>
                                            </div>
                                        </li>
                                        <li class="genre" data-genre="black-metal">
                                            <div class="genre_image">
                                                <img src="${pageContext.request.contextPath}/images/album/Taylor-Swift-1989-Taylors-Version.webp" alt="">
                                                <span>black-metal</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            
                            <div class="choose_track">
                            	<div class="choose_track_header">
                            		<h2>트랙을 선택해주세요</h2>
                            	</div>
                            	<div class="choose_track_body">
                            		<div class="search_track_box">
                        				<input type="text" name="track_search" class="input_track" />
                        				<button type="button" class="search_track_btn" data-type='track'>검색</button>
                        			</div>
                        			<div class="search_track_result">
                        				
                        			</div>
                            	</div>
                            </div>

                            <input type="hidden" name="genre" value="">
                            <input type="hidden" name="artist" value="">
                            <input type="hidden" name="searchTrack" value="">
                        </form>
                        <div class="recom_footer">
                            <button class="recomBtn" type="button">확인</button>
                        </div>
                    </div>

                    <%@ include file="aside.jsp" %>
                </div>
            </div>
        </div>
        <!-- e : main -->

        <!-- s : footer -->
        <%@ include file="footer.jsp" %>
        <!-- e : footer -->
    </div>
    <!-- e : wrap -->

    <script>
        $(document).on('click', '.genre', function() {
            $('input[name=genre]').val($(this).attr("data-genre"));
            $('.check').detach();

            let check = '<div class="check">';
            check += '<i class="fa-regular fa-circle-check"></i>';
            check += '</div>';
            $(this).append(check);
            console.log($('input[name=genre]').val());
        });
        
        $(document).on('click', '.artist_thum', function() {
            $('input[name=artist]').val($(this).attr("data-artist"));

            console.log($('input[name=artist]').val());
        });
        
        $(document).on('click', '.track_thum', function() {
            $('input[name=searchTrack]').val($(this).attr("data-track"));

            console.log($('input[name=searchTrack]').val());
        });
        
        $(document).on('click', '.recomBtn', function() {
        	if ($('input[name=genre]').val() == "") {
                alert("장르를 선택해주세요.");
                return;
            }
            if ($('input[name=artist]').val() == "") {
                alert("아티스트를 선택해주세요.");
                return;
            }
            if ($('input[name=searchTrack]').val() == "") {
                alert("트랙을 선택해주세요.");
                return;
            }

            $('.recom_header').submit();
        });
        
        
        
        $(document).ready(function() {
        	
        	$(document).on('click', '.searchBtn', function() {
        		let keyword = $('input[name=artist_search]').val();
        		let type = $(this).attr('data-type');
        		
        		$.ajax({
        			type: 'post',
        			url: '/groovy/recommend/search',
        			data: {
        				keyword: keyword,
        				type: type
        			},
        			success: function(result) {
        				let obj = JSON.parse(result);
        				console.log(obj);
        				$('.search_artist_result').html(toArtist(obj));
        			}
        		});
        	});
        	
        	$(document).on('click', '.search_track_btn', function() {
        		let keyword = $('input[name=track_search]').val();
        		let type = $(this).attr('data-type');
        		
        		$.ajax({
        			type: 'post',
        			url: '/groovy/recommend/search',
        			data: {
        				keyword: keyword,
        				type: type
        			},
        			success: function(result) {
        				console.log(result);
        				let obj = JSON.parse(result);
        				console.log(obj);
        				$('.search_track_result').html(toTrack(obj));
        			}
        		});
        	});
        });
        
        let toArtist = function(item) {
        	let tmp = '';
        	
        	item.artists.items.forEach(function(artist) {
        		tmp += '<div class="artist_thum" data-artist="' + artist.id + '">';
        		if (artist.images.length == 0) {
        			tmp += '<div class="no_thum"><i class="fa-solid fa-user"></i></div>';
        		} else {
	        		tmp += '<img src=' + artist.images[0].url + '>';
        		}
        		tmp += '<span>' + artist.name + '</span>';
        		tmp += '</div>';
        	});
        	return tmp;
        }
        
        let toTrack = function(item) {
        	let tmp = '';
        	
        	item.tracks.items.forEach(function(track) {
        		tmp += '<div class="track_thum" data-track="' + track.id +'">';
        		if (track.album.images.length == 0) {
        			tmp += '<div class="no_thum"><i class="fa-solid fa-user"></i></div>';
        		} else {
	        		tmp += '<img src=' + track.album.images[0].url + '>';
        		}
        		tmp += '<span>' + track.name + '</span>';
        		tmp += '<span>' + track.artists[0].name + '</span>';
        		tmp += '</div>';
        	});
        	return tmp;
        }
    </script>
</body>

</html>