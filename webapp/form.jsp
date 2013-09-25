<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 글쓰기 화면 임다</h1>
<div>
	<form action="/board" method="post">
		 제목 : <input type="text" name="title" size=40> <br />
		<textarea name="contents" rows="10" cols="50">글자를 미리 넣어보자</textarea><br />
		<input type="submit" value="보내기">
	</form>
</div>
</body>
</html>