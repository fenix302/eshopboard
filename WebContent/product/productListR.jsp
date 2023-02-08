<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="productListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>HS VOTE</title>

	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">

    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/bootstrap.min.js"></script>

    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

    <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="${context}/js/sb-admin-2.js"></script>

    <script>

	var existFolder = '';
	var imageFolder = '';
	var path = '';

    $(document).ready(function() {
        $('#dataTables-example').dataTable();
// 		fn_setImage();
    });

// 	function fn_setImage(){
// 		alert("fn_setImage()");
//         var productCategoryCd = '${dsProductList[0].PRODUCT_CATEGORY_CD}';

//         alert("productCategoryCd : " + productCategoryCd);

// 		if(productCategoryCd == 'O'){
// 			imageFolder = "officeImg";
// 		}else if(productCategoryCd == 'P'){
// 			imageFolder = "penImg";
// 		}else if(productCategoryCd == 'S'){
// 			imageFolder = "storageImg";
// 		}else if(productCategoryCd == 'D'){
// 			imageFolder = "designImg";
// 		}else if(productCategoryCd == 'B'){
// 			imageFolder = "binderImg";
// 		}
// 	}

	function fn_showResult(paramVoteCode, paramVoteCount){
		if(paramVoteCount == 0){
			alert("참여자가 없습니다.");
		}else{
			location.href = "${context}/work/result/retrieveResult.do?voteCode=" + paramVoteCode;
		}
	}

	function fn_checkVote(paramVoteCode){
		var param = {};

		param["voteCode"] = paramVoteCode;

		$.ajax({
			url:"${context}/work/result/retrieveExampleNo.do",
			contentType:"application/json",
			dataType:"json",
			data:param,
			success:function(result){
				if(result["checkMsg"] == "success"){
					fn_doVote(paramVoteCode);
					return true;
				}else if(result["checkMsg"] == "fail"){
					alert("이미 투표하셨습니다.");
					return false;
				}
			}
		});
	}

    </script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<br><br><br>
	<div class="container">
		<div class="page-header">
			<h1>${dsProductList[0].PRODUCT_CATEGORY_CD_NM}</h1>
		</div>
		<div class="jumbotron">
			<div class="row">
				<c:forEach items="${dsProductList}" var="dsProductList" varStatus="dsProductIdx">
					<div class="col-md-6">
						<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}"><img name="image" src="${context}/binderImg/${dsProductList.PRODUCT_IMAGE}" class="img-thumbnail"></a>
						<script type="text/javascript">
						 	var productCategoryCd = '${dsProductList.PRODUCT_CATEGORY_CD}';

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
							path = $("img[name='image']").eq('${dsProductIdx.index}').attr("src");

							existFolder = path.split("/")[2];
							$("img[name='image']").eq('${dsProductIdx.index}').attr("src", path.replace(existFolder, imageFolder));
						</script>
						<div class="row" style="background-color: white; margin-left: 0.01%; width: 93%; height:130px; border:1px solid lightgray;">
							<div class="col-md-12">
								<h4><font color="red"><b>${dsProductList.PRODUCT_NAME}</b></font></h4>
					        </div>
					        <div class="col-md-12">
					        	<h4 style="font-family: inherit;"><b>${dsProductList.PRODUCT_UNIT_PRICE}원</b></h4>
					        </div>
					        <div class="col-md-12">
						        <h4 style="font-family: inherit;"><font color="lightblack"><b>남은 수량 : ${dsProductList.PRODUCT_COUNT}</b></font></h4>
					        </div>
				        </div>
				        <c:if test="${dsProductIdx.index % 2 == 1}">
							&nbsp;
						</c:if>
					</div>
				</c:forEach>
				</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>