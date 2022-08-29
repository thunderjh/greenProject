<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<link rel="stylesheet" type="text/css" href="/resources/include/css/noticeDetail.css"/>
	
<script type="text/javascript">
	let buttonCheck= 0;	//수정버튼과 삭제버튼을 구별하기 위한 변수
	$(function(){
		$("#pwdChk").css("visibility","hidden");
		
		//수정 버튼 클릭시 처리 이벤트
		$("#updateBtn").click(function(){
			$("#pwdChk").css("visibility","visible");
			$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요").css("color","#000099");
			buttonCheck=1;
		});
		
		//글삭제 버튼 클릭시 처리 이벤트
		$("#removeBtn").click(function(){
			$.ajax({
				url: "/question/replyCnt",
				type: "post",
				data: "q_num="+$("#q_num").val(),
				dataType: "text",
				error: function(){
					alert("시스템 오류, 관리자에게 문의하세요");
				},
				success: function(resultData){
					if(resultData==0){
						$("#pwdChk").css("visibility","visible");
						$("#msg").text("작성시 입력한 비밀번호를 입력해 주세요").css("color","#000099");
						buttonCheck = 2;
					}else{
						alert("댓글 존재시 게시물 작성할 수가 없습니다. \n댓글 삭제 후 다시 확인해 주세요");
						return;
					}
				}
			});
		});
		
		//비밀번호 입력 양식 enter 제거
		$("#q_pwd").bind("keydown",function(event){
			if(event.keyCode===13){
				event.preventDefault();
			}
		});
		
		//비밀번호 확인 버튼 클릭시 처리 이벤트
		$("#pwdBtn").click(function(){
			questionPwdConfirm();
		});
		
		//글쓰기 버튼 클릭시 처리 이벤트
		$("#writeBtn").click(function(){
			location.href="/question/writeForm";
		});
		
		//목록 버튼 클릭시 처리 이벤트
		$("#listBtn").click(function(){
			location.href="/question/questionList";
		});
		
	}); //$(function() 종료)
	
	//비밀번호 입력 후 확인 버튼 클릭시 실질적인 처리 함수
	function questionPwdConfirm(){
		
			$.ajax({
				url: "/question/pwdConfirm",
				type: "post",
				data: $("#f_pwd").serialize(),
				dataType: "text",
				error: function(){
					alert('시스템 오류 입니다. 관리자에게 문의하세요');
				},
				success: function(resultData){
					let goUrl="";
					if(resultData=="실패"){
						$("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color","red");
						$("#q_pwd").select();
					}else if(resultData=="성공"){
						$("#msg").text("");
						if(buttonCheck==1){
							goUrl = "/question/updateForm";
							$("#f_data").attr("action",goUrl);
							$("#f_data").submit();
						}else if(buttonCheck==2){
							if(confirm("정말 삭제하시겠습니까?")){
								goUrl="/question/questionDelete";
								$("#f_data").attr("action",goUrl);
								$("#f_data").submit();
							}
						}
					}
				}
			})
		
	};
	
</script>
</head>
<body>
	<div class="contentContainer container">

		<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="q_num" value="${detail.q_num}"/>
		</form>
		
		<!-- 비밀번호 확인 버튼 및 버튼 추가 시작 -->
			<div class="row text-center">
				<div id="pwdChk" class="authArea col-md-8 text-left">
					<form name="f_pwd" id="f_pwd" class="form-inline">
						<input type="hidden" name="q_num" id="q_num" value="${detail.q_num}"/>
						<label for="q_pwd" id="q_pwd">비밀번호 :</label>
						<input type="password" name="q_pwd" id="q_pwd" class="form-control"/>
						
						<button type="button" id="pwdBtn" class="btn btn-default">확인</button>
						<span id="msg"></span>
					</form>
				</div>
				<div class="btnArea col-md-4 text-right">
					<input type="button"	value="글수정" id="updateBtn"	 class="btn btn-success">
					<input type="button"	value="글삭제" id="removeBtn"	 class="btn btn-success">
					<input type="button"	value="글쓰기" id="writeBtn"	 class="btn btn-success">
					<input type="button"	value="목록" id="listBtn"	 class="btn btn-success">			
				</div>
			</div>
			<br/>
			
		<!-- 공지사항 글 상세보기 시작 -->
		<div class="contentTB text-center">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="col-md-12" >
							<span class="span_left">${detail.q_title}</span>
							<span class="span_right"><em>등록일</em>${detail.q_date}</span>
						</td>
					</tr>
					<tr>
						<td class="col-md-12">
							<c:if test="${not empty detail.q_file}">
								<img src="/uploadStorage/question/${detail.q_file}"/><br/>
							</c:if>
							${detail.q_content}
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<jsp:include page="reply.jsp"/>
	</div>
</body>