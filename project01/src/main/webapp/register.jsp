<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Groove | 회원가입</title>
    <link rel="stylesheet" href="css/register.css">
    <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
</head>
<body>
    <div id="wrap">
        <div id="container">
            <form id="contents" name="form" action="responseRegister.jsp">
                <div class="logo">
                    <a href="index.html"><h2>Groove</h2></a>
                </div>
                <div class="input_area">
                    <ul>
                        <li>
                            <label for="id"><span>*</span>아이디</label>
                            <input type="text" name="id" id="id" autocomplete="off" required autofocus>
                            <span id="nullId" class="alert"></span>
                        </li>
                        <li>
                            <label for="password"><span>*</span>비밀번호</label>
                            <input type="password" name="password" id="password" required>
                            <span id="nullPw" class="alert"></span>
                        </li>
                        <li>
                            <label for="passwordCheck"></label>
                            <input type="password" name="passwordCheck" id="passwordCheck" placeholder="비밀번호 확인" required>
                            <span id="nullPwCheck" class="alert"></span>
                        </li>
                        <li>
                            <label for="tel"><span>*</span>휴대폰</label>
                            <input type="tel" name="tel" id="tel" placeholder="숫자만 입력" autocomplete="off" required>
                            <span id="nullTel" class="alert"></span>
                        </li>
                        <li>
                            <label for="mai1l"><span>*</span>이메일</label>
                            <input type="text" name="mail1" id="mail1" autocomplete="off" required> @
                            <div id="mail2_area" style="display: inline-block;">
                                <select name="mail2" id="mail2">
                                    <option value="naver.com" selected>naver.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="daum.com">daum.net</option>
                                    <option value="self">직접입력</option>
                                </select>
                            </div>
                            <span id="nullMail" class="alert"></span>
                        </li>
                        <li>
                            <label>&nbsp;성별</label>
                            <div class="radio_area">
                                <label for="man">남자</label>
                                <input type="radio" name="gender" id="man" value="m">
                                <label for="woman">여자</label>
                                <input type="radio" name="gender" id="woman" value="w">
                                <label for="none">선택안함</label>
                                <input type="radio" name="gender" id="none" value="n" checked>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="checkbox_area">
                    <div class="area1">
                        <input type="checkbox" name="allCheck" id="allCheck">
                        <label for="allCheck">아래 내용에 모두 동의합니다</label>
                    </div>
                    <div class="area2">
                        <div class="check">
                            <input type="checkbox" name="check" id="check1" class="isCheck" value="1" required>
                            <label for="check1">(필수) 이용약관에 동의합니다</label>
                        </div>
                        <div class="check">
                            <input type="checkbox" name="check" id="check2" class="isCheck" value="2" required>
                            <label for="check2">(필수) 개인정보 수집 및 이용에 대한 안내에 동의합니다</label>
                        </div>
                        <div class="check">
                            <input type="checkbox" name="check" id="check3" class="isCheck" value="3">
                            <label for="check3">(선택) 이벤트, 마케팅 홍보 수신에 동의합니다</label>
                        </div>
                    </div>
                </div>
                <div class="button_area">
                    <button type="button" id="submit_btn">회원가입</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        let btn = document.getElementById('submit_btn');

        let allCheck = document.getElementById('allCheck');
        let checkbox = document.querySelectorAll('.isCheck');

        allCheck.addEventListener('change', function() {
            let isCheck;
            if (allCheck.checked) {
                isCheck = true;
            } else {
                isCheck = false;
            }
            for(let i=0; i<checkbox.length; i++) {
                checkbox[i].checked = isCheck;
            }
        });
        for (let i=0; i<checkbox.length; i++) {
            checkbox[i].addEventListener('change', function() {
                if (checkbox[0].checked == true && checkbox[1].checked == true && checkbox[2].checked && true) {
                    allCheck.checked = true;
                } else {
                    allCheck.checked = false;
                }
            })
        }

        btn.onclick = function() {
            let check = true;
            if (document.getElementById('id').value == "") {
                document.getElementById('nullId').innerHTML = '아이디를 입력해주세요.';
                check = false;
            } else {
                document.getElementById('nullId').innerHTML = "";
            }
            if (document.getElementById('password').value == "") {
                document.getElementById('nullPw').innerHTML = '비밀번호를 입력해주세요.';
                check = false;
            } else {
                document.getElementById('nullPw').innerHTML = "";
            }
            if (document.getElementById('passwordCheck').value != document.getElementById('password').value) {
                document.getElementById('nullPwCheck').innerHTML = '비밀번호가 다릅니다.';
                check = false;
            } else {
                document.getElementById('nullPwCheck').innerHTML = "";
            }
            if (document.getElementById('tel').value == "") {
                document.getElementById('nullTel').innerHTML = '전화번호를 입력해주세요.';
                check = false;
            } else {
                document.getElementById('nullTel').innerHTML = "";
            }
            if (document.getElementById('mail1').value == "") {
                document.getElementById('nullMail').innerHTML = '이메일을 앞자리를 입력해주세요.';
                check = false;
            } else if (document.getElementById('mail2').value == "") {
                document.getElementById('nullMail').innerHTML = '이메일을 뒷자리를 입력해주세요.';
                check = false;
            } else {
                document.getElementById('nullMail').innerHTML = "";
            }

            if (!check) {
                return;
            }
            
            if(!document.getElementById('check1').checked) {
                alert('이용약관에 동의해주세요.');
                return;
            }
            if(!document.getElementById('check2').checked) {
                alert('개인정보 수집 및 이용에 동의해주세요.');
                return;
            }

            if (check) {
                document.getElementById('contents').submit();
            }
        }

        let mail = document.getElementById('mail2');
        
        mail.addEventListener('change', function() {
            if (mail.value == 'self') {
                mail.remove();
                let text = "<input type='text' name='mail2' id='mail2' autocomplete='off'>";
                document.getElementById('mail2_area').innerHTML = text;
            }
        });
    </script>
</body>
</html>