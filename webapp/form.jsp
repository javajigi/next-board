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
	<h1> new post! </h1>
</header>
	<div id="formArea">
		<form action="/board" method="post" enctype="multipart/form-data">
			 제목  <input type="text" name="title" size=40> <br />
			<textarea name="contents" rows="10" cols="50"></textarea><br />
			<input type="file" name="filename"> <br />
			<input type="submit" value="전송합니다">
			<input type="reset" value="지웁니다">
		</form>
	</div>
</div>
</body>
</html>