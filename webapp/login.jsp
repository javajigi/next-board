<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/newWrite.css" />
</head>
<body>
<div id="wrap">
<header> 
	<h1>로그인</h1>
</header>
	<div id="formArea">
		<form action="/login" method="post">
			아이디 : <input type="text" name="userId" size=40 /> <br />
			비밀번호 : <input type="password" name="password" size=40>
			<input type="submit" value="로그인">
		</form>
	</div>
</div>
</body>
</html>