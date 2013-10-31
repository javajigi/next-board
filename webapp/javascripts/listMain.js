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
	 for ( var j=0 ; j < formList.length ; j++) {
		 formList[j].addEventListener('click',writeComments, false);
	 }
}

function writeComments(e) {
	 e.preventDefault();
	 
	 var eleForm = e.currentTarget.form;  //form element
	 var eleCommentList = eleForm.parentNode.previousElementSibling;   //list element
	 var sID = eleForm[0].value;              //hidden type element
	 var oFormData = new FormData(eleForm);
	 var request = new XMLHttpRequest();
	 var url = "/board/" +sID + "/comments.json";
	  
     request.open("POST" , url, true);
     
     request.onreadystatechange = function() {
         if(request.readyState ==4 && request.status ==200) {
                 var obj = JSON.parse(request.responseText);
                 //append HTML
                 eleCommentList.insertAdjacentHTML("beforeend" , "<p><span>"+ obj.contents +"</span></p>" );
         }
     };
     request.send(oFormData);
}

function toggleCommentsOrigin(e) {
	e.preventDefault();
	var curEle = e.target.parentNode.parentNode.nextElementSibling;
	var curDisplayValue = window.getComputedStyle(curEle , null).getPropertyValue("display");
	
	if(curDisplayValue == "none") curEle.style.display = "block";
	else if(curDisplayValue == "block") curEle.style.display = "none";
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

/********   toggle comment 방법 1 START   *********/ 
/*
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
*/
/*
function toggleComment(curEle) {
	// element의 display속성을 가져온다.
	var style = window.getComputedStyle(curEle, null);
	var displayValue = style.display;
	
	//접혀있음 펼치고, 펼쳐있으면 접는다.
	if (displayValue === "none") { curEle.style.display = "block";}
	else {curEle.style.display = "none";}
	
	//curEle.style.height = "300px"; //with "overflow hidden" , "transition"
}
*/
/********   toggle comment 방법 1 END   *********/ 

window.onload = initPage;
