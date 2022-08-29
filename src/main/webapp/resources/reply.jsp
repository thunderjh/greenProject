<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<style>
		#item-template{display:none;}
	</style>
	<script type="text/javascript">
		let message = "작성시 입력한 비밀번호를 입력해 주세요.", btnKind="";
	
		$(function(){
			$("form[name='pwdForm']").hide();
			
			//기본 덧글 목록 불러오기
			let q_num = ${detail.q_num};
			listAll(q_num);
		
		//글입력을 위한 Ajax 연동 처리
		//$("#replyInsertBtn").click(function(){
		$(document).on("click", "#replyInsertBtn", function(){
			let insertUrl = "/replies/replyInsert";
			
			//JSON.stringify(): JavaScript 값이나 객체를 JSON 문자열로 변환
			let value = JSON.stringify({
				q_num:q_num,
				q_name:$("#q_name").val(),
				q_r_passwd:$("#q_r_passwd").val(),
				q_r_content:$("#q_r_content").val()
			});
			
			$.ajax({
				url : insertUrl,
				type : "post",
				headers : {
					"Content-Type" : "application/json"
				},
				dataType: "text",
				data : value,
				error: function(xhr, textStatus, errorThrown){
					alert(textStatus + " (HTTP-"+xhr.status + " / "+errorThrown+")");
				},
				beforeSend: function(){
					if(!checkForm("#q_name","작성자를")) return false;
					else if(!checkForm("#q_r_passwd","비밀번호를")) return false;
					else if(!checkForm("#q_r_content", "댓글내용을")) return false;
				},
				success: function(result){
					if(result=="SUCCESS"){
						alert("댓글 등록이 완료되었습니다.");
						dataReset();
						listAll(q_num);
					}
				}
			});
		});
		
		//비밀번호 확인 없이 수정버튼 제어
		$(document).on("click", "button[data-btn='upBtn']", function(){
			let panel = $(this).parents("div.panel");
			let q_r_num = panel.attr("data-num");
			updateForm(q_r_num, panel);
		});
		
		//수정 폼 화면 구현 함수
		function updateForm(q_r_num, panel){
			$("#q_name").val(panel.find(".panel-title .name").html());
			$("#q_name").prop("readonly", true);
			
			let content = panel.find(".panel-body").html();
			content = content.replace(/(<br>|<br>\/>|br\/>)/g, '\r\n');
			$("#q_r_content").val(content);
			
			$("#replyForm button[type='button']")	.attr("id", "replyUpdateBtn");
			$("#replyForm button[type='button']").attr("data-rnum",q_r_num);
		}
		
		//수정을 위한 Ajax 연동 처리
		$(document).on("click", "#replyUpdateBtn", function(){
			let q_r_num = $(this).attr("data-rnum");
			$.ajax({
				url: '/replies/' + q_r_num,
				type: 'put',
				headers: {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data:JSON.stringify({
					q_r_content:$("#q_r_content").val(),
					q_r_passwd:$("#q_r_passwd").val()
				}),
				dataType: 'text',
				error: function(xhr, textStatus, errorThrown){
					alert(textStatus + " (HTTP-"+xhr.status + " / "+ errorThrown + ")");
				},
				beforeSend: function(){
					if(!checkForm("#q_r_content", "댓글내용을")) return false;
				},
				success:function(result){
					console.log("result: "+result);
					if(result == "SUCCESS"){
						alert("댓글 수정이 완료되었습니다.");
						dataReset();
						listAll(q_num);
					}
				}
			});
		});
		
		/* $(document).on("mouseenter", "button[data-btn='delBtn']", function(){
			
		}) */
		
		//비밀번호 확인 없이 삭제 버튼 제어
		$(document).on("click", "button[data-btn='delBtn']", function(){
			let q_r_num = $(this).parents("div.panel").attr("data-num");
			deleteBtn(q_num, q_r_num);
		});
		
	});//최상위 $(종료)
	
		// 댓글 목록 보여주는 함수
		function listAll(q_num){
			$(".reply").detach();		//detach(): 선택한 요소를 DOM 트리에서 삭제.
			
			let url = "/replies/all/"+q_num;
			
			$.getJSON(url, function(data){
				$(data).each(function(data){
					let q_r_num = this.q_r_num;
					let q_name = this.q_name;
					let q_r_content = this.q_r_content;
					let q_r_date = this.q_r_date;
					q_r_content = q_r_content.replace(/(\r\n|\r|\n)/g,"<br/>");
					addItem(q_r_num, q_name, q_r_content, q_r_date);
				});
			}).fail(function(){
				alert("댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
			});
		};
		
		//새로운 글을 화면에 추가하기(보여주기) 위한 함수
		function addItem(q_r_num, q_name, q_r_content, q_r_date){
			
		console.log("q_name" + q_name + "q_r_date" + q_r_date);
			let $div = $('#reviewList');
			
			let $element = $('#item-template').clone().removeAttr('id');
			$element.attr("data-num", q_r_num);
			$element.addClass("reply");
			$element.find('.panel-heading > .panel-title > .name').html(q_name+"님");
			$element.find('.panel-heading > .panel-title > .date').html(" / "+q_r_date);
			$element.find('.panel-body').html(q_r_content);
			
			$div.append($element);
		}
		
		//입력 폼 초기화
		function dataReset(){
			$("#replyForm").each(function(){
				this.reset();
			});
			
			$("#q_name").prop("readonly", false);
			$("#replyForm button[type='button']").removeAttr("data-rnum");
			$("#replyForm button[type='button']").attr('id', "replyInsertBtn");
		}
		
		//글 삭제를 위한 Ajax 연동 처리
		function deleteBtn(q_num, q_r_num){
			if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
				$.ajax({
					url : '/replies/' + q_r_num,
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
							listAll(q_num);
						}
					}
				});
			}
		}
</script>
</head>
<body>
	<div id="replyContainer">
		<!-- 댓글 입력 화면 -->
		<form id="replyForm" name="replyForm">
			<div class="panel panel-default">
				<table class="table">
					<tbody>
						<tr>
							<td class="col-md-1">작성자</td>
								<td class="col-md-3 text-left">
									<input type="text" name="q_name" id="q_name" maxlength="5" class="form-control"/>
		 						</td>
							<td class="col-md-1">비밀번호</td>
							<td class="col-md-3 text-left">
								<input type="password" name="q_r_passwd" id="q_r_passwd" maxlength="18" class="form-control">
							</td>
							<td class="col-md-4">
								<button type="button" id="replyInsertBtn" class="btn btn-success">저장</button>
							</td>
						</tr>
						<tr>
							<td class="col-md-1">댓글 내용</td>
							<td colspan="4" class="col-md-11 text-left">
								<textarea name="q_r_content" id="q_r_content" class="form-control" rows="3"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		
		<!-- 비밀번호 확인 -->
			<form name="pwdForm" id="pwdForm" class="form-inline inline passwdArea">
				<div class="form-group">
					<label for="passwd">비밀번호 : </label>
					<input type="password" name="passwd" class="form-control passwd gap"/>
				</div>
				<button type="button" class="btn btn-deault pwdCheckBtn gap">확인</button>
				<button type="button" class="btn btn-deault pwdCheckBtn gap">취소</button>
				<span class="msg"></span>
			</form>
		
		<!-- 리스트 영역 -->

		
	</div>
</body>
</html>