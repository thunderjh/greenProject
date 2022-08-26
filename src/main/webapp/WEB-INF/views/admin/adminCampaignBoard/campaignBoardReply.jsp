<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		    <meta charset="utf-8">
		    <meta http-equiv="X-UA-Compatible" content="IE=edge">
		    <meta name="viewport" content="width=device-width, initial-scale=1">
		    <meta name="description" content="">
		    <meta name="author" content="">
		    
		
		    <title>캠페인 댓글</title>
	
			<!-- jquery -->
			<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
			
			
			 <!-- Bootstrap core CSS -->
		    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
			<!-- Bootstrap  JS -->
			<script src="/resources/include/dist/js/bootstrap.min.js"></script>
			
			
		    <!-- Custom styles for this template -->
		    <link href="/resources/include/css/campaignBoardList.css" rel="stylesheet">
		
		    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
		    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
		    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>
			
		    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		    <!--[if lt IE 9]>
		      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		    <![endif]-->
		    
		    <style type="text/css">
		    .board_icon{
					width: 20px;
					height: 20px;
				}
			textarea{resize: none;}
			
			#item-template{
				display: none;
				
			}
			
		    </style>
			<script type="text/javascript">
			$(function () {
				/*기본 댓글 목록 불러오기*/
				let c_no =${campaignBoardDetail.c_no};
				
				listAll(c_no);
				
				/*비밀번호 확인 없이 삭제 버튼 제어*/
				$(document).on("click", ".delBtn", function() {
					let c_r_num = $(this).parents("div.panel").attr("data-num");
					deleteBtn(c_no, c_r_num);	
				});
				
				
				
				
				
				//댓글입력 Ajax 연동 처리 방법
				$(document).on("click", "#replyInsertBtn", function() {
					let insertUrl = "/replies/replyInsert";
					//JSON.stringify = javaScript 값 혹은 객체를 json문자열로 변환
					let value = JSON.stringify({
						c_no : c_no,
						a_id : $("#a_id").val(),
						c_r_content : $("#c_r_content").val()
					});

					$.ajax({
						url : insertUrl,
						type : "post",
						headers : {
							"Content-Type" : "application/json"
						},
						dataType : "text",
						data : value,
						error : function() {
							alert('시스템에 문제가 있어 잠시 후 다시 시도해주세요.');
						},
						beforeSend : function() {
							if (!checkForm("#c_r_content", "댓글내용을"))
								return false;
						},
						success : function(result) {
							if (result == "SUCCESS") {
								alert("댓글 등록이 완료되었습니다.");								
								listAll(c_no);
							}
						}
					});
				});
	
				
				
				
				
				
				
			}); // $ 
			
			
			function adjustHeight() {
				  var textEle = $('textarea');
				  textEle[0].style.height = 'auto';
				  var textEleHeight = textEle.prop('scrollHeight');
				  textEle.css('height', textEleHeight);
			};
				
			/*댓글*/
			function listAll(c_no) {
					//$("#reviewList").html("");
					$(".reply").detach();
					let url = "/replies/all/"+c_no;
					    
					$.getJSON(url, function (data) {
						$(data).each(function() {
							let c_r_num = this.c_r_num;	
							let c_r_content = this.c_r_content;	
							let c_r_date = this.c_r_date;	
							let a_id = this.a_id;
							let id = this.id;
							addItem(c_r_num, c_r_content, c_r_date, a_id, id);
						});
					}).fail(function(){
						alert("댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
					});
			}
			
			/*댓글 표현
			function addItem(c_r_num, c_r_content, c_r_date, a_id) {
					$("#reviewList").append(c_r_num + c_r_content + c_r_date + a_id);
			}*/
			//새로운 글을 화면에 추가하기(보여주기) 위한 함수
			function addItem(c_r_num, c_r_content, c_r_date, a_id,id){
				
			console.log("a_id = " + a_id + "c_r_date = " + c_r_date);
				let $div = $('#reviewList');
				
				let $element = $('#item-template').clone().removeAttr('id');
				$element.attr("data-num", c_r_num);
				$element.addClass("reply");
				$element.find('.panel-heading > .panel-title > .name').html( (a_id == "")? id:"관리자 : "+a_id);
				$element.find('.panel-heading > .panel-title > .date').html(" / "+c_r_date);
				$element.find('.panel-body').html(c_r_content);
				$element.find('#a-name').html("관리자 : "+a_id);
				$div.append($element);
			}
			
			/*글 삭제를 위한 Ajax 연동 처리*/
			function deleteBtn(c_no, c_r_num){
				if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
					$.ajax({
						url : '/replies/' + c_r_num,
						type : 'delete',
						headers : {
							"X-HTTP-Method-Override" : "DELETE"
						},
						dataType : 'text',
						error: function(xhr, textStatus, errorThrown){
							alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown+ " ) ");
						},
						success : function(result){
							console.log("result: "+result);
							if(result == 'SUCCESS'){
								alert("댓글 삭제가 완료되었습니다.");
								listAll(c_no);
							}
						}
					});
				}
			}
			
			
			
			</script>
		</head>
		<body>	
			  
			  	
			  
		
			<%-- 
			<div class="container">
				<div class="text-left">
				<h3>댓글 <img alt="말풍선 아이콘" class="board_icon" src="/resources/images/cmapaignBoardimage/pictogram/comment.png"> 99 </h3>
				</div>
			  <div class="panel panel-default">
			    <div class="panel-heading"><h4>사용자ID</h4> <button type="button" class="btn btn-default " id="replyInsertBtn" style="margin-left: 20px;">등록</button></div>
			    <textarea class="form-control" id="reply-text" rows="3" maxlength="999"></textarea>
			  </div>
			--%>
			<form id="replyForm" name="replyForm">
			<div class="panel panel-default">
				<table class="table">
					<tbody>
						<tr>
							<td class="col-md-1">작성자 : ${adminLogin.a_id }</td>
							
						</tr>
						<tr>
							<td class="col-md-1">댓글 내용</td>
							<td colspan="4" class="col-md-11 text-left">
								<input type="hidden" id="a_id" name="a_id" value="${adminLogin.a_id }">
								<textarea name="c_r_content" id="c_r_content" class="form-control" rows="3"></textarea>
								<div class="text-right" style="padding-top: 8px;">
								<button type="button" id="replyInsertBtn" class="btn btn-success">저장</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
			<hr>
			
 	 <!-- 댓글 리스트 시작 -->
		<div id="reviewList">
			<div id="item-template" class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">
						<span class="name"></span>
						<span class="date"></span>					
						<button type="button" data-btn="deleteBtn" class="btn btn-default gap delBtn">삭제하기</button>
						</h3>
				</div>
				<div class="panel-body"></div>
			</div>
		</div>
	<!-- 댓글 리스트 끝 -->		
	
	
		
			
	
		</body>
</html>