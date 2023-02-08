<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="stockListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>문구점</title>

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
    });

    function fn_modifyProduct(paramProductCode){
		location.href = "${context}/work/product/updateProduct.do?productCode=" + paramProductCode;
    }

    function fn_createProduct(){
		location.href = "${context}/work/product/createProduct.do";
    }

    </script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
	<div id="jumbotron" class="container">
		<div class="jumbotron jumbotron-info" style="background-color: lightgray;">
			<h1><font color="black"><strong>재고관리</strong>&nbsp;<span class="glyphicon glyphicon-list-alt"></span></font></h1>
			<p>재고관리 페이지입니다.</p>
		</div>

		<div class="row">
			<div class="col-md-12">
				<div class="page-header" style="float: right;">
					  <button type="button" class="btn btn-info btn-lg" onclick="fn_createProduct()">제품추가</button>
				</div>
			</div>
			<div class="col-md-12">
			    <div class="panel panel-default">
			        <!-- /.panel-heading -->
			        <div class="panel-body">
			            <div class="table-responsive">
			                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
			                    <thead>
			                        <tr>
			                        	<th style="text-align: center; vertical-align: middle; width: 30px;">제품번호</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">제품이미지</th>
			                            <th style="text-align: center; vertical-align: middle; width: 80px;">제품이름</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">제품분류</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;">제품단가</th>
			                            <th style="text-align: center; vertical-align: middle; width: 50px;">제품재고</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;">정보변경</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${dsProductList}" var="dsProductList" varStatus="productIdx">
			                         <tr>
			                         	<td style="text-align: center; vertical-align: middle;">${dsProductList.PRODUCT_CODE}</td>
			                            <td style="text-align: center; vertical-align: middle;">
										<img name="image" width="110px" height="110px" src="${context}/binderImg/${dsProductList.PRODUCT_IMAGE}" class="img-thumbnail">
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
												path = $("img[name='image']").eq('${productIdx.index}').attr("src");

												existFolder = path.split("/")[2];
												$("img[name='image']").eq('${productIdx.index}').attr("src", path.replace(existFolder, imageFolder));
											</script>
			                            </td>
			                            <td style="text-align: center; vertical-align: middle;">${dsProductList.PRODUCT_NAME}</td>
			                            <td style="text-align: center; vertical-align: middle;">[${dsProductList.PRODUCT_CATEGORY_CD_NM}]</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsProductList.PRODUCT_UNIT_PRICE}원</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsProductList.PRODUCT_COUNT}</td>
			                            <td style="text-align: center; vertical-align: middle;">
			                            	<button type="button" class="btn btn-warning" onclick="fn_modifyProduct('${dsProductList.PRODUCT_CODE}')">정보변경</button>
			                            </td>
			                         </tr>
			                        </c:forEach>
			                    </tbody>
			                </table>
			            </div>
			            <!-- /.table-responsive -->
			        </div>
			        <!-- /.panel-body -->
			    </div>
			    <!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
			<div class="col-md-1 col-md-offset-11">
				<button type="button" class="btn btn-success btn-lg"  style="float:right;" onclick="fn_back()">뒤로가기</button>
			</div>
		</div>
	</div>
<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
</html>