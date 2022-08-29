<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<link rel="stylesheet" type="text/css" href="/resources/include/css/noticeDetail.css"/>
	
<script type="text/javascript">
	let buttonCheck=0;
	$(function(){
		$("#nextNotice").click(function(){
			let n_num = $(this).attr("data-num");
			$("#n_num").val(n_num+1);
			$("#nextNum").attr({
				"method" : "get",
				"action" : "/notice/noticeDetail"
			});
			$("#nextNotice").submit();
		});
	}); //$(function() 종료)
</script>
</head>
<body>
	<div class="contentContainer container">
		
		<form id="nextNum">
			<input type="hidden" id="n_num" name="n_num"/>
		</form>
		
		<!-- 공지사항 글 상세보기 시작 -->
		<div class="contentTB text-center">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="col-md-12" >
							<span class="span_left">${detail.n_title}</span>
							<span class="span_right"><em>등록일</em>${detail.n_date}</span>
						</td>
					</tr>
					<tr class="table-tr-height" >
						<td class="col-md-12">
							<br/>
							${detail.n_content}
							<c:if test="${not empty detail.n_img_file}">
								<img src="/uploadStorage/notice/${detail.n_img_file}"/>
							</c:if> 
						</td>
					</tr>
				</tbody>
			</table>
			<a href="/notice/noticeList"><button name="noticeList" id="noticeList">목록</button></a>
		</div>
	</div>
</body>