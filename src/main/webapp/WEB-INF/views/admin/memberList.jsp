<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="widtd=device-widtd, initial-scale=1">
<link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Login Form</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/include/dist/js/bootstrap.min.js"></script>
<script src="/resources/include/dist/assets/js/docs.min.js"></script>

<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    $('#myTable').dataTable();
});
</script>

</head>
<body>
	<div class="contentContainer container">
	<div class="contentTit page-header">
		<h3 class="text-center">회원 목록</h3>	
	</div>		
		<div class="table-responsive">
			<table id="myTable" class="display table" width="100%" >	 
				<thead>	
			        <tr>
			            <th>아이디</th>
			            <th>이름</th>
			            <th>이메일</th>
			            <th>핸드폰 번호</th>
			        </tr>
			    </thead>
			    
			    <tbody>     
			        <c:forEach var="row" items="${list}">
			        <tr>
			            <td>${row.id}</td>
			            <td>${row.name}</td>
			            <td>${row.email}</td>
			            <td>${row.phone}</td>
			        </tr>
			        </c:forEach>
			    </tbody>   
			     
			</table>
		</div>
	</div>
</body>
</html>