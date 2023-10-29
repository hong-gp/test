<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groove | 로그인</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
</head>
<body>
    <div id="wrap">
        <div id="container">
            <form id="contents" name="form" action="responseLogin.jsp">
                <div class="logo">
                    <a href="index.html"><h2>Groove</h2></a>
                </div>
                <div class="input_area">
                    <ul>
                        <li>
                            <label for="id">아이디</label>
                            <input type="text" name="id" id="id" autocomplete="off" required autofocus>
                            <span id="nullId" class="alert"></span>
                        </li>
                        <li>
                            <label for="password">비밀번호</label>
                            <input type="password" name="password" id="password" required>
                            <span id="nullPw" class="alert"></span>
                        </li>
                    </ul>
                    <div class="button_area">
                        <button type="button" id="submit_btn">로그인</button>
                    </div>
                    <div id="login_menu">
                        <ul>
                            <li><a href="#">비밀번호 찾기</a></li>
                            <span>|</span> 
                            <li><a href="#">아이디 찾기</a></li>
                            <span>|</span> 
                            <li><a href="register.html">회원가입</a></li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script>
        let id = document.getElementById('id');
        let pw = document.getElementById('password');
        let btn = document.getElementById('submit_btn');

        btn.addEventListener('click', function() {
            if (id.value == "") {
                document.getElementById('nullId').innerHTML = "아이디를 입력해주세요";
                return;
            } else {
                document.getElementById('nullId').innerHTML = "";
            }
            if (pw.value == "") {
                document.getElementById('nullPw').innerHTML = "비밀번호를 입력해주세요";
                return;
            } else {
                document.getElementById('nullPw').innerHTML = "";
            }
            form.submit();
        })
    </script>
</body>
</html>