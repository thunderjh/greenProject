<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/MissionCommon.jspf"%>
<!-- 미션인증게시판댓글 -->
<script type="text/javascript">
	$(function() {
		let m_no = ${detail.m_no};
		let id = 
		listAll(m_no);
		
		$("#btnReplySave").click(function(){
			let insertUrl ="/replies/여기넣어";
			let value = JSON.stringify({
				m_no : m_mo,
				id : 
			})
		});
	});

	//댓글 목록 보여주는 함수
	function listAll(m_no) {

	}
</script>

</head>
<body>

	<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
		<form name="missionReplyForm" id="missionReplyForm">
			<div class="row">
				<div class="col-sm-11">
					<textarea id="content" class="form-control"
						rows="3" placeholder="댓글을 입력해 주세요"></textarea>
				</div>
				<div class="col-sm-1">
					
					<button type="button" class="btn btn-sm btn-primary"
						id="btnReplySave" style="width: 100%; margin-top: 40px">
						저 장</button>
				</div>
			</div>
		</form>
	</div>
	<!-- Reply Form {e} -->
	<!-- Reply List {s}-->
	<div class="my-3 p-3 bg-white rounded shadow-sm"
		style="padding-top: 10px">
		<h5 class="border-bottom pb-2 mb-0">댓글 리스트</h5>
		<div id="replyList"></div>
	</div>
	 
	<!-- Reply List {e}-->

</body>
</html>