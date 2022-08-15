<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/MissionCommon.jspf"%>
<style>
#item-template {
	display: none;
}
</style>
<!-- 미션인증게시판댓글 -->
<script type="text/javascript">
	$(function() {
		let m_no = ${detail.m_no};
		let id = "${pvo.id}";
		listAll(m_no);

		//댓글입력
		$(document).on("click", "#btnReplySave", function() {
			let insertUrl = "/missionReplies/replyInsert";

			let value = JSON.stringify({
				m_no : m_no,
				id : id,
				m_r_content : $("#m_r_content").val()
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
					if (!checkForm("#m_r_content", "댓글내용을"))
						return false;
				},
				success : function(result) {
					if (result == "SUCCESS") {
						alert("댓글 등록이 완료되었습니다.");
						dataReset();
						listAll(m_no);
					}
				}
			});
		});

		//댓글 삭제
		$(document).on("click", "button[data-btn='delBtn']", function() {
			let m_r_num = $(this).parents("div.media").attr("data-num");
			deleteBtn(m_no, m_r_num, id);
		});

		//댓글 수정
		$(document).on("click", "button[data-btn='upBtn']", function() {
			let panel = $(this).parents("div.media");
			let m_r_num = panel.attr("data-num");
			updateForm(m_r_num, panel);
		});

		//댓글 수정 위한 Ajax연동 처리
		$(document).on("click", "#btnReplyUpdate", function() {
			let m_r_num = $(this).attr("data-rnum");
			$.ajax({
				url : '/missionReplies/' + m_r_num,
				type : 'put',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				data : JSON.stringify({
					m_r_content : $("#m_r_content").val(),
					id : id
				}),
				dataType : 'text',
				error : function() {
					alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요.");
				},
				beforeSend : function() {
					if (!checkForm("#m_r_content"))
						return false;
				},
				success : function(result) {
					if (result == "SUCCESS") {
						alert("댓글 수정이 완료되었습니다.");
						dataReset();
						listAll(m_no);
						location.reload();
					}else if(result =="FAILURE"){
						alert("작성자만 댓글 수정이 가능합니다.");
						dataReset();
						location.reload();
					}
					
				}
			});
		});

	}); //최상위 $ 종료

	//댓글 목록 보여주는 함수
	function listAll(m_no) {
		$(".reply").detach();

		let url = "/missionReplies/all/" + m_no;

		$.getJSON(url, function(data) {
			$(data).each(function() {
				let m_r_num = this.m_r_num;
				let id = this.id;
				let m_r_content = this.m_r_content;
				let m_r_date = this.m_r_date;

				m_r_content = m_r_content.replace(/(\r\n|\r|\n)/g, "<br />");
				template(m_r_num, id, m_r_content, m_r_date);
			});
		}).fail(function() {
			alert('댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.');
		});

	}

	//댓글 리스트 복제
	function template(m_r_num, id, m_r_content, m_r_date) {
		let $div = $("#reviewList");
		let $element = $("#item-template").clone().removeAttr('id');
		$element.attr("data-num", m_r_num);
		$element.addClass("reply");
		$element.find('.panel-heading > .media-body > .name').html(id + " ");
		$element.find('.panel-heading > .media-body > .date').html(m_r_date);
		
		let loginName = "${pvo.id}";
		if(loginName !=id){
			$element.find('.panel-heading > .media-body > button').detach();
		}
		$element.find('.body').html(m_r_content);

		$div.append($element);
	}

	//데이터리셋
	function dataReset() {
		$("#missionReplyForm").each(function() {
			this.reset();
		});
	}

	//댓글 삭제
	function deleteBtn(m_no, m_r_num, id) {
		if (confirm("선택하신 댓글을 삭제하시겠습니까?")) {
			$.ajax({
				url : '/missionReplies/' + m_r_num,
				type : 'delete',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				data : JSON.stringify({
					id :id
				}),
				dataType : 'text',
				error : function() {
					alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요.");
				},
				success : function(result) {
					if (result == 'SUCCESS') {
						alert('댓글 삭제가 완료되었습니다.');
						listAll(m_no);
					}else if(result =='FAILURE'){
						alert('작성자만 댓글 삭제가 가능합니다.');
					}
				}
			});
		}
	}

	//댓글 수정
	function updateForm(m_r_num, panel) {
		let content = panel.find(".body").html();
		content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
		$("#m_r_content").val(content);

		$("#missionReplyForm button[type='button']").attr("id",
				"btnReplyUpdate");
		$("#missionReplyForm button[type='button']").attr("data-rnum", m_r_num);
		$("#missionReplyForm button[type='button']").attr("class",
				"btn btn-sm btn-warning");
		$("#missionReplyForm button[type='button']").html("수 정");
	}
</script>

</head>
<body>

	<c:if test="${pvo.id != null}">
		<div class="my-3 p-3 bg-white rounded shadow-sm"
			style="padding-top: 10px">
			<div class="row">
				<form name="missionReplyForm" id="missionReplyForm">
					<div class="col-sm-11">
						<textarea id="m_r_content" class="form-control" rows="3"></textarea>
					</div>
					<div class="col-sm-1">

						<button type="button" class="btn btn-sm btn-primary"
							id="btnReplySave" style="width: 100%; margin-top: 40px">
							저 장</button>
					</div>
				</form>
			</div>
		</div>
	</c:if>
	<!-- Reply List {s}-->
	<div class="my-3 p-3 bg-white rounded shadow-sm"
		style="padding-top: 10px">
		<h5 class="border-bottom pb-2 mb-0 fw-bold">Reply list</h5>

		<div id="reviewList">
			<div id="item-template" class="media text-muted">
				<div class="panel-heading">

					<h5
						class="media-body pb-3 mb-0small lh-100 border-bottom horder-gray">
						<span class="name d-block fw-bold text-gray-dark"></span> <span
							class="date"></span>
						<button type="button" data-btn="upBtn" class="btn-sm btn-link">수정</button>
						<button type="button" data-btn="delBtn" class="btn-sm btn-link">삭제</button>
					</h5>

					<p class="body small"></p>
				</div>
			</div>
		</div>

	</div>
	 

</body>
</html>