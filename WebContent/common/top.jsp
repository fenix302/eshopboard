<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ESHOP 쇼핑몰 프로그램</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/common.css" rel="stylesheet">
<script src="${context}/js/common.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
<style type="text/css">
li{
	cursor: pointer;
}
a{
	text-decoration:none !important;
}
</style>
</head>


<c:set var="homeUrl">${context}/work/product/goMain.do</c:set>
<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="officeUrl">${context}/work/product/retrieveProductList.do?category=O</c:set>
<c:set var="penUrl">${context}/work/product/retrieveProductList.do?category=P</c:set>
<c:set var="binderUrl">${context}/work/product/retrieveProductList.do?category=B</c:set>
<c:set var="designUrl">${context}/work/product/retrieveProductList.do?category=D</c:set>
<c:set var="storageUrl">${context}/work/product/retrieveProductList.do?category=S</c:set>
<body>
	<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
		<div class="container" style="background-color: black;">
			<ul class="nav navbar-nav">
				<li><a href="${homeUrl}"><font color="white"><strong>HS STATIONERY</strong></font></a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
						<a href="${context}/notice/list.jsp"><font color="white"><strong>공지사항</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
						<a href="${context}/notice/list.jsp"><font color="white"><strong>공지사항</strong></font></a>
					</c:if>
				</li>
				<li>
					<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
						<a href="${context}/work/cart/retrieveCartList.do"><font color="white"><strong>장바구니</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
						<a href="${context}/work/product/retrieveProductListForManage.do"><font color="white"><strong>재고관리</strong></font></a>
					</c:if>
				</li>
				<li>
					<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
						<a href="${context}/work/sell/retrieveBuyList.do"><font color="white"><strong>구매내역</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
						<a href="${context}/work/sell/retrieveStatisticsForProduct.do"><font color="white"><strong>매출통계</strong></font></a>
					</c:if>
				</li>
				<li>
					<c:if test="${sessionScope.id == null}">
						<a href="${context}/work/user/createUser.do"><font color="white"><strong>회원가입</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
						<a href="${context}/work/user/updateUser.do"><font color="white"><strong>정보수정</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
						<a href="${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=P"><font color="white"><strong>재고현황</strong></font></a>
					</c:if>
				</li>
				<li>
					<c:if test="${sessionScope.id == null}">
						<a href="${context}/user/login.jsp"><font color="white"><strong>LOGIN</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null}">
						<a href="${context}/work/user/logout.do"><font color="white"><strong>LOGOUT</strong></font></a>
					</c:if>
				</li>
			</ul>
		</div>
	</nav>
		<div class="container" style="background-color: white; margin-bottom: 2%;">
		<c:if test="${sessionScope.grade != 'A'}">
		  	<p style="font-size: 70px;"><a href="${context}/work/product/goMain.do" style="color: black;"><b>HS STATIONERY</b></a></p>
		  <ul class="list-inline">
		    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${penUrl}')" style="color: black; font-size: 25px;">필기류&nbsp;&nbsp;|</a></li>
		    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${officeUrl}')" style="color: black; font-size: 25px;">사무용품&nbsp;&nbsp;|</a></li>
		    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${storageUrl}')" style="color: black; font-size: 25px;">정리/수납용품&nbsp;&nbsp;|</a></li>
		    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${binderUrl}')" style="color: black; font-size: 25px;">화일/바인더&nbsp;&nbsp;|</a></li>
		    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${designUrl}')" style="color: black; font-size: 25px;">디자인문구&nbsp;&nbsp;</a></li>
		  </ul>
	  	</c:if>
	  	<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
	  		<p style="font-size: 70px;"><a href="${context}/work/product/goMain.do" style="color: black;"><b>HS STATIONERY</b></a></p>
	  		<h1>관리자 모드입니다.</h1>
	  	</c:if>
	</div>
</body>
</html>