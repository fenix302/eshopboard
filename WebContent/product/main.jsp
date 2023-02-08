<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="main.jsp">
<title>HS STATIONERY</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
</head>

<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="officeUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[0].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="penUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[1].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="binderUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[2].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="designUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[3].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="storageUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[4].PRODUCT_CATEGORY_CD}</c:set>

<c:set var="productManageUrl">${context}/work/product/retrieveProductListForManage.do</c:set>
<c:set var="statisticsForProductUrl">${context}/work/sell/retrieveStatisticsForProduct.do</c:set>
<c:set var="statisticsForStockUrl">${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=P</c:set>

<script type="text/javascript"></script>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
			<c:if test="${sessionScope.grade != 'A'}">
				<div class="row">
					<div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
				    <!-- Indicators -->
					<ol class="carousel-indicators">
				    	<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				        <li data-target="#myCarousel" data-slide-to="1"></li>
				        <li data-target="#myCarousel" data-slide-to="2"></li>
				        <li data-target="#myCarousel" data-slide-to="3"></li>
				        <li data-target="#myCarousel" data-slide-to="4"></li>
				    </ol>

					<div class="carousel-inner" role="listbox">
						<div class="item active">
					    	<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${officeUrl}')"><img src="${context}/officeImg/${dsProductList[0].PRODUCT_IMAGE}" style="width: 54.6%; max-height: 700px !important; margin: auto;"></a>
					    </div>
						<div class="item">
					    	<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${penUrl}')"><img src="${context}/penImg/${dsProductList[1].PRODUCT_IMAGE}" style="width: 54.6%; max-height: 700px !important; margin: auto;"></a>
					    </div>
					    <div class="item">
					    	<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${binderUrl}')"><img src="${context}/binderImg/${dsProductList[2].PRODUCT_IMAGE}" style="width: 54.6%; max-height: 700px !important; margin: auto;"></a>
					    </div>
					    <div class="item">
					    	<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${designUrl}')"><img src="${context}/designImg/${dsProductList[3].PRODUCT_IMAGE}" style="width: 54.6%; max-height: 700px !important; margin: auto;"></a>
					    </div>
					    <div class="item">
					    	<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${storageUrl}')"><img src="${context}/storageImg/${dsProductList[4].PRODUCT_IMAGE}" style="width: 54.6%; max-height: 700px !important; margin: auto;"></a>
					    </div>
					        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
					            <span class="glyphicon glyphicon-chevron-left"></span>
					        </a>
					        <a class="right carousel-control" href="#myCarousel" data-slide="next">
					            <span class="glyphicon glyphicon-chevron-right"></span>
					        </a>
						</div>
					</div>
					<hr>
				</div>
			<div class="container">
				<div class="page-header">
					<h1>화일/바인더</h1>
				</div>
				<div class="jumbotron">
					<div class="row">
						<c:forEach items="${dsBinderList}" var="dsBinderList">
							<div class="col-md-4">
								<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${binderUrl}')"><img src="${context}/binderImg/${dsBinderList.PRODUCT_IMAGE}" class="img-thumbnail"></a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="page-header">
					<h1>디자인문구</h1>
				</div>
				<div class="jumbotron">
					<div class="row">
						<c:forEach items="${dsDesignList}" var="dsDesignList">
							<div class="col-md-3">
								<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${designUrl}')"><img src="${context}/designImg/${dsDesignList.PRODUCT_IMAGE}" class="img-circle" width="100%" height="100%"></a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="page-header">
					<h1>사무용품</h1>
				</div>
				<div class="jumbotron">
					<div class="row">
						<c:forEach items="${dsOfficeList}" var="dsOfficeList" varStatus="officeIdx">
							<div class="col-md-4">
								<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${officeUrl}')"><img src="${context}/officeImg/${dsOfficeList.PRODUCT_IMAGE}" class="img-thumbnail" width="100%" height="100%"></a>
								<c:if test="${officeIdx.index == 2}">
									&nbsp;
								</c:if>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="page-header">
					<h1>필기류</h1>
				</div>
					<div class="row">
						<c:forEach items="${dsPenList}" var="dsPenList" varStatus="penIdx">
							<div class="col-md-3">
								<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${penUrl}')"><img src="${context}/penImg/${dsPenList.PRODUCT_IMAGE}" class="img-rounded" width="100%" height="100%"></a>
								<c:if test="${penIdx.index == 3}">
									&nbsp;
								</c:if>
							</div>
						</c:forEach>
					</div>
			</div>
			<div class="container">
				<div class="page-header">
					<h1>정리/수납용품</h1>
				</div>
				<div class="jumbotron">
					<div class="row">
						<c:forEach items="${dsStorageList}" var="dsStorageList">
							<div class="col-md-2">
								<a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${storageUrl}')"><img src="${context}/storageImg/${dsStorageList.PRODUCT_IMAGE}" class="img-rounded" width="100%" height="100%"></a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			</c:if>
			<c:if test="${sessionScope.grade == 'A'}">
			<div class="container" style="margin-top: 10%; margin-bottom: 10%">
				<div class="row">
					<div class="col-md-4">
					    <a href="${productManageUrl}" class="btn btn-primary" style="width: 100%; height: 250px;" role="button">
							<h1><span class="glyphicon glyphicon-list-alt" style="font-size: 80px; margin-top: 5%;"></span> <br/>재고관리</h1>
						</a>
					</div>
					<div class="col-md-4">
					    <a href="${statisticsForProductUrl}" class="btn btn-danger" style="width: 100%; height: 250px;" role="button">
							<h1><span class="glyphicon glyphicon-signal" style="font-size: 80px; margin-top: 5%;"></span> <br/>매출통계</h1>
					    </a>
					</div>
					<div class="col-md-4">
					    <a href="${statisticsForStockUrl}" class="btn btn-info" style="width: 100%; height: 250px;" role="button">
							<h1><span class="glyphicon glyphicon-eye-open" style="font-size: 80px; margin-top: 5%;"></span> <br/>재고현황</h1>
		    		    </a>
					</div>
				</div>
			</div>
			</c:if>

	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>