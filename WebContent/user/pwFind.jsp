<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="pwFind.jsp">
<title>Insert title here</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-theme.css" rel="stylesheet">
<link href="../css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="../css/plugins/social-buttons.css" rel="stylesheet">
<link href="../font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="../js/jquery-1.9.1.js"></script>
<script src="../js/bootstrap.min.js"></script>
   <script src="../js/plugins/metisMenu/metisMenu.min.js"></script>

<script src="../js/sb-admin-2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#email").keydown(function (key){
			if(key.keyCode == 13){
				retrieveUserPw();
			}

		});
	});

	function retrieveUserPw(){
		var id = $("#id").val();
		var email = $("#email").val();

		var param = {};

		param["id"] = id;
		param["email"] = email;

		var access = $("#message");

		$.ajax({
			url:"${context}/work/user/retrieveUserPw.do",
			contentType:"application/json",
			dataType:"json",
			data:param,
			success:function(result){
				access.html(result["checkMsg"]);
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>PW찾기</strong>&nbsp;<span class="glyphicon glyphicon glyphicon-pencil"></span></font></h1>
		</div>
	</div>
	<div class="container">
		<div class="form-horizontal" style="margin-bottom: 20%;">
			<hr/>

			<div class="form-group" style="margin-top: 5%;">
				<label for="email" class="control-label col-md-2">아이디</label>
				<div class="col-md-4">
					<input class="form-control" type="text" name="id" id="id" autofocus="autofocus"/>
				</div>
			</div>

			<div class="form-group">
				<label for="email" class="control-label col-md-2">이메일</label>
				<div class="col-md-4">
					<input class="form-control" type="email" name="email" id="email"/>
				</div>
				<div class="col-md-2">
					<input class="btn btn-default" type="button" name="btnSubmit" id="btnSubmit" value="확인" onclick="retrieveUserPw()"/>
				</div>
			</div>
			<div class="form-group" id="message">

			</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>