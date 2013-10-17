<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
제목 : ${board.title}<br/>
내용 : ${board.contents}<br/>
<c:if test="${not empty board.fileName}">
이미지 : <img src="/images/${board.fileName}" />
</c:if>
<br/>
<a href="/board">목록보기</a>
<h2>댓글 보기</h2>
<c:forEach items="${board.comments}" var="comment">
${comment.contents}
<hr/>
</c:forEach>
<form action="/board/${board.id}/comments" method="post">
	<textarea name="contents" rows="5" cols="60"></textarea>
	<input type="submit" value="댓글쓰기"/>
</form>
</body>
</html>