<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
/* System Name, CSS Version_Creater_Date */
/* Common */ 
body,p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textare a,button,select{margin:0;padding:0}
body,input,textarea,select,button,table{font-family:'돋움',Dotum,AppleGothic,sans- serif;font-size:1em}
img,fieldset{border:0}
ul,ol{list-style:none}
em,address{font-style:normal} a{text-decoration:none} a:hover,a:active,a:focus{text-decoration:underline}

div#wrap {
	width : 800px;
	1border : 1px solid red;
	margin-right : auto;
	margin-left : auto;
	margin-top  :20px;
	font-size : 0.9em;
	color : rgb(94, 87, 87);
}

nav {
	text-align: right;
	padding-right : 20px;
}

nav ul li {
	display : inline-block;
	padding-right : 10px;
	letter-spacing : 0.2em;
	font-size : 1.2em;
}

section {
	margin-top : 40px;
	1border : 1px solid red;
	width  : 70%;
	margin-right : auto;
	margin-left : auto;
	padding : 10px;
}

article {
	margin-top : 30px;
	border : 1px solid  rgb(226, 219, 219);
}

article  >h1 {
	font-family : Raleway,Helvetica Neue,Helvetica,Arial,sans-serif;
	font-size : 0.8em;
	font-weight : 300;
	letter-spacing : 0.1em;
	margin : 10px 0px;
	color : rgb(185, 185, 185);
	margin-left : 1%;
}

article div.imgWrap {
	width : 98%;
	border : 1px solid  rgb(226, 219, 219);
	margin-bottom : 10px;
	margin-right : auto;
	margin-left : auto;
}

div.imgWrap > img {
	max-width : 100%;
	border-right : 1px solid rgb(226, 219, 219);
	border-bottom : 1px solid rgb(226, 219, 219);
}

div.contents {
	1border : 1px solid  rgb(226, 219, 219);
}

div.contents > p {
	word-wrap:break-word;
	padding : 1%;
	line-height :1.4em;
}

div.commentWrap {
	margin-top : 20px;
	1border : 1px solid red;
}

div.commentWrite {
	margin : 5px 0px;
}

div.commentWrite form {
	text-align : right;
}

.commentWrite input[type=submit] , input[type=reset]  {
	border : 0px;
	padding : 5px;
	background-color : gray;
	color : white;
	border-radius : 3px;
	font-size : 0.8em;
}

.commentList p {
	margin-bottom: 10px;
	border-bottom: 1px solid rgb(247, 247, 247)
}

.commentList p:first-of-type {
	padding-top: 10px;
}

.commentList p:last-of-type {
	border-bottom : 1px solid rgb(218, 218, 218);
	padding-bottom: 10px;
}
.commentList > .commentNum {
	font-size : 0.8em;
	border-bottom : 1px solid rgb(218, 218, 218);
}

/* write post */
section#writePost {
	1border : 1px solid red;
}

#writePost > div#formArea {
	margin-top : 30px;
	border : 1px solid  rgb(226, 219, 219);
	padding : 1%;
}

div#formArea {
 	1padding-left : 100px;
 	1padding-top : 100px;
}

div.textareaWrap {
	width  :98%;
	margin : 20px 0px;
	border : 1px solid  rgb(226, 219, 219);
	text-align:center;
}

div.textareaWrap > textarea {
	width  :96%;
	padding : 8px;
	resize : none;
	border : 0px;
	outline : 0;
	font-size : 0.8em;
}


#formArea input[type=text] {
	height : 30px;
}

#formArea input[type=submit] , input[type=reset]  {
	margin-top : 20px;
	border : 0px;
	padding : 5px;
	background-color : gray;
	color : white;
	border-radius : 3px;
	font-size : 0.8em;
}

</style>
</head>

<body>
<div id="wrap">
 	<nav>
	 	<!--  ul>
		 	<li><a href="/board">list</a></li>
		 	<li><a href="/board/form">write</a></li>
	 	</ul -->
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
				
				<div class="commentList">
					<div class="commentNum"> <span>2</span>개의 댓글</div>
					<c:forEach items="${board.comments}" var="comment">
						<p>
							<span>${comment.contents}</span>
						</p>
					</c:forEach>
				</div>
				<div class="commentWrite">
					<form action="/board/${board.id}/comments" method="post">
						<div class="textareaWrap">
							<textarea name="contents" rows="1" cols="60" placeholder="여기에 댓글을 쓰시면 되요..."></textarea>
						</div>
						<input type="submit" value="댓글쓰기"/>
					</form>
				</div>
			</div>
		</section>
	</c:forEach>
 </div>
 
 <script>
function initPage () {
	console.log('init');
	countComments();
}

function countComments () {
	var commnetList = document.querySelectorAll('.commentList');
	for(var i =0 ; i < commnetList.length ; i++) {
		var currentNode = commnetList[i];
		var nPListCount = currentNode.querySelectorAll('p').length;
		currentNode.querySelector('span').innerText = nPListCount;
	}
	//document.querySelector('#commentNum span').innerText = nCommentsCount;
}

function createComments() {
	var data = new FormData();
	data.append( 'contents', '댓글 짱 잘 들어간다.');
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "/board/11/comments.json");
	xmlhttp.onreadystatechange = function ( response ) {
		console.log(response.currentTarget.responseText);
	};
	xmlhttp.send(data);	
}

window.onload = initPage;

</script>
</body>
</html>