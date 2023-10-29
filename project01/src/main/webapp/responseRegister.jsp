<%@page import="util.JSFunction"%>
<%@page import="dto.User"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String tel = request.getParameter("tel");
		String mail1 = request.getParameter("mail1");
		String mail2 = request.getParameter("mail2");
		String email = mail1 + "@" + mail2;
		String gender = request.getParameter("gender");
		String[] agrees = request.getParameterValues("check");
		String agree = String.join(" ", agrees);
		
		User user = new User(id, pw, tel, email, gender, agree);
		UserDao dao = new UserDao(application);
		int res = dao.insertUser(user);
		
		if (res == 1) {
			JSFunction.alertLocation("환영합니다! 회원가입 성공하셨습니다!", "login.jsp", out);
		}
		else {
			JSFunction.alertBack("다시 시도해주세요.", out);
		}
	%>
</body>
</html>