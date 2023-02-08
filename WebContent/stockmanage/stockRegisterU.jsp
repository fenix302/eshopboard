<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="stockRegisterU.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>문구점</title>

	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/jquery.form.js"></script>
	<script src="${context}/js/bootstrap.min.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

    <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="${context}/js/sb-admin-2.js"></script>
    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

    <script>

    var productCategoryCd;
    var imageFolder;

    $(document).ready(function() {
        $('#dataTables-example').dataTable();

        fn_init();

        fn_setProductCategoryCd();

      //U페이지 해당
		fn_setDetailInfo();
    });

	function fn_setDetailInfo(){
		$("#productCode").val('${dsProduct.PRODUCT_CODE}');
		$("#productName").val('${dsProduct.PRODUCT_NAME}');
		$("#productCategoryCd").val('${dsProduct.PRODUCT_CATEGORY_CD}');
		$("#productUnitPrice").val('${dsProduct.PRODUCT_UNIT_PRICE}');
		$("#productCount").val('${dsProduct.PRODUCT_COUNT}');

		var productImage = '${dsProduct.PRODUCT_IMAGE}';
		productImage = productImage.replace(/"/gi, "");

		$("#pic").attr("src", '${context}/' + imageFolder + '/' + productImage);
		$("#productImage").val(productImage);
	}

	function fn_save(){
		if(confirm("변경하시겠습니까?")){
			if(!fn_validation()) return;

			alert("제품정보가 변경되었습니다.");

			$("#updateProduct").submit();
		}
	}

	function fn_setProductCategoryCd(){
		productCategoryCd = '${dsProduct.PRODUCT_CATEGORY_CD}';

		if(productCategoryCd == 'O'){
			imageFolder = "officeImg";
		}else if(productCategoryCd == 'P'){
			imageFolder = "penImg";
		}else if(productCategoryCd == 'S'){
			imageFolder = "storageImg";
		}else if(productCategoryCd == 'D'){
			imageFolder = "designImg";
		}else if(productCategoryCd == 'B'){
			imageFolder = "binderImg";
		}

		$("#imageFolder").val(imageFolder);
	}

	function fn_upload(){
		$("#ajaxform").ajaxSubmit({
	        type: "POST",
	        dataType: 'text',
	        url: $("#ajaxform").attr("action"),
	        data: $("#ajaxform").serialize(),
	        success: function (data) {
	        	data2 = data.replace(/"/gi, "");
	        	var imageUrl = "${context}/" + imageFolder + "/" + data2;
	        	$("#pic").attr("src", imageUrl);
	        	$("#productImage").val(data2);
	        },
	        error: function (xhr, status, error) {
	            alert(error);
	        }
	    });
	}

	function fn_checkCategory(){
		if(productCategoryCd == undefined){
			alert("분류를 먼저 선택해주세요.");
			return false;
		}
	}
    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>제품수정</strong>&nbsp;<span class="glyphicon glyphicon-list-alt"></span></font></h1>
			<p>제품수정 페이지입니다.</p>
		</div>
	</div>
	<div class="container">
	<form id="updateProduct" method="post" action="${context}/work/product/updateProduct.do" role="form">
		<div class="form-horizontal">
			<div class="form-group" style="margin-top: 5%;">
				<label for="productName" class="control-label col-md-2"><b>제품명</b></label>
				<div class="col-md-4">
					<input class="form-control" type="text" name="productName" id="productName" required="required" autofocus="autofocus"/>
				</div>
			</div>

			<div class="form-group">
				<label for="productCategoryCd" class="control-label col-md-2"><b>분류</b></label>
				<div class="col-md-2">
		        	<select class="form-control" id="productCategoryCd" name="productCategoryCd" required="required" onchange="fn_setProductCategoryCd()">
						<c:forEach items="${dsCode1}" var="code1">
							<option value="${code1.commCd}">${code1.commCdNm}</option>
						</c:forEach>
		     		</select>
	     		</div>
			</div>

			<div class="form-group">
				<label for="productUnitPrice" class="control-label col-md-2"><b>단가</b></label>
				<div class="col-md-3">
					<input class="form-control" type="text" id="productUnitPrice" name="productUnitPrice" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
			</div>

			<div class="form-group">
				<label for="productCount" class="control-label col-md-2"><b>수량</b></label>
				<div class="col-md-3">
					<input class="form-control" type="text" id="productCount" name="productCount" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2"><b>제품이미지</b></label>
				<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="${context}/backgroundImage/defaultpic.png"><br/>
				<div class="col-md-6">
					<input type="hidden" id="productImage" name="productImage" required="required">
				</div>
			</div>
			<input type="hidden" id="productCode" name="productCode">
		</div>
	</form>

	<form id="ajaxform" action="${context}/work/product/saveFile.do" method="post" enctype="multipart/form-data" role="form">
		<div class="form-group">
		<label class="control-label col-md-2"></label>
			<div class="col-md-6">
				<input class="form-control" type="file" id="imageFile" name="imageFile" onchange="fn_upload()" onclick="return fn_checkCategory()"/>
				<input type="hidden" id="imageFolder" name="imageFolder">
			</div>
		</div>
		<br><br><br>
		<div class="form-group">
		<label class="control-label col-md-12"></label>
			<div class="col-md-1 col-md-offset-8">
				<button type="button" class="btn btn-success" onclick="fn_save()">수정하기</button>
			</div>
			<div class="col-md-1">
				<button type="button" class="btn btn-success" onclick="fn_back()">뒤로가기</button>
			</div>
		</div>
	</form>

	</div>

	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>