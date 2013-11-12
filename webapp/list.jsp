<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" type="text/css" href="/stylesheets/listMain.css" />
</head>

<body>
<div id="wrap">
 	 <nav>
	 	<ul>
	 		<c:choose>
	 		<c:when test="${empty sessionScope.userId}">
	 		<li><a href="/login/form">로그인</a></li>
	 		</c:when>
	 		<c:otherwise>
	 		<li>${sessionScope.userId}님 환영합니다.</li>
	 		</c:otherwise>
	 		</c:choose>
	 	</ul>
	 </nav>
	 
	 <section id="writePost">
	 	<div id="formArea">
			<form action="/board" method="post" enctype="multipart/form-data">
				 제목  <input type="text" name="title" size=40> <br />
				<div class="textareaWrap">
						<textarea name="contents" rows="3" cols="60" placeholder="새로운 글 올리기..."></textarea>
				</div>
				<input type="file" name="filename"> <br />
				<input type="submit" value="전송합니다">
				<input type="reset" value="지웁니다">
			</form>
		</div>
	 </section>
    
	<c:forEach items="${boards}" var="board">
		<section>
	 		<article>
			 	<h1>${board.title}</h1>
				<c:if test="${not empty board.fileName}">
				 <div class="imgWrap">
				 	<img src="/images/${board.fileName}" />
				 </div>
				</c:if>
				<div class="contents">
					<p> ${board.contents}</p>
				</div>
			</article>
			<div class="commentWrap">
				<c:if test="${empty board.comments}">
					<div> <span>댓글이 없습니다 ㅡ.ㅡ;; </span></div>
				</c:if>
				
				<div class="commentTitle">
					<div class="commentNum">
						 <span>2</span>개의 댓글
					</div>
					<div class="commControl">
						<a href="#">댓글 보여줘</a>
					</div>
				</div>
				<div class="commentBody">
					<div class="commentList">
						<c:forEach items="${board.comments}" var="comment">
							<p>
								<span>${comment.contents}</span>
							</p>
						</c:forEach>
					</div>
					<div class="commentWrite">
						<form action="/board/${board.id}/comments" name="commentWrite" method="post">
							<div class="textareaWrap">
								<input type="hidden" name="id" value="${board.id}">
								<textarea name="contents" rows="1" cols="60" placeholder="여기에 댓글을 쓰시면 되요..."></textarea>
							</div>
							<input type="submit" value="댓글쓰기"/>
						</form>
					</div>
				</div>
			</div>

		</section>
	</c:forEach>
	<div id="dimmedLayer">
	</div>
 </div>
 
 <div id="imgviewer">
	<img src="" />
</div>
 <script src="/javascripts/listMain.js"></script>
</body>
</html>