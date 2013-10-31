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
 <script>
function initPage () {
	countComments();
	registerEvents();
	 imageViewerHandler();
	
}

function countComments () {
	var commnetList = document.querySelectorAll('.commentList');
	for(var i =0 ; i < commnetList.length ; i++) {
		var currentNode = commnetList[i];
		var nPListCount = currentNode.querySelectorAll('p').length;
		currentNode.parentNode.parentNode.querySelector(".commentNum > span").innerText = nPListCount;
	}
	//document.querySelector('#commentNum span').innerText = nCommentsCount;
}
	
function registerEvents() {
	// toggle comment 방법1.
	//commentToggleHandler("commControl" , 'click' ,toggleComment);
    
	// toggle comment 방법2
	 var eleList = document.getElementsByClassName('commControl');
	 for (var i=0 ; i < eleList.length ; i++) {
	  		eleList[i].addEventListener('click',toggleCommentsOrigin, false);
	  }
	 
	 // comment sumbit click
	 var formList = document.querySelectorAll('.commentWrite input[type=submit]');
	 //console.log(formList);
	 for ( var j=0 ; j < formList.length ; j++) {
		 console.log(formList[j]);
		 formList[j].addEventListener('click',writeComments, false);
	 }
}

function writeComments(e) {
	e.preventDefault();
	console.log("clicked");
}

function toggleCommentsOrigin(e) {
	e.preventDefault();
	var curEle = e.target.parentNode.parentNode.nextElementSibling;
	var curDisplayValue = window.getComputedStyle(curEle , null).getPropertyValue("display");
	
	if(curDisplayValue == "none") curEle.style.display = "block";
	else if(curDisplayValue == "block") curEle.style.display = "none";
}

function commentToggleHandler(className,eventType, fn) {
	//var ele = document.querySelector(wrapId);
	var ele = document.body;
    ele.addEventListener(eventType , function(e) {
        if (e.target.parentNode.className === className) {
        	e.preventDefault();
        	fn(e.target.parentNode.parentNode.nextElementSibling);
        }
    } , false);
}


function toggleComment(curEle) {
	// element의 display속성을 가져온다.
	var style = window.getComputedStyle(curEle, null);
	var displayValue = style.display;
	
	//접혀있음 펼치고, 펼쳐있으면 접는다.
	if (displayValue === "none") { curEle.style.display = "block";}
	else {curEle.style.display = "none";}
	
	//curEle.style.height = "300px"; //with "overflow hidden" , "transition"
}

function imageViewerHandler() {
	var ele = document.querySelectorAll(".imgWrap > img");
	for(var i = 0 ; i  < ele.length ; i++) {
		ele[i].addEventListener('click' ,showImageViewer , false);
	}
}

function showImageViewer(e) {
	//image viewer element
	var eleViewDiv = document.querySelector("#imgviewer");
	var eleViewImage  = document.querySelector("#imgviewer > img");
	
	//dimmed 
	var clientWidth = document.body.clientWidth;
	var clientHeight = document.body.clientHeight;
	
	var dl = document.getElementById('dimmedLayer');
	
	//show Dimmed layer
	setCss(dl, {
		width 					: clientWidth+"px",
		height 					: clientHeight+"px",
		opacity 					: 0.8,
		backgroundColor 	: "darkgray",
		zIndex 					: 100,
		display					: "block"
	});
	
	//remove Dimmed layer registration
	dl.addEventListener('click' ,function(e){
		setCss(dl, {
			width 					: 0+"px",
			height 					: 0+"px",
			opacity 					: 0,
			zIndex 					: 1,
			display					: "none"
		});
		var style = window.getComputedStyle(eleViewDiv, null);
		var displayValue = style.display;
		
		//toggle image viewer display
		if(displayValue == "block")  {
			setCss(eleViewDiv, {display : "none"});
			//prevent Scroll Event
			window.removeEventListener('mousewheel', wheelHandler , false);
		}
	} ,false);
	
	//image viewer
	var eleViewDiv = document.querySelector("#imgviewer");
	var eleViewImage  = document.querySelector("#imgviewer > img");
	
	//var clientWidth = document.body.clientWidth;
	var ele = e.target;
	var imgWidth  = ele.naturalWidth;  //원래 이미지.
	
	if(clientWidth <= imgWidth) imgWidth = 1200;   //화면보다 큰 이미지라면 최대값 지정.(이미지 뷰어의 max width) 
	leftMargin = (clientWidth-imgWidth) / 2; //와우 간격을 동일하게 맞추는 계산. 
	
	eleViewDiv.style.marginLeft = leftMargin +"px";
	eleViewDiv.style.top = document.body.scrollTop +100 + "px";    //100은 상단에서 어느정도 떨어뜨리기 위해서. 
	eleViewImage.src = ele.src;
	setCss(eleViewDiv, {display : "block"});
	
	//prevent Scroll Event
	window.addEventListener('mousewheel', wheelHandler, false);
}

function setCss(element,o) {
	for (v in o) {
		element.style[v] = o[v];
	}
}

function wheelHandler (e) {
		e.preventDefault();
}


window.onload = initPage;

</script>
</body>
</html>